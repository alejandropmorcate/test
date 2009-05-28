{include file="header.tpl"  jsload = "ajax" jsload1 = "tinymce"}
<h1>{$project.name}</h1>
<div class ="content_left">



		<div class="block_b" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="projectedit_toggle" class="win_block" onclick = "toggleBlock('projectedit');"><img src="./templates/standard/img/symbols/task.png" alt="" />
				<span>{#editproject#}</span></a>
				</h2>
				</div>


				<div id = "projectedit" style = "">

					<div class="block_in_wrapper">

					<form class="main" method="post" action="manageproject.php?action=edit&amp;id={$project.ID}" {literal}onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
					<fieldset>

					<div class="row"><label for="name">{#name#}:</label><input type="text" name="name" id="name" required="1" realname="{#name#}" value = "{$project.name}" /></div>
					<div class="row"><label for="desc">{#description#}:</label><textarea name="desc" id="desc" required="0" rows="3" cols="1">{$project.desc}</textarea></div>
	<div class="clear_both_b"></div>
					<div class="row"><label for="end">{#due#}:</label><input type="text" value="{$project.endstring}" name="end"  id="end" required="0" realname="{#due#}" /></div>
					<div class="row"><label for="budget">{#budget#}:</label><input type="text" value="{$project.budget}" name="budget"  id="budget" required="0" realname="{#budget#}" /></div>
				
					<div class="row">
					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>

					</fieldset>
					</form>
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
					</div> {*block_in_wrapper end*}



			</div>{*projectedit end*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block A end*}


</div> {*Content_left end*}

{include file="footer.tpl"}