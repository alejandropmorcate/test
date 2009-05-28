{include file="header.tpl" jsload = "ajax" }
<h1>{#edittimetracker#}</h1>
<div class ="content_left">

		<div class="block_a" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="trackedit_toggle" class="win_block" onclick = "toggleBlock('trackedit');"><img src="./templates/standard/img/symbols/timetracker.png" alt="" />
				<span>{$track.username} ({$track.hours} {#hours#})</span></a>
				</h2>
				</div>


				<div id = "trackedit" style = "">
				<div class="block_in_wrapper">

					<div class="form_wrapper">
					<form class="main" method="post" action="managetimetracker.php?action=edit&amp;tid={$track.ID}&amp;id={$track.project}" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>

                    <div class="row"><label for="ttask">{#task#}:</label>
					<select name="ttask" class="select" id="ttask" required="0">
					<option value = "" {if $track.task < 1}selected = "selected"{/if} >{#noassociatedtask#}</option>
                    {section name=task loop=$tasks}
                    <option value="{$tasks[task].ID}" {if $tasks[task].ID == $track.task}selected = "selected"{/if}>{$tasks[task].name}</option>
                    {/section}
                    </select>
					</div>
					<div class="row"><label for="day">{#day#}:</label><input type="text" class="text" value="{$track.day}" name="day"  id="day" required="1" realname="day" /></div>

                    {literal}
						<script type="text/javascript">
						    /*<[CDATA[*/
						     var dpck	= new DatePicker({
                            relative	: {/literal}'day'{literal},
                            language	: {/literal}'{$locale}'{literal},
                            topOffset: -129,
                            leftOffset: 235
                             });
                            /*]]>*/
                        </script>
                    {/literal}

                    <div class="row"><label for="started">{#started#}:</label><input type="text" class="text" value="{$track.started}" name="started" id="started" required="1" realname="{#started#}" /></div>
                    <div class="row"><label for="ended">{#ended#}:</label><input type="text" class="text" value="{$track.ended}" name="ended" id="ended" required="1" realname="{#ended#}" /></div>
                    <div class="row"><label for="comment">{#comment#}:</label><textarea name="comment" id="comment" required="0" rows="3" cols="1" >{$track.comment}</textarea></div>


					<div class="row">

                    <input type="hidden" name="tid" value="{$tid}" />
                    <input type="hidden" name="id" value="{$track.project}" />

					<label>&nbsp;</label>
					<div class="butn"><button type="submit">{#send#}</button></div>
					</div>

					</fieldset>
					</form>
					</div> {*Form_Wrapper end*}

			</div> {*block_in_wrapper end*}
			</div>{*trackedit end*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block A end*}


</div> {*Content_left end*}
{include file="footer.tpl"}

