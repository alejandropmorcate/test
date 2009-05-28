{include file="header.tpl" jsload = "ajax" }
<h1>{#administration#}<span>/ {#systemadministration#}</span></h1>

<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}
{include file="admin_top.tpl"}
	<div class="infowin_left" style = "display:none;" id = "systemmsg">
	{if $mode == "edited"}
	<span class="info_in_yellow"><img src="templates/standard/img/symbols/system.png" alt=""/>{#settingschanged#}</span>
	{elseif $mode == "imported"}
	<span class="info_in_green"><img src="templates/standard/img/symbols/basecamp-import.png" alt=""/>{#importsuccess#}<br />
	{#projects#}: {$procount}
	</span>
	{/if}
	</div>

	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');
	 </script>
	{/literal}

		<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="#" id="admin_toggle" class="win_block" onclick = "toggleBlock('admin');"><img src="./templates/standard/img/symbols/system.png" alt="" />
				<span>{#systemadministration#}</span></a>
				</h2>
				</div>
				<div id="admin">
				<div class="block_in_wrapper">

					<form class="main" method="post" action="admin.php?action=editsets" enctype="multipart/form-data" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>

					<div class="row"><label for = "name">{#name#}:</label><input type = "text" value = "{$settings.name}" name = "name" id="name" required = "1" realname = "{#name#}" /></div>
					<div class="row"><label for = "subtitle">{#subtitle#}:</label><input type="text" value="{$settings.subtitle}" name="subtitle" id="subtitle" /></div>
			
					
					<div class="row">
					<label for = "locale">{#locale#}:</label>
					<select name = "locale" id="locale" required="1" realname = "{#locale#}">
					{section name = lang loop=$languages_fin}
					<option value = "{$languages_fin[lang].val}" {if $languages_fin[lang].val == $settings.locale}selected="selected"{/if}>{$languages_fin[lang].str}</option>
					{/section}
					</select>
					</div>

					<div class="row">
					<label for="timezone">{#timezone#}:</label>
					<select name="timezone" id="timezone" required="1" realname="{#timezone#}">
					{section name=timezone loop=$timezones}
					<option value="{$timezones[timezone]}" {if $timezones[timezone] == $settings.timezone}selected="selected"{/if}>{$timezones[timezone]}</option>
					{/section}
					</select>
					</div>
					
					<!--
					<div class="row">
					<label for="dateformat">{#dateformat#}:</label>
					</div>
					-->
					<input type="hidden" value="{$settings.dateformat}" name="dateformat" id="dateformat" />
					

					<div class="row">
					<label for = "template">{#template#}:</label>
					<select name="template" id="template" required = "1" realname = "{#template#}" >
					{section name=tem loop=$templates}
					<option value="{$templates[tem]}" {if $settings.template == $templates[tem]}selected="selected"{/if}>{$templates[tem]}</option>
					{/section}
					</select>
					</div>


					<div class="row">
					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>


					</fieldset>
					</form>

				</div> {*block_in_wrapper end*}
				</div> {*admin end*}
			</div> {*IN end*}
		</div> {*Block C end*}
		
	<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="#" id="import_toggle" class="win_block" onclick = "toggleBlock('import');"><img src="./templates/standard/img/symbols/basecamp-import.png" alt="" />
				<span>{#import#}</span></a>
				</h2>
				</div>
				<div id="import">
				<div class="block_in_wrapper">

					<form class="main" method="post" action="manageimport.php?action=basecamp" enctype="multipart/form-data" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>

					<div class="row">
					<label for="file">{#file#}:</label><input type="file" class="file" name="importfile" id="file" required="1" realname="{#file#}" size="20" /></div>


					<div class="row">
					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>


					</fieldset>
					</form>

				</div> {*block_in_wrapper end*}
				</div> {*admin end*}
			</div> {*IN end*}
		</div> {*Block B end*}
		
			<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="#" id="email_toggle" class="win_block" onclick = "toggleBlock('email');"><img src="./templates/standard/img/symbols/msg.png" alt="" />
				<span>{#email#}</span></a>
				</h2>
				</div>
				<div id="email">
				<div class="block_in_wrapper">

					<form class="main" method="post" action="admin.php?action=editmailsets" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>
					
					<div class="row">
						<label for="mailstatus">{#status#}:</label>
						<select name="mailstatus" id="mailstatus" >
						{if $settings.mailnotify == 1}
						<option value = "1" selected>on</option>
						<option value = "0">off</option>
						{else}
						<option value = "1">on</option>
						<option value = "0" selected>off</option>
						{/if}
						</select>
					</div>
					
					<div class="row"><label for="mailfrommail">{#mailfrommail#}:</label><input type="text"  name="mailfrommail" id="mailfrommail" value = "{$settings.mailfrom}" /></div>
					<div class="row"><label for="mailfromname">{#mailfromname#}:</label><input type="text"  name="mailfromname" id="mailfromname" value = "{$settings.mailfromname}" /></div>
					
					<div class="row"><label for="mailmethod">{#mailmethod#}:</label><select name="mailmethod" id="mailmethod" >
					{if $settings.mailmethod == "mail"}
					<option value = "mail" selected>PHP mail()</option>
					<option value = "smtp">SMTP</option>
					{else}
					<option value = "mail">PHP mail()</option>
					<option value = "smtp" selected>SMTP</option>
					{/if}
					</select>
					</div>
			
					
					<div class="row"><label for="server">{#mailserver#}:</label><input type="text"  name="server" id="server" value = "{$settings.mailhost}" /></div>
					<div class="row"><label for="mailuser">{#mailusername#}:</label><input type="text"  name="mailuser" id="mailuser" value = "{$settings.mailuser}" /></div>
					<div class="row"><label for="mailpass">{#mailpass#}:</label><input type="text"  name="mailpass" id="mailpass" value = "{$settings.mailpass}" /></div>
		

					<div class="row">
					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>


					</fieldset>
					</form>

				</div> {*block_in_wrapper end*}
				</div> {*admin end*}
			</div> {*IN end*}
		</div> {*Block B end*}

</div> {*Content_left end*}
{include file="footer.tpl"}