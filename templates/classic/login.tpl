{include file="header.tpl" title="Login" showheader="no" jsload = "ajax"}

<div style="text-align:center;padding-top:15%;height:40%;">
<table cellpadding="0" cellspacing="0" class="login">
	<tr valign="top">

		<td><div class="left"></div></td>
		<td class="mid" style="padding-top:26px;">
			<h1 class="head"><a href="index.php" title="{#desktop#}"><img src="./templates/classic/img/fcw-logo-login.png" alt="" /></a></h1>
			<h2 class="head"></h2>
		</td>
		<td class="mid" style="padding-top:32px;">


			<form method="post" action="manageuser.php?action=login" class="login" style="width:125px;" {literal} onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
			<fieldset>

			<div class="row"><input type="text" class="text" name="username" id="username" required = "1" realname = "{#name#}" /></div>
			<div class="row"><input type="password" class="text" name="pass" id="pass" required = "0" realname = "{#password#}"/></div>

			<div class="row">
			<input type = "checkbox" name = "staylogged" id="stay" value = "1" style="float:left;width:12px;margin:0 5px 0 0;" />
			<label for="stay" style="display:block;padding:0 0 8px 0;white-space:nowrap;" >{#stayloggedin#}</label>
			</div>

			<div class="row">
			<div class="butn"><button type="submit">{#loginbutton#}</button></div>
			</div>

			</fieldset>
			</form>
		</td>
		<td ><div class="right"></div></td>

	</tr>
	<tr>
	<td colspan="4">
	{if $loginerror == 1}
	<span class="error_message">{#loginerror#}</span>
	{/if}
	</td>
	</tr>
</table>
</div>


</body>
</html>
