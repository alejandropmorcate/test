{include file="header.tpl" jsload = "ajax" }
<h1>{#editmilestone#}</h1>
<div class ="content_left">

		<div class="block_c" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="mileedit_toggle" class="win_block" onclick = "toggleBlock('mileedit');"><img src="./templates/standard/img/symbols/miles.png" alt="" />
				<span>{$milestone.name}</span></a>
				</h2>
				</div>


				<div id = "mileedit" style = "">

					<div class="block_in_wrapper">
					<form class="main" method="post" action="managemilestone.php?action=edit&amp;id={$milestone.project}" {literal}onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
					<fieldset>

					<div class="row"><label for="name">{#name#}:</label><input type="text" value="{$milestone.name}" name="name" id="name" required="1" realname="{#name#}" /></div>
					<div class="row"><label for="desc">{#description#}:</label><textarea name="desc" id="desc" required="0" rows="3" cols="1">{$milestone.desc}</textarea></div>
					<div class="row"><label for="end">{#end#}:</label><input type="text" value="{$milestone.endstring}" name="end"  id="end" required="1" realname="{#end#}" /></div>

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

					<input type="hidden" name="mid" value="{$milestone.ID}" />

					<div class="row">
					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>

					</fieldset>
					</form>
					</div> {*block_in_wrapper end*}



			</div>{*mileedit end*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block A end*}


</div> {*Content_left end*}

{include file="footer.tpl"}