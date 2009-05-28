{include file="header.tpl" title="install" showheader="no"}

		<div class="install" style="text-align:center;padding:5% 0;">
			<div style="text-align:left;width:500px;margin:0 auto;padding:25px 25px 15px 25px;background:white;border:1px solid;">

			<h1>{#installcollabtive#}</h1>

			<div style="border-bottom:1px dashed;padding:16px 0 16px 0;">
			<form class="main" method = "get" action = "install.php">
			<fieldset>
				<div class="row"><label for = "language" style="width:210px;">{#installerlanguage#}</label>

				<select name = "locale" id = "language" onchange = "document.forms[0].submit();">
				<option value = "">{#chooseone#}</option>
				<option value = "de">{#de#}</option>
				<option value = "en">{#en#}</option>
				<option value = "fr">{#fr#}</option>
				<option value = "es">{#es#}</option>
				<option value = "it">{#it#}</option>
				<option value = "nl">{#nl#}</option>
				<option value = "jp">{#jp#}</option>
				</select>
				</div>
			</fieldset>
			</form>
			</div>
			<div style="border-bottom:1px dashed;padding:16px 0 20px 0;">
				<h2>1. {#installerconditions#}</h2>
				<div class="row" style="padding-bottom:12px;"><i>{#installerchecksconditions#}</i></div>
				<table cellpadding="0" cellspacing="0" style="font-style:italic;">
				<tr>
				<td style="width:213px;"><strong><i>{#name#}:</i></strong></td>
				<td><strong>{#status#}:</strong></td>
				</tr>
				<tr>
				<td>PHP 5</td>
				{if $phpver >= 5.1}
				<td><span style = "color:green;font-weight:bold;">OK</span></td>
				{else}
				<td><span style = "color:red;font-weight:bold;">Not OK (PHP {$phpver} - {#phpversion#})</span></span></td>
				{/if}
				</tr>
				<tr>
				<td>config.php {#iswritable#}</td>
				{if $configfile >= 666}
				<td><span style = "color:green;font-weight:bold;">OK </span></td>
				{else}
				<td><span style = "color:red;font-weight:bold;">Not OK ({#makefilewritable#})</span></td>
				{/if}
				</tr>
				<tr>
				<td>files {#iswritable#}</td>
				{if $filesdir == 1}
				<td><span style = "color:green;font-weight:bold;">OK </span></td>
				{else}
				<td><span style = "color:red;font-weight:bold;">Not OK ({#makedirwritable#})</span></td>
				{/if}
				</tr>
				<tr>
				<td>templates_c {#iswritable#}</td>
				{if $templatesdir == 1}
				<td><span style = "color:green;font-weight:bold;">OK </span></td>
				{else}
				<td><span style = "color:red;font-weight:bold;">Not OK ({#makedirwritable#})</span></td>
				{/if}
				</tr>

				</table>
			</div>


			{if $configfile >= 666 and $phpver >= 5 and $templatesdir == 1 and $filesdir == 1}
			<div style="padding:16px 0 12px 0;">

				<h2>2. {#db#}</h2>
				<div class="row" style="padding-bottom:12px;"><i>{#insertdbaccessdata#}</i></div>

				<form class="main" method = "post" action = "install.php?action=step2&locale={$locale}">
				<fieldset>
					<div class="row"><label for = "db_host" style="width:210px;">{#dbhost#}:</label><input type = "text" name = "db_host" id = "db_host" value = "localhost"/></div>
					<div class="row"><label for = "db_name" style="width:210px;">{#dbname#}:</label><input type = "text" name = "db_name" id = "db_name" /></div>
					<div class="row"><label for = "db_user" style="width:210px;">{#dbuser#}:</label><input type = "text" name = "db_user" id = "db_user" /></div>
					<div class="row"><label for = "db_pass" style="width:210px;">{#dbpass#}:</label><input type = "password" name = "db_pass" id = "db_pass" /></div>


			<div style="border-bottom:1px dashed;height:16px;display:block;clear:both;margin-bottom:16px;"></div>

				<div class="row" style="padding-bottom:12px;"><i>{#clickcontinue#}</i></div>

				<div class="row">
				<label style="width:210px;">&nbsp;</label>
				<div class="butn"><button type="submit">{#continue#}</button></div>
				</div>


				</fieldset>
				</form>
			</div>

			{else}
			{#correctfaults#}
			{/if}


			</div>
		</div> {*Install end*}

</body>
</html>
