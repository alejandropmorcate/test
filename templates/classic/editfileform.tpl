{include file="header.tpl" jsload = "ajax" jsload1="tinymce" }

<h1>{#editfile#}</h1>
<div class ="content_left">

		<div class="block_b" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="fileedit_toggle" class="win_block" onclick = "toggleBlock('fileedit');"><img src="./templates/standard/img/symbols/files.png" alt="" />
				<span>{$file.name}</span></a>
				</h2>
				</div>

				<div id = "fileedit" style = "">

					<div class="block_in_wrapper">

					<form class="main" method="post" action="managefile.php?action=edit&amp;id={$project.ID}&amp;file={$file.ID}" {literal}onsubmit="return validateCompleteForm(this);"{/literal} >
					<fieldset>

					<div class="row"><label for="title">{#title#}: </label><input type="text" value="{$file.title}" name="title" id="title" required="1" realname="{#title#}" /></div>
					<div class="row_editor"><textarea name="desc" id="desc" rows="3" cols="1">{$file.desc}</textarea></div>
					<div class="row"><label for="tags">{#tags#}: </label><input type="text" value="{$file.tags}" name="tags" id="tags" required="0" realname="{#tags#}" /></div>

					<div class="row">
					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>

					</fieldset>
					</form>



					<div class="clear_both"></div> {*required ... do not delete this row*}
					</div> {*block_in_wrapper end*}



				</div>{*fileedit end*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block B end*}


</div> {*Content_left end*}
{include file="footer.tpl"}