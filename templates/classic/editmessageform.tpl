{include file="header.tpl" jsload = "ajax" jsload1="tinymce"}

<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

		<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="messages_toggle" class="win_block" onclick = "toggleBlock('messages');"><img src="./templates/standard/img/symbols/msg.png" alt="" />
				<span>{#editmessage#}</span></a>
				</h2>
				</div>


				<div id = "messages" style = "">
				<div class="block_in_wrapper">

					<form class="main" method="post" action="managemessage.php?action=edit&amp;id={$project.ID}" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>
						<div class="row"><label for="title">{#title#}:</label><input type="text" value="{$message.title}" name="title" id="title" required="1" realname="{#title#}"/></div>
						<div class="row_editor"><textarea name="text" id="text" required="0" realname="{#text#}" rows="3" cols="1" >{$message.text}</textarea></div>
						<div class="row"><label for="tags">{#tags#}:</label><input type="text" value="{$message.tags}" name="tags" id="tags" required="0" realname="{#tags#}"/></div>
						<input type="hidden" name="mid" value="{$message.ID}" />

						<div class="clear_both_b"></div>
						<div class="row">
						<div class="butn"><button type="submit">{#send#}</button></div>
						</div>

					</fieldset>
					</form>

				</div> {*block_in_wrapper end*}
				</div>{*Messages end*}



			</div> {*IN end*}
		</div> {*Block B end*}




</div> {*Content_left end*}
{include file="footer.tpl"}