<?php


			require_once('classes/class.phpmailer.php');
			include("classes/class.smtp.php");

			$tplEmail =  new Xtemplate("templates/email.html");
			$tplEmail -> parse('main');
			$body = $tplEmail -> render('main');

			$mail = new PHPMailer();

			$mail->CharSet = 'UTF-8';
			$mail->IsSMTP();
			$mail->SMTPDebug  = 0;
			$mail->SMTPAuth   = true;
			$mail->SMTPSecure = "ssl";
			$mail -> Port       = $config -> smtp_port;
			$mail -> Host       = $config -> smtp_host;
			$mail -> Username   = $config -> smtp_username;
			$mail -> Password   = $config -> smtp_password;
			//$mail->SetFrom($mail->Username, 'Cursame');
			$mail -> Subject = 'Test';
			$mail -> AltBody = 'test';
			$mail->MsgHTML($body);
			$mail->ClearAddresses();
			$mail->AddAddress('cdp@virket.com', 'cdp@virket.com');


			if(!$mail->Send()){
				echo "Mailer Error: " . $mail->ErrorInfo;
			}
			else{
				echo "test OK";
			}




?>
