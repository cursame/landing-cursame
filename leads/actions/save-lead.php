<?php

	$response = array('status' => 0, 'message' => '');

	$name = $core -> cleanVar($_POST['name']);
	$email = $core -> cleanVar($_POST['email']);
	$phone = $core -> cleanVar($_POST['phone']);
	$school = $core -> cleanVar($_POST['school']);
	$students = $core -> cleanVar($_POST['students']);
	$comments = $core -> cleanVar($_POST['comments']);
	$source = 1;
	$captcha = $_POST['captcha'];

	if(empty($name) or empty($email) or empty($phone)){
		$response['message'] = "Indica todos los campos";
 	}
	else if(!preg_match( "/^[A-Za-z0-9][A-Za-z0-9_.-]*@[A-Za-z0-9_-]+\.[A-Za-z0-9_.]+[A-za-z]$/", $email)){
	 	$response['message'] = "El e-mail proporcionado es incorrecto";
 	}

	else if(!empty($captcha)){
		$response['message'] = "Hemos detectado que eres un robot";
	}

	else if(strlen($phone) != 10 or !is_numeric($phone)){
		$response['message'] = "El teléfono debe contener 10 números solamente";
	}

	else if($phone == '1234567890' or $phone == '0987654321' or preg_match("/(.)\\1{4}/", $phone)){
		$response['message'] = "El teléfono indicado es incorrecto";
	}

	if(empty($response['message'])){

		$encryption_key = $config -> access_client.$config -> access_token;
		$created_date = date('Y-m-d H:i:s');

		$email_exists = $db -> select('leads', array('conditions' => array("CAST(AES_DECRYPT(email, '{$encryption_key}') AS CHAR) = '{$email}'", "AND" => "source_id = '{$source}'")));

		if(count($email_exists) == 0){

			$query = "INSERT INTO leads
					  SET
					 		id = 0,
							name = AES_ENCRYPT('{$name}', '{$encryption_key}'),
							phone = AES_ENCRYPT('{$phone}', '{$encryption_key}'),
							email = AES_ENCRYPT('{$email}', '{$encryption_key}'),
							school = '{$school}',
							students = '{$students}',
							comments = '{$comments}',
							source_id = '{$source}',
							created_date = '{$created_date}'
					 ";

			$query_result = $db -> query($query,'',false);

		}

		require_once("classes/class.phpmailer.php");
		require_once('classes/class.smtp.php');

		$tplEmail = new XTemplate('templates/email.html');
		$source_info = $db -> select('sources', array('conditions' => array("id = '{$source}'")));

		$tplEmail -> assign('__NAME__', $name);
		$tplEmail -> assign('__EMAIL__', $email);
		$tplEmail -> assign('__PHONE__', $phone);
		$tplEmail -> assign('__SCHOOL__', $school);
		$tplEmail -> assign('__STUDENTS__', $students);
		$tplEmail -> assign('__COMMENTS__', $comments);
		$tplEmail -> assign('__VERSION__', $version);
		$tplEmail -> assign('__SOURCE__', $source_info[0] -> name);

		$tplEmail -> parse('main');

		$mail = new PHPMailer();

		//$mail->SMTPDebug = 2;
		$mail -> CharSet 	= "UTF-8";
		$mail -> Subject    = "Información recibida";
		$mail -> IsSMTP();
		$mail -> SMTPAuth   = true;
		$mail -> SMTPSecure = 'ssl';
		$mail -> Port       = $config -> smtp_port;
		$mail -> Host       = $config -> smtp_host;
		$mail -> Username   = $config -> smtp_username;
		$mail -> Password   = $config -> smtp_password;
		$mail -> SetFrom($config -> smtp_username, 'Cúrsame');
		$mail -> AltBody    = "Habilita el formato HTML para visualizar correctamente este mensaje";

		$body = $tplEmail -> render('main');
		$mail -> MsgHTML($body);

		$mail -> ClearAddresses();
		$mail -> AddAddress($config -> email_response,$config -> email_response);
		$mail -> Send();

		$response['status'] = 1;

	}

	echo json_encode($response);

?>
