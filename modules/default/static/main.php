<?php 
if (isset($_GET['auth']) && $_GET['auth']=='out') {
	unset($_SESSION['auth']);
}	

if (!isset($_SESSION['auth']) || $_SESSION['auth'] != 'enter') {
	header ('Location: /auth/auth');
	exit();
}

if (isset($_SESSION['info'])){
	$info=$_SESSION['info'];	unset($_SESSION['info']);
}

 
//   ranging	 --------------------------------------------------------  ranging

if (!isset($_SESSION['ranging'])) {
	$_SESSION['ranging'] = '`id` DESC';
}

if (isset($_GET['ranging'])) {
	$_SESSION['ranging'] = $_GET['ranging'];
}

//   ranging	 --------------------------------------------------------  ranging
if(isset($_POST['btn_del_all'])) {

	if(!isset($_POST['delall'])) {
		$_SESSION['info'] = 'Ничего не выбрано для удаления';
		header('Location: /static/main');
		exit ();
	}
	$temp = implode (',',$_POST['delall']);
	query("DELETE FROM `patients` WHERE `id` IN (".$temp.")");
	$info = 'Записи с номерами <b> '.$temp.' </b>удалены.';
}

if (isset($_GET['action']) && $_GET['action']=='del') {
	query("DELETE FROM `patients` WHERE `id` = '".$_GET['id']."'");
	$_SESSION['info']='запись id № '.$_GET['id'].' уcпешно удалена';
	header('Location: /static/main');
	exit ();
}

if (isset($_POST['search'])) {
	$row=query("SELECT * FROM `patients` WHERE `secondname` = '".$_POST['search']."'");
	if(!mysqli_num_rows($row)) {
		$_SESSION['info'] ='Пациент <b>'.$_POST['search'].'</b> не зарегестрирован.';
		header('Location: /static/main');
		exit();
	}
	else $info = 'найдено <b>'.mysqli_num_rows($row).'</b> записей';
}
else {
	if (!isset($_SESSION['page_num'])) $_SESSION['page_num'] = 1;
	if (isset($_GET['page_num'])) 
		$_SESSION['page_num']=$_GET['page_num'];

	if (isset($_GET['page_back'])) $_SESSION['page_num'] =$_SESSION['page_num']-1; 
	if (isset($_GET['page_next'])) $_SESSION['page_num'] =$_SESSION['page_num']+1;
	$temp = ((int)$_SESSION['page_num'] -1)*10;
	
	$row=query("SELECT *  FROM `patients` ORDER BY ".$_SESSION['ranging']." LIMIT ".$temp.",10");
	$row_count=query("SELECT COUNT(*) FROM `patients`");
	

}
	

?>