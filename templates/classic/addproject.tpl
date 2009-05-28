<div class="block_in_wrapper">
<h2>{#addproject#}</h2>

	<form class="main" method="post" action="admin.php?action=addpro" {literal}onsubmit="return validateCompleteForm(this);"{/literal} >
	<fieldset>
		<div class="row"><label for="name">{#name#}:</label><input type="text" name="name" id="name" required="1" realname="{#name#}" /></div>
		<div class="row"><label for="desc">{#description#}:</label><textarea name="desc" id="desc" required="0" rows="3" cols="1" ></textarea></div>

	    <div class="clear_both_b"></div>

		<div class="row">
		<label for="end">{#due#}:</label>
		<input type="text" name="end"  id="end" required="0" realname="{#due#}" regexp="{literal}\d{2}.\d{2}.\d{4}{/literal}" />
		</div>
		<div class = "row">
		<label for = "budget">Budget</label>
		<input type = "text" name = "budget" id = "budget" />
		</div>


        {literal}
		<script type="text/javascript">
		    /*<[CDATA[*/
		     var dpck	= new DatePicker({
                relative	: {/literal}'end'{literal},
                language	: {/literal}'{$locale}'{literal},
                topOffset: -129,
                leftOffset: 235
                });
             /*]]>*/
        </script>
        {/literal}

		<div class="row"><label>{#members#}:</label>
		<div style="float:left;">
        {section name=user loop=$users}
	        <div class="row">
	        <input type="checkbox" class="checkbox" value="{$users[user].ID}" name="assignto[]" id="{$users[user].ID}" required="0" {if $users[user].ID == $userid} checked="checked"{/if} /><label for="{$users[user].ID}">{$users[user].name}</label><br />
	      	</div>
	    {/section}
	    </div>
		</div>

		<input type="hidden" name="assignme" value="1" />

	    <div class="clear_both_b"></div>

		<div class="row">
		<label>&nbsp;</label>
		<div class="butn"><button type="submit">{#addbutton#}</button></div>
		<a href = "javascript:blindtoggle('form_{$myprojects[project].ID}');" class="butn_link"><span>{#cancel#}</span></a>
		</div>


	</fieldset>
	</form>

</div> {*block_in_wrapper end*}