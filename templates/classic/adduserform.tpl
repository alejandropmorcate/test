<div class="block_in_wrapper">

	<form class="main" method="post" action="admin.php?action=adduser" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
	<fieldset>

		<div class="row"><label for="name">{#name#}:</label><input type="text" name="name" id="name" required="1" realname="{#name#}" /></div>
		<div class="row"><label for="email">{#email#}:</label><input type="text" name="email" id="email" required="0" realname="{#email#}" /></div>
		<div class="row"><label for="pass">{#password#}:</label><input type="text" name="pass" id="pass" required="1" realname="{#password#}" /></div>
		<div class = "row"><label id = "rate">{#rate#}:</label><input type = "text" name = "rate" id = "rate" /></div>
		

		<div class="clear_both_b"></div>

		<div class="row"><label>{#projects#}:</label>
		<div style="float:left;">
		{section name=project loop=$projects}
			<div class="row">
	        <input type="checkbox" class="checkbox" value="{$projects[project].ID}" name="assignto[]" id="{$projects[project].ID}" required="0" /><label for="{$projects[project].ID}" style="width:210px;">{$projects[project].name}</label>
	        </div>
	    {/section}
	    </div>

	    <div class="clear_both_b"></div>

		<div class="row"><label>{#permissions#}:</label>
		<div class = "row"><label></label><input type="radio" class="checkbox" value="1" name="isadmin" id="isadmin1" required="0" checked /><label for="isadmin1">{#user#}</label></div>
		<div class = "row"><label></label><input type="radio" class="checkbox" value="5" name="isadmin" id="isadmin2" required="0" /><label for="isadmin2">{#admin#}</label></div>
		<div class = "row"><label></label><input type="radio" class="checkbox" value="0" name="isadmin" id="isadmin3" required="0" /><label for="isadmin3">{#client#}</label></div>
		</div>
		
	    <div class="clear_both_b"></div>


		<div class="row">
		<label>&nbsp;</label>
		<div class="butn"><button type="submit">{#addbutton#}</button></div>
		<a href = "javascript:blindtoggle('adduser');" class="butn_link"><span>{#cancel#}</span></a>
		</div>


	</fieldset>
	</form>

</div> {*block_in_wrapper end*}