{include file="header.tpl" jsload = "ajax" showheader="no" sound="1"}
<script type = "text/javascript">
theprojects = [];
{section name=thetask2 loop=$tasks}
{literal}theprojects.push({/literal}{$tasks[thetask2].project}{literal});{/literal}
{/section}
{literal}
</script>
{/literal}
{literal}
<script type ="text/javascript">
var thetracker = new timetracker(0,0);

</script>
{/literal}
<div id="content-left" style = "width:450px;">
<div id="content-left-in">
<div class = "timetrack">
<h2>Zeiterfassung</h2>
	<div class = "block_in_wrapper">
		<form class = "main" action = "#" method = "post" onsubmit = "return false;">
			<fieldset>
				<div class = "row">
				<label>Benutzer:</label>
				{$username}
				</div>
				<div class = "row">
				<label for = "thetask">Aufgabe:</label>
				<select style = "width:200px;" name = "thetask" id = "thetask" required = "1" exclude = "-1" realname = "{#assignto#}" onchange = "thetracker.setIDs(this.value,theprojects[this.selectedIndex-1]);">
					<option value="0" selected="selected">{#chooseone#}</option>
					{section name=thetask loop=$tasks}
					<option value = "{$tasks[thetask].ID}">{$tasks[thetask].title}</option>
					{/section}
				</select>

				</div>
				<div class = "row">
				<label>Zeit:</label>
				<span id = "digitalclock">0</span> Minuten
				</div>

				<div class = "row">
				<button id = "thebutton" onclick = "thetracker.toggleTracker();">Zeiterfassung starten</button>
				</div>

				<div class ="clear_both"></div>
			</fieldset>
		</form>
	</div>
<br />
</div>
</div>
</div>

</body>
</html>