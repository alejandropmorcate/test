{include file="header.tpl" jsload = "ajax" title=""}
<h1>{#edittasklist#}</h1>
<div class ="content_left">

		<div class="block_a" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="tasklistedit_toggle" class="win_block" onclick = "toggleBlock('tasklistedit');"><img src="./templates/standard/img/symbols/tasklist.png" alt="" />
				<span>{$tasklist.name}</span></a>
				</h2>
				</div>


				<div id = "tasklistedit" style = "">
				<div class="block_in_wrapper">
					<div class="form_wrapper">

					<form class="main" method="post" action="managetasklist.php?action=edit&amp;id={$project.ID}&amp;tlid={$tasklist.ID}" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>

						<div class="row"><label for="name">{#name#}:</label><input type="text" value="{$tasklist.name}" name="name" id="name" required="1" realname="{#name#}" /></div>
						<div class="row"><label for="desc">{#description#}:</label><textarea name="desc" id="desc" required="0" rows="3" cols="1" >{$tasklist.desc}</textarea></div>

						<div class="row">
						<label for="milestone">{#milestone#}:</label>
						<select name="milestone" id="milestone" required="0">
							{section name=stone loop=$milestones}
							<option value="{$milestones[stone].ID}" {if $tasklist.milestone == $milestones[stone].ID}selected = "selected"{/if}>{$milestones[stone].name}</option>
							{/section}
							</select>
						</div>


					<div class="row">
					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>

					</fieldset>
					</form>

					</div> {*Form_Wrapper end*}
			</div> {*block_in_wrapper end*}
			</div>{*tasklistedit end*}
				<div class="clear_both"></div>
			</div> {*IN end*}
		</div> {*Block A end*}

</div> {*Content_left end*}
{include file="footer.tpl"}