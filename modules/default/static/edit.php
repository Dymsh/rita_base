<?php 
$all=null;
$date=null;
if (isset($_GET['view']) && $_GET['view'] == 'all') {
	$date='disabled';
}
else $all='disabled';

if (isset($_GET['id'])) {
	$row=query("SELECT * FROM `patients` WHERE `id` = '".$_GET['id']."' LIMIT 1");
	
	if (mysqli_num_rows($row)){
		$result=mysqli_fetch_assoc($row);
	}
	else {
		$_SESSION['info'] = 'запись id № '.$_GET['id'].' в базе отсутствует';
		header ('Location: /static/main');
		exit();
	}
}

if (isset($_POST['edit'])) {
	if ($date=='disabled') {
		query("UPDATE `patients` SET
				`secondname`     ='".escape(ucwords(trimAll($_POST['secondname'])))."',
				`firstname`      ='".escape(ucwords(trimAll($_POST['firstname'])))."',
				`gender`         ='".escape($_POST['gender'])."',
				`tel`            ='".escape(trimAll($_POST['tel']))."',
				`age`            =".(int)$_POST['age'].",
				`comment`        ='".escape(trimAll($_POST['comment']))."',
				`lastdate`  =NOW() 
			WHERE `id` = ".$_POST['requiested']." "
		);
	}
	else query("UPDATE `patients` SET
			`date-of-visit`  ='".$_POST['date-of-visit']."' 
			WHERE `id` = ".$_POST['requiested']."
		");
		
	$_SESSION['info'] = 'запись id № '.$_POST['requiested'].' успешно обнавлена';
	header ('Location: /static/main');
	exit();
}
