{include file="header.tpl" jsload = "ajax"  }
<h1>{#edittask#}</h1>
<div class ="content_left">

		<div class="block_a" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="taskedit_toggle" class="win_block" onclick = "toggleBlock('taskedit');"><img src="./templates/standard/img/symbols/task.png" alt="" />
				<span>{$task.title}</span></a>
				</h2>
				</div>


				<div id = "taskedit" style = "">
				<div class="block_in_wrapper">

					<div class="form_wrapper">
					<form class="main" method="post" action="managetask.php?action=edit&amp;tid={$task.ID}&amp;id={$pid}" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>

					<div class="row"><label for="title">{#title#}:</label><input type="text" class="text" value="{$task.title}" name="title" id="title" realname="{#title#}" required="1" /></div>
					<div class="row"><label for="text">{#text#}:</label><textarea name="text" id="text" required="0"  rows="3" cols="0" >{$task.text}</textarea></div>
					<div class="row"><label for="end">{#end#}:</label><input type="text" class="text" value="{$task.endstring}" name="end"  id="end" required="0" /></div>

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

					<div class="row"><label for="tasklist">{#tasklist#}:</label>
						<select name="tasklist" class="select" id="tasklist" required="1" realname="{#tasklist#}">
						{section name=tasklist loop=$tasklists}
						<option value="{$tasklists[tasklist].ID}" {if $task.listid == $tasklists[tasklist].ID}selected = "selected"{/if}>{$tasklists[tasklist].name}</option>
						{/section}</select>
					</div>

					<div class="row"><label for="assigned">{#assignto#}:</label>
						<select name="assigned" class="select" id="assigned" required="1" realname="{#assignto#}">

						{section name=member loop=$members}
						<option value="{$members[member].ID}" {if $task.userid == $members[member].ID}selected = "selected"{/if}>{$members[member].name}</option>
						{/section}</select>
					</div>


					<div class="row">
					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>

					</fieldset>
					</form>
					</div> {*Form_Wrapper end*}

			</div> {*block_in_wrapper end*}
			</div>{*taskedit end*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block A end*}


</div> {*Content_left end*}
{*include file="footer.tpl"*}

