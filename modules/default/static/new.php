<?php 
$error=array();
if (isset($_POST['add-new'])) {
	if(empty($_POST['secondname'])) $error['secondname']='укажите фамилию';
	if(empty($_POST['firstname'])) $error['firstname']='укажите имя';
	

	if (!count($error)) {
		query(
		"INSERT INTO `patients` SET
			`secondname`     ='".escape($sname=ucwords(trimAll($_POST['secondname'])))."',
			`firstname`      ='".escape($fname=ucwords(trimAll($_POST['firstname'])))."',
			`gender`         ='".escape($_POST['gender'])."',
			`tel`            ='".escape(trimAll($_POST['tel']))."',
			`age`            =".(int)$_POST['age'].",
			`date-of-visit`  ='".$_POST['date-of-visit']."',
			`comment`        ='".escape(trimAll($_POST['comment']))."',
			`date`           =NOW()"
		); 
		
		$_SESSION['info']='Пациент <b>'.$sname.' '.$fname.'</b> c id № '.mysqli_insert_id($link).' успешно добавлен';
		header('Location: /static/main'); 
		exit();
	}
}
/*
$i=0;
while ($i<100) {
	$i++;
	
		query(
		"INSERT INTO `patients` SET
			`secondname`     ='".escape(ucfirst(trimAll($_POST['secondname']=generatePassword())))."',
			`firstname`      ='".escape(ucfirst(trimAll($_POST['firstname']=generatePassword())))."',
			`gender`         ='".escape($_POST['gender']=generatePassword())."',
			`tel`            ='".$_POST['tel']=generatePassword()."',
			`age`            ='".$_POST['age']=generatePassword()."',
			`date-of-visit`  ='".$_POST['date-of-visit']=generatePassword()."',
			`comment`        ='".escape(trimAll($_POST['comment']=generatePassword()))."',
			`date`           = NOW()"
		); 
	
}*/
?>