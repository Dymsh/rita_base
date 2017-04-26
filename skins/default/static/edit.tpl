<div class="container">
	<p class="text-align">Редактирование данных клиента № <b><?php echo $result['id']?></b></p>
	<div class="form-block">
		<form action="" method="post">
			<label><input type="text" name="secondname" value="<?php if(isset($_POST['secondname'])) echo htmlspecialchars($_POST['secondname']); else echo $result['secondname'];?>" <?php echo $all;?>></label>
			<label><input type="text" name="firstname" value="<?php if(isset($_POST['firstname'])) echo htmlspecialchars($_POST['firstname']); else echo $result['firstname'];?>" <?php echo $all;?>></label>
			<div class="gender"> 
				<span>Пол</span>
				<label><input type="radio" name="gender" value="mars" ><span class="mars"></span></label>
				<label><input type="radio" name="gender" value="venus" checked><span class="venus"></span></label>
			</div>
			<label><input type="tel" name="tel" value="<?php if(isset($_POST['tel'])) echo  $_POST['tel']; else echo $result['tel'];?>" <?php echo $all;?>></label>
			<label><input type="text" name="age" value="<?php if(isset($_POST['age'])) echo (int)$_POST['age']; else echo $result['age'];?>" <?php echo $all;?>></label>
			<label><input type="datetime" name="date-of-visit" value="<?php if(isset($_POST['date-of-vsit'])) echo $_POST['date-of-visit']; else echo $result['date-of-visit'];?>" <?php echo $date;?>></label>
			<textarea class="textarea" name="comment" placeholder="описание" <?php echo $all;?>><?php if(isset($_POST['comment'])) echo htmlspecialchars($_POST['comment']); else echo $result['comment'];?></textarea>
			<input type="hidden" name="requiested" value="<?php echo $result['id'];?>">
			<input class="btn" type="submit" name="edit" value="Редактировать запись">
		</form>
	</div>
</div>