<div class="container">
	<p class="text-align">Добавление нового клиента в базу</p>
	<div class="form-block">
		<form action="" method="post">
			<div class="error pos1" <?php if(isset($error['secondname'])) echo 'style="opacity:1;"';?>>укажите фамилию</div>
			<label><input type="text" name="secondname" value="<?php if(isset($_POST['secondname'])) echo $_POST['secondname'];?>" placeholder="фамилия"></label>
			<div class="error pos2" <?php if(isset($error['firstname'])) echo 'style="opacity:1;"';?>>укажите имя</div>
			<label><input type="text" name="firstname" value="<?php if(isset($_POST['firstname'])) echo $_POST['firstname'];?>" placeholder="имя"></label>
			<div class="gender"> 
				<span>Пол</span>
				<label><input type="radio" name="gender" value="mars" ><span class="mars"></span></label>
				<label><input type="radio" name="gender" value="venus" checked><span class="venus"></span></label>
			</div>
			<label><input type="tel" name="tel" value="<?php if(isset($_POST['tel'])) echo $_POST['tel'];?>" placeholder="телефон"></label>
			<label><input type="text" name="age" value="<?php if(isset($_POST['age'])) echo $_POST['age'];?>" placeholder="возвраст"></label>
			<label><input type="datetime-local" name="date-of-visit" value="<?php if(isset($_POST['date-of-vsit'])) echo $_POST['dateofvisit'];?>" placeholder="дата и время"></label>
			<textarea class="textarea" name="comment" placeholder="описание"><?php if(isset($_POST['comment'])) echo $_POST['comment'];?></textarea>
			<input class="btn" type="submit" name="add-new" value="Создать запись">
		</form>
	</div>
</div>

