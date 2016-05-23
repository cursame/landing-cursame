<?php

	if(!$user_session = $core -> isUserLogged()){
		$core -> redirect($config -> domain.'login');
		die();
	}



	$core->setTitle('Leads | '.$config -> title);
	$core->setMetaDescription('Leads');
	$core -> setStyle($config -> domain.'sections/leads/styles/default.css');
	$core -> setStyle($config -> domain.'scripts/libraries/jquery-ui/jquery-ui.css');
	$core -> setScript($config -> domain.'scripts/libraries/jquery-ui/jquery-ui.js');
	$core -> setScript($config -> domain.'scripts/reports.js');

	$tplSection -> assign("__SITE_DOMAIN__", $config -> domain);

	$respages = 20;
    $curpage = empty($_GET['page'])?1:$_GET['page'];

	$search_keywords = $core -> cleanVar($_GET['keywords']);
	$filter_date_begin = $core -> cleanVar($_GET['filter_date_begin']);
    $filter_date_end = $core -> cleanVar($_GET['filter_date_end']);
	$filter_source = $core -> cleanVar($_GET['filter_source']);

	//$tplSite -> assign('__SEARCH_KEYWORDS__', $search_keywords);
	$tplSection -> assign('__FILTER_DATE_BEGIN__', $filter_date_begin);
	$tplSection -> assign('__FILTER_DATE_END__', $filter_date_end);

	$tplSite -> parse('main.navigation');

	$encryption_key = $config -> access_client.$config -> access_token;

		$params = array('fields' => 'count');

		if(!empty($search_keywords)){


			$params['conditions'] = array(
										  "
										   id = '{$search_keywords}' OR
										   CAST(AES_DECRYPT(name, '{$encryption_key}') AS CHAR) LIKE '%{$search_keywords}%' OR
										   CAST(AES_DECRYPT(email, '{$encryption_key}') AS CHAR) = '{$search_keywords}'
										  ");

		}
		else{

			if(!empty($filter_date_begin) and !empty($filter_date_end)){
				$params['conditions'] = array("(created_date BETWEEN '{$filter_date_begin} 00:00:00' AND '{$filter_date_end} 23:59:59')");
			}

			if(!empty($filter_source)){
				$params['conditions']['AND'] = "source_id = '{$filter_source}'";
			}

		}

		$leads_count = $db -> select('leads', $params);
		$paginator = $core -> pagerResults($leads_count, $respages, $curpage);

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

		$params['order'] = array('created_date' => 'DESC');
		$params['limit'] = $paginator['begin'].','.$respages;

		$filter_sources = $db -> select('sources');

		foreach($filter_sources as $source){
			$tplSection -> assign('__SOURCE_VALUE__', $source -> id);
			$tplSection -> assign('__SOURCE_NAME__', $source -> name);

			if($filter_source == $source -> id){
				$tplSection -> assign('__SOURCE_SELECTED__', "selected");
			}
			else{
				$tplSection -> assign('__SOURCE_SELECTED__', "");
			}

			$tplSection -> parse('main.source_filter');
		}

		$leads_list = $db -> select('leads', $params);

		if($leads_count > 0){

			$tplSection -> assign('__TOTAL_LEADS__', $leads_count);

			foreach($leads_list as $lead){

				$source_info = $db -> select("sources", array("conditions" => array("id = '{$lead -> source_id}'")));
				$mx_date = strtotime($lead -> created_date) - (6 * 3600);
				$mx_date = date('Y-m-d H:i:s', $mx_date);

				$tplSection -> assign('__LEAD_ID__', $lead -> id);
				$tplSection -> assign('__LEAD_NAME__', $lead -> name);
				$tplSection -> assign('__LEAD_PHONE__', $lead -> phone);
				$tplSection -> assign('__LEAD_EMAIL__', $lead -> email);
				$tplSection -> assign('__LEAD_SCHOOL__', $lead -> school);
				$tplSection -> assign('__LEAD_STUDENTS__', $lead -> students);
				$tplSection -> assign('__LEAD_COMMENTS__', $lead -> comments);
				$tplSection -> assign('__LEAD_SOURCE__', $source_info[0] -> name);
				$tplSection -> assign('__LEAD_CREATED__', $mx_date);

				$tplSection -> parse('main.leads.lead');


			}

			$tplSection -> assign('__TOTAL_PAGES__', $paginator["pages"]);

			if($paginator["pages"] > 1){

				if($paginator["range"]["prev"] !== false){
					$tplSection -> assign("__PAGER_PREV__", $paginator["range"]["prev"]);
					$tplSection -> parse("main.leads.pager.prev");
				}

				foreach($paginator["links"] as $page){
					$tplSection -> assign("__PAGER_NUMBER__", $page);

					if($page == $curpage){
						$tplSection -> assign("__PAGER_CLASS__", "selected");
					}
					else{
						$tplSection -> assign("__PAGER_CLASS__", "");
					}

					$tplSection -> parse("main.leads.pager.number");
				}


				if($paginator["range"]["next"] !== false){
					$tplSection -> assign("__PAGER_NEXT__", $paginator["range"]["next"]);
					$tplSection -> parse("main.leads.pager.next");
				}

				$tplSection -> parse("main.leads.pager");

			}

			$tplSection -> parse('main.leads');

		}
		else{
			$tplSection -> parse('main.msg');
		}



?>
