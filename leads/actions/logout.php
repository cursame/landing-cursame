<?php
	
	$core -> clearSession('user');
	$core -> redirect($config -> domain.'login');
	
?>