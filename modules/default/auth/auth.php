<?php 
if (isset($_POST['auth_sub'])) {
	$row=query("SELECT * FROM `users` WHERE `auth_name` = '".$_POST['auth_name']."' AND `auth_pas` = '".$_POST['auth_pas']."'  LIMIT 1");
	if (!mysqli_num_rows($row)) {
		$_SESSION['info'] = 'Неверная пара логин - пароль.';
		header('Location: /auth/auth');
		exit();
	}
	$result=mysqli_fetch_assoc($row);
	$_SESSION['info'] = 'Добро пожаловать '.$result['auth_name'];
	$_SESSION['auth'] = 'enter';
	header('Location: /static/main');
	exit();
}
?>