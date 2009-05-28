{include file="header.tpl" title="install" showheader="no"}


		<div class="install" style="text-align:center;padding:5% 0;">
			<div style="text-align:left;width:500px;margin:0 auto;padding:25px 25px 15px 25px;background:white;border:1px solid;">


			<h1>{#installcollabtive#}</h1>

			<div style="padding:16px 0 16px 0;">
			<h2>{#installstep#} 3</h2>
            {#createadmin#}<br /><br />
			<form class = "main" name = "adminuser" method = "post" enctype="multipart/form-data" action = "install.php?action=step3">
			<fieldset>
			<div class = "row"><label for = "username">{#name#}:</label><input type = "text" name = "name" id = "username" /></div>
			<div class = "row"><label for = "pass">{#password#}:</label><input type = "password" name = "pass" id = "pass" /></div>

			</fieldset>
			<br />
			<h2>{#import#}</h2>
			<fieldset>

					<div class="row">
<label for="file">{#file#}:</label><input type="file" class="file" name="importfile" id="file" required="1" realname="{#file#}" size="20" /></div>
	<div class="row">
				<label style="width:210px;">&nbsp;</label>
				<div class="butn"><button type="submit">{#continue#}</button></div>
				</div>
					</fieldset>
			</form>

			</div>
			</div>
		</div> {*Install end*}



</body>
</html>
