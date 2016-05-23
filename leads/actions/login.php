<?php
	
	$username = $core -> cleanVar($_POST['username']);
	$password = $core -> cleanVar($_POST['password']);
	
	if(!(empty($username) or empty($password))){
		
		$user_info = $db -> select('users', array('conditions' => array("username = '{$username}'", 'AND' => "password = '".hash('sha256', $password)."'", 'AND ' => "status = 1")));
		
		if(count($user_info) > 0){
			
			$user_session = array('id' => $user_info[0] -> id, 'name' => $user_info[0] -> name);
			$core -> setSession('user', $user_session);
			
			$core -> redirect($config -> domain.'leads');
		}
		else{
			$core -> setMessage(array('El usuario o contraseña son incorrectos'),'error');
			$core -> redirect($config -> domain.'login');
		}
	}
	else{
		
		$core -> setMessage(array('Debes indicar tu usuario y contraseña'),'error');
		$core -> redirect($config -> domain.'login');
	}
	
	
?>