{include file="header.tpl" jsload = "ajax"}
<h1>{#deleteuser#}</h1>
<div class ="content_left">

		<div class="block_b" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="userdelete_toggle" class="win_block" onclick = "toggleBlock('userdelete');"><img src="./templates/standard/img/symbols/user.png" alt="" />
				<span>{$user.name}</span></a>
				</h2>
				</div>

				<div id = "userdelete" style = "">

					<div class="block_in_wrapper">
{#deleteform#}
					<form class="main" method="post" action="admin.php?action=deleteuser&amp;id={$user.ID}" enctype="multipart/form-data" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>
<input type = "hidden" name = "id" value = "{$user.ID}" />


                        {section name=proj loop=$projects}
                        <div class="row"><h3>{$projects[proj].name}</h3></div>
                        <div class = "row">
                            <label for = "{$projects[proj].ID}membs">{#assignto#}:</label>
							<select name = "uprojects[]" id = "{$projects[proj].ID}membs" >
							<option value = "{$projects[proj].ID}#0" selected>{#deletetasks#}</option>
                            {section name=member loop=$projects[proj].members}
                            {if $projects[proj].members[member].ID != $user.ID}
							<option value="{$projects[proj].ID}#{$projects[proj].members[member].ID}" required="0" />{$projects[proj].members[member].name}</option>
                            {/if}
                            {/section}
                             </select>
							</div>

                        {/section}
                        <div class="clear_both">
                        <div class="butn"><button type="submit">{#send#}</button></div><a href = "javascript:history.back();" class="butn_link"><span>{#cancel#}</span></a>
					</fieldset>
					</form>

					<div class="clear_both"></div> {*required ... do not delete this row*}
					</div> {*block_in_wrapper end*}



				</div>{*userdelete end*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block B end*}



</div> {*Content_left end*}

{include file="footer.tpl"}