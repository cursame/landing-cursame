<?php
	error_reporting('0');


	/**
	 * PHP 5
	 *
	 * SoulPHP : Mini-Framework (http://soulphp.com)
	 * Copyright 2013, Christopher Díaz Pantoja
	 *
	 * Licensed under The MIT License
	 * Redistributions of files must retain the above copyright notice.
	 *
	 * @copyright     Copyright 2013, Copyright 2013, Christopher Díaz Pantoja
	 * @link          http://soulphp.com SoulPHP Mini-Framework
	 * @since         SoulPHP v 1.0.0
	 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
	 */

	 session_start();

	require_once("configuration.php");
	require_once("classes/query.class.php");
	require_once("classes/core.class.php");
	require_once("classes/xtemplate.class.php");

	date_default_timezone_set($config->timezone);

	$config = new Configuration();

	$core = new Core();
	$db = new QueryClass(array("hostname"=>$config->host,"database"=>$config->db,"username"=>$config->user,"password"=>$config->password));

	$core->createSession();

	$default_template = "default.html";
	$qs_action = $_GET["action"];
	$qs_section = !empty($_GET["section"])?$_GET["section"]:$config->section;
	$qs_module = $_GET["module"];
	$qs_module_response = $_GET["response"];


	if(empty($qs_action)){

		if(!empty($qs_module)){


			if(!file_exists("modules/".$qs_module."/index.php")){
				echo "fail loading module";
			}
			else{

				$tplModule = new XTemplate("modules/".$qs_module."/templates/default.html");

				require_once("modules/".$qs_module."/index.php");

				if($qs_module_response != "json"){

					$tplModule -> parse("main");
					echo $tplModule -> render("main");

				}

			}

		}
		else{



			if($qs_section == "login" or $qs_section == "leads") $default_template = "leads.html";

			$tplSite = new XTemplate("templates/".$default_template);

			$tplSite -> assign("__META_AUTHOR__",  $config->author);
			$tplSite -> assign("__SITE_INDEX__", $config->index);

			$messages = $core -> getMessage();


			if($messages){

				$tplSite -> assign("__MESSAGE_TYPE__", $messages["type"]);

				foreach($messages['messages'] as $message){

					$tplSite -> assign("__MESSAGE_TEXT__", $message);
					$tplSite -> parse("main.messages.message");


				}

				$tplSite -> parse("main.messages");
				$core -> clearSession("message");

			}


			/**********************************************
			* Customer Rules
			**********************************************/

			$tplSite -> assign("__SITE_DOMAIN__", $config -> domain);
			$tplSite -> assign("__SITE_NAME__", $config -> title);


			/**********************************************/

			if(!file_exists("sections/".$qs_section."/index.php")){
				$qs_section = "error404";
			}



			$tplSection = new XTemplate("sections/".$qs_section."/templates/default.html");
			$tplSection -> assign("__SITE_DOMAIN__", $config -> domain);

			require_once("sections/".$qs_section."/index.php");
			$tplSection -> parse("main");

			$tplSite -> assign("__CONTENT__", $tplSection -> render("main"));
			$tplSite -> parse("main");
			$tplSite -> out("main");

		}


	}
	else{

		if(!file_exists("actions/".$qs_action.".php")){
			header("Location: {$config -> site}error404");
		}
		else{
			require_once("actions/".$qs_action.".php");
		}


	}

?>
