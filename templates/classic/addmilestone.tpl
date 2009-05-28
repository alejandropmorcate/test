<div class="block_in_wrapper">
<h2>{#addmilestone#}</h2>

	<form class="main" method="post" action="managemilestone.php?action=add&amp;id={$project.ID}" {literal} onsubmit="return validateCompleteForm(this);"{/literal} >
	<fieldset>
		<div class="row"><label for="name">{#name#}:</label><input type="text" name="name" id="name" required="1" realname="{#name#}" /></div>
		<div class="row"><label for="desc">{#description#}:</label><textarea name="desc" id="desc" required="0" rows="3" cols="1" ></textarea></div>

		<div class="row">
		<label for="end">{#due#}:</label>
		<input type="text" name="end"  id="end" required="1" realname="{#due#}" />
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

		<div class="row">
		<label>&nbsp;</label>
		<div class="butn"><button type="submit">{#addbutton#}</button></div>
		<a href = "javascript:blindtoggle('addstone');" class="butn_link"><span>{#cancel#}</span></a>
		</div>


	</fieldset>
	</form>

</div> {*block_in_wrapper end*}