<div class="block_in_wrapper" style="width:600px;">
<h2>{#filterreport#}</h2>

	<form class="main" method="get" action="managetimetracker.php" {literal}onsubmit="return validateCompleteForm(this);"{/literal} >
	<fieldset>
		<div class="row"><label for="start">{#start#}:</label><input type="text" name="start" id="start" required="0" realname="{#start#}" onfocus = "dpck.close();" value = "{$start}" /></div>
		<div class="row"><label for="end">{#end#}:</label><input type="text" name="end" id="end" required="0" realname="{#end#}" onfocus = "dpck2.close();" value = "{$end}"/></div>
		<div class="row"><label for="usr">{#user#}:</label>
		<select name="usr" id="usr" required="0" realname="{#user#}" />
		<option value = "">{#chooseone#}</option>
		{section name = usi loop=$users}
		<option value = "{$users[usi].user}" {if $users[usi].ID == $usr}selected="selected"{/if}>{$users[usi].name}</option>
		{/section}
		</select>
		</div>
		<div class = "row">	<label for = "ttask">{#task#}:</label>
			<select name = "task" id = "ttask" >
		  	<option value = "" >{#chooseone#}</option>
		  	{section name = task loop=$ptasks}
		  		{if $ptasks[task].title != ""}
		  		<option value = "{$ptasks[task].ID}" {if $ptasks[task].ID == $task}selected="selected"{/if}>{$ptasks[task].title}</option>
		  		{else}
		  		<option value = "{$ptasks[task].ID}" {if $ptasks[task].ID == $task}selected="selected"{/if}>{$ptasks[task].text|truncate:30:"...":true}</option>
				{/if}
			{/section}
		  	</select></div>
<input type = "hidden" name = "action" value ="showproject" />
<input type = "hidden" name = "id" value="{$project.ID}" />

        {literal}
		<script type="text/javascript">
		    /*<[CDATA[*/
		     var dpck2	= new DatePicker({
                relative	: {/literal}'start'{literal},
                language	: {/literal}'{$locale}'{literal},
                topOffset: -43,
                leftOffset: 235,
                keepFieldEmpty: true
                });
             /*]]>*/
        </script>
		<script type="text/javascript">
		    /*<[CDATA[*/
		     var dpck	= new DatePicker({
                relative	: {/literal}'end'{literal},
                language	: {/literal}'{$locale}'{literal},
                topOffset: -69,
                leftOffset: 235,
                keepFieldEmpty: true
                });
             /*]]>*/
        </script>

        {/literal}

	    <div class="clear_both_b"></div>
<div class="clear_both_b"></div>
		<div class="row">
		<label>&nbsp;</label>
		<div class="butn"><button type="submit">{#filter#}</button></div>
		<a href = "javascript:blindtoggle('filter');" class="butn_link"><span>{#cancel#}</span></a>
		</div>
	</fieldset>
	</form>

</div> {*block_in_wrapper end*}