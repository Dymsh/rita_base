<div class="container text-align">
	<p class="text-align">База клиентов</p>
	<div class="info"><?php if (isset($info)) echo $info ?></div>
	<div class="table-block">
	
		<table class="table-main">
			<form action method="post">
				<tr class="table-row-main">
					<style>
						.table-row-main th a[href*="<?php echo $_SESSION['ranging'];?>"] {
							color: red;
						}
					</style>
					<th class="id" title="Сортировать по id">id
						<a href="/static/main&ranging=`id` DESC"></a>
						<a href="/static/main&ranging=`id` ASC"></a>					
					</th>
					<th class="name" title="Сортировать по Фамилии">ФИО
						<a href="/static/main&ranging=`secondname` DESC"></a>
						<a href="/static/main&ranging=`secondname` ASC"></a>
					</th>
					<th class="date-of-visit" title="Сортировать по дате">Дата / Время приема
						<a href="/static/main&ranging=`date-of-visit` DESC"></a>
						<a href="/static/main&ranging=`date-of-visit` ASC"></a>					
					</th>
					<!--<th class="date" title="Сортировать по дате">Зарегистр.
						<a  href="/static/main&ranging=`date` DESC"></a>
						<a href="/static/main&ranging=`date` ASC"></a>
					</th>	
					<th class="last-date" title="Сортировать по дате">Обновлен
						<a href="/static/main&ranging=`lastdate` DESC"></a>
						<a href="/static/main&ranging=`lastdate` ASC"></a>
					</th>	
					<th class="tel">Тел:</th> -->
					<th class="del"></th>
					<th class="checkbox"><input class="main-check" type="checkbox" name="" value=""></th>
				</tr>
			</form>
			<form id="delall" action="" method="post">
			
				<?php while ($result=mysqli_fetch_assoc($row)) {
					if (date('Y-m-d') == mb_strimwidth($result['date-of-visit'] ,0, 10) )
						$today = '<span class="today">Сегодя</span>';
					else $today = null;
					echo'
				<tr>
					<td>'.$result['id'].'</td>
					<td>
						<a href="/static/edit&view=all&id='.$result['id'].'">'.htmlspecialchars($result['secondname']).' '.htmlspecialchars($result['firstname']).'</a>
					</td>
					<td><a href="/static/edit&view=date&id='.$result['id'].'">'.$result['date-of-visit'].'</a>'.$today.'</td>
					'; /*<td>'.$result['date'].'</td>
					<td>'.$result['lastdate'].'</td>
					<td>'.$result['tel'].'</td> */ echo '   
					<td><a href="/static/main&action=del&id='.$result['id'].'"><span class="span-del"></span></a></td>
					<td class="td-form">
						<input type="checkbox" name="delall[]" value="'.$result['id'].'">
					</td>
				</tr>
				';}?>
			</form>
		</table>
	</div>
	
	<div class="paginator" style="margin-top: 10px;"> 
		<style>
			.paginator a[data-page="<?php echo $_SESSION['page_num'];?>"] {
				color: red;
			}
		</style>
		<?php 
		if (!isset($_SESSION['page_num'])) {
			$result_page=1;
		}
		else $result_page = $_SESSION['page_num'];
		$count=mysqli_fetch_assoc($row_count);
		$last_page=ceil($count['COUNT(*)']/10);
		
		$first_page=1;
		
		$box_number=7;
		$i=1;	
		
		$view=$i;
			
		if ($result_page>4 && $last_page-$result_page>3)  { // работа с result_page по середине 
			if ($result_page != $first_page) echo '<a href="/static/main&page_back=back">back | </a>';
			while ($i<=$box_number){
				
				$view=$i;
				if ($i==$first_page) $view = $i;
				if ($i==$box_number) $view = $last_page;
				if ($i==$first_page+1 || $i==$box_number-1) $view = '...';
				
				if ($i==$first_page+2) $view = $result_page-1;
				if ($i==$first_page+3) $view = $result_page;
				if ($i==$first_page+4) $view = $result_page+1;
				
				if ($view == '...') echo '...|'; 
				else echo '<a data-page="'.$view.'" href="/static/main&page_num='.$view.'">'.$view.' | </a>';
				$i++;
			}
			if ($result_page != $last_page) echo'<a href="/static/main&page_next=next">next  </a>';
		}
			
		if ($result_page<5){
				if ($result_page != $first_page) echo '<a href="/static/main&page_back=back">back | </a>';
			while($i<=$box_number) {
				$view=$i;
				if ($i == $box_number-1 && $box_number-1 < $last_page) $view='...';
				if ($i==$first_page) $view = $i;
				if ($i==$box_number) $view = $last_page;
				if ($view == '...') echo '...|';
				else echo '<a data-page="'.$view.'" href="/static/main&page_num='.$view.'">'.$view.' | </a>';
				$i++;
			}
			if ($result_page != $last_page) echo'<a href="/static/main&page_next=next">next  </a>';
		}
		
		if ($last_page-$result_page<=3){
				if ($result_page != $first_page) echo '<a href="/static/main&page_back=back">back | </a>';
			while($i<=$box_number) {
				$view = $last_page+$i-7;
				if ($i==$first_page) $view = $i;
				if ($i==$first_page+1) $view = '...';
				
				if ($view == '...') echo '...|'; 
				else echo '<a data-page="'.$view.'" href="/static/main&page_num='.$view.'">'.$view.' | </a>';
				$i++;
			}
			if ($result_page != $last_page) echo'<a href="/static/main&page_next=next">next  </a>';
		}

		?>
	</div>
</div>