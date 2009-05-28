{include file="header.tpl" jsload = "ajax"}
<h1>{#edituser#}</h1>
<div class ="content_left">

		<div class="block_b" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="useredit_toggle" class="win_block" onclick = "toggleBlock('useredit');"><img src="./templates/standard/img/symbols/user.png" alt="" />
				<span>{$user.name}</span></a>
				</h2>
				</div>

				<div id = "useredit" style = "">

					<div class="block_in_wrapper">


					<form class="main" method="post" action="manageuser.php?action=edit" enctype="multipart/form-data" {literal}onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
					<fieldset>

					<div style="float:left;width:360px;" >

						<div class="row"><label for = "name">{#name#}:</label><input type = "text" value = "{$user.name}" name = "name" id="name" required="1" realname="{#name#}" /></div>

						<div class="row"><label for = "avatar">{#avatar#}:</label><input type = "file" class="file" name = "userfile" id="avatar" required="0" size="20" /></div>
						<div class="row"><label for = "email">{#email#}:</label><input type = "text" value = "{$user.email}" name = "email" id="email" {literal}regexp="EMAIL"{/literal} required="1" realname ="{#email#}"  /></div>

						<div class="row"><label for = "address1">{#address#}:</label><input type = "text" value = "{$user.adress}" name = "address1" id="address1" required="0" /></div>
						<div class="row"><label for = "address2">2. {#address#}:</label><input type = "text" value = "{$user.adress2}" name = "address2" id="address2" required="0" /></div>
						<div class="row"><label for = "state">{#state#}:</label><input type = "text" value = "{$user.state}" name = "state" id="state" required="0" /></div>

						<div class="row"><label for = "country">{#country#}:</label><input type = "text" value = "{$user.country}" name = "country" id="country" required=""  /></div>

						<div class="row"><label for = "locale">{#locale#}:</label>
						<select name = "locale" required="0" id="locale">

						<option value = "" {if $user.locale == ""}selected="selected"{/if}>{#systemdefault#}</option>
						{section name = lang loop=$languages_fin}
						<option value = "{$languages_fin[lang].val}" {if $languages_fin[lang].val == $user.locale}selected="selected"{/if}>{$languages_fin[lang].str}</option>
						{/section}
						</select>
						</div>
						<div class = "row"><label for = "zip">{#zip#}:</label><input type = "text" name = "zip" id = "zip" realname = "{#zip#}" value = "{$user.zip}" required = "0" regexp = {literal}"\d{4,}" />{/literal}</div>
						<div class = "row"><label for = "gender">{#gender#}:</label>
						<select name = "gender" id = "gender" realname = "{#gender#}" required = "0" />
						{if $user.gender == ""}
						<option value = "" selected>{#chooseone#}</option>
						{/if}
						<option {if $user.gender == "m"}selected="selected"{/if} value = "m">{#male#}</option>
						<option {if $user.gender == "f"}selected="selected"{/if} value = "f">{#female#}</option>
						</select>
						</div>
						<div class = "row"><label for = "web">{#url#}:</label><input type = "text" name = "web" id = "web" realname = "{#url#}" value = "{$user.url}" /></div>

						<input type = "hidden" name = "admin" value = "{$user.admin}" />
                        <div class="clear_both"></div>

                        <h2>{#changepassword#}</h2>
                        <div class="row"><label for = "oldpass">{#oldpass#}:</label><input type = "password" name = "oldpass" id = "oldpass" required = "0" /></div>

                        <div class="row"><label for = "newpass">{#newpass#}:</label><input type = "password" name = "newpass" id = "newpass" required = "0" /></div>

                        <div class="row"><label for = "repeatpass">{#repeatpass#}:</label><input type = "password" name = "repeatpass" id = "repeatpass" required = "0" /></div>

						<div class="row">
						<label>&nbsp;</label>
						<div class="butn"><button type="submit">{#send#}</button></div>
						</div>

					</div>


					<div style="float:left;width:108px;" >
						{if $user.avatar != ""}
						<div class="avatar"><img src = "thumb.php?pic=files/{$cl_config}/avatar/{$user.avatar}" alt="" /></div>
						{else}
						<div class="avatar"><img src = "thumb.php?pic=templates/standard/img/no_avatar.jpg" alt="" /></div>
						{/if}
					</div>


					</fieldset>
					</form>

					<div class="clear_both"></div> {*required ... do not delete this row*}
					</div> {*block_in_wrapper end*}



				</div>{*useredit end*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block B end*}


</div> {*Content_left end*}

{include file="footer.tpl"}