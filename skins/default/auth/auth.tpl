<?php 
if (isset($_SESSION['info'])) {
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}
else $info ='Укажите имя и пароль, пожалуйста.';
?>

<div class="info-auth">
	<?php echo $info ;?>
</div>
<div class="container">
	<div class="block-form-auth">
		<form class="form-auth" action="" method="post">
			<div class="wrap-flex">
				<input type="text" name="auth_name" value="" required placeholder="Имя пользователя">
				<input type="password" name="auth_pas" value="" required placeholder="Пароль">
			</div>
			<div class="wrap-flex">
				<div class="wrap-inner">
					<label class="check">
						<input type="checkbox" name="auth_memory" value="ok">Запомни меня
						<div class="helper"></div>
					</label>
					<a href="/auth/reg">Новый пользователь</a>
				</div>
				<input class="btn" type="submit" name="auth_sub" value="Войти">	
			</div>
		</form>
		
	</div>
</div>