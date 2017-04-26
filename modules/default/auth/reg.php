<?php 
if (isset($_POST['reg_sub'])) {
	$row=query("SELECT * FROM `users` WHERE `auth_name` = '".$_POST['auth_name']."' LIMIT 1");
	if (mysqli_num_rows($row)) {
		$_SESSION['info'] = 'Такой пользователь уже существует.';
		header('Location: /auth/reg');
		exit();
	}
	query("INSERT INTO `users` SET
		`auth_name` = '".$_POST['autn_name']."',
		`auth_pas` = '".."'
	");
	$result=mysqli_fetch_assoc($row);
	$_SESSION['info'] = 'Добро пожаловать '.$result['auth_name'];
	$_SESSION['auth'] = 'enter';
	header('Location: /static/main');
	exit();
}
?>