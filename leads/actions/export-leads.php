<?php

	if(!$user_session = $core -> isUserLogged()){
		die();
	}


		$filter_date_begin = $core -> cleanVar($_GET['filter_date_begin']);
        $filter_date_end = $core -> cleanVar($_GET['filter_date_end']);

		$encryption_key = $config -> access_client.$config -> access_token;

		$params['fields'] = array(
									"id",
									"CAST(AES_DECRYPT(name, '{$encryption_key}') AS CHAR) AS name",
									"CAST(AES_DECRYPT(phone, '{$encryption_key}') AS CHAR) AS phone",
									"CAST(AES_DECRYPT(email, '{$encryption_key}') AS CHAR) AS email",
									"school",
									"students",
									"comments",
									"source_id",
									"created_date"
							      );

		if(!empty($filter_date_begin) and !empty($filter_date_end)){
			$params['conditions'] = array("(created_date BETWEEN '{$filter_date_begin} 00:00:00' AND '{$filter_date_end} 23:59:59')");
		}


		$params['order'] = array('created_date' => 'DESC');

		$leads_list = $db -> select('leads', $params);



		require_once ('classes/PHPExcel.php');

	  	$objPHPExcel = new PHPExcel();

	  	$objPHPExcel -> getProperties() -> setCreator("leads")
									  	-> setLastModifiedBy("Leads")
										-> setTitle("reporte_leads")
										-> setSubject("Reporte Leads")
										-> setDescription("Reporte de leads")
										-> setKeywords("")
										-> setCategory("");

		$objPHPExcel -> setActiveSheetIndex(0)
	  											-> setCellValue('A1', 'Id')
            									-> setCellValue('B1', 'Nombre')
												-> setCellValue('C1', 'Teléfono')
												-> setCellValue('D1', 'Email')
												-> setCellValue('E1', 'Escuela')
												-> setCellValue('F1', 'Estudiantes')
												-> setCellValue('G1', 'Comentarios')
												-> setCellValue('H1', 'Origen')
												-> setCellValue('I1', 'Fecha de creación');


		$row_counter = 2;

	  	foreach($leads_list as $record){

			$source_info = $db -> select("sources", array("conditions" => array("id = '{$record -> source_id}'")));
			$mx_date = strtotime($record -> created_date) - (6 * 3600);
			$mx_date = date('Y-m-d H:i:s', $mx_date);

			$objPHPExcel -> setActiveSheetIndex(0) -> setCellValue('A'.$row_counter, $record -> id)
												   -> setCellValue('B'.$row_counter, $record -> name)
												   -> setCellValue('C'.$row_counter, $record -> phone)
												   -> setCellValue('D'.$row_counter, $record -> email)
												   -> setCellValue('E'.$row_counter, $record -> school)
												   -> setCellValue('F'.$row_counter, $record -> students)
												   -> setCellValue('G'.$row_counter, $record -> comments)
												   -> setCellValue('H'.$row_counter, $source_info[0] -> name)
												   -> setCellValue('I'.$row_counter, $mx_date)
												   ;


			$row_counter ++;

		}



		$objPHPExcel->getActiveSheet()->setTitle("reporte");
		$objPHPExcel->setActiveSheetIndex(0);

		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="reporte_leads.xls"');
		header('Cache-Control: max-age=0');
		header('Cache-Control: max-age=1');

		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');
		header ('Cache-Control: cache, must-revalidate');
		header ('Pragma: public');

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$objWriter -> save('php://output');

		exit;



?>
