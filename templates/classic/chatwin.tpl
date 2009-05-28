{include file="header.tpl" jsload = "ajax" jsload2="chat" focusme = "1" showheader="no"}
<input type = "hidden" id = "userto" value = "{$userto}" />
<input type = "hidden" id = "userto_id" value = "{$userto_id}" />
<input type = "hidden" id = "username" value = "{$username}" />

<div style="padding:10px">

<h2>{#chatwith#} {$userto}</h2>
<div id = "textwin" style = "border:1px solid;height:200px;width:300px;padding:5px;overflow:auto;margin:0 0 15px 0;float:left;background:white;"></div>
{if $avatar != ""}
<img src = "thumb.php?pic=files/avatar/{$avatar}&amp;height=80&amp;width=80" style="float:left;margin-left:10px;" alt="" />
{/if}
<input style="float:left;height:18px;width:212px;padding:4px 3px 0px 4px;font-size:12px;margin-right:6px;border:1px solid #8b9dba;" type = "text" id = "chattext" onkeyup="getKeypressed(event);" />
<div class="butn" style="float:left;"><button onclick = "handleChatSubmit();return false;"  name = "submitb" id = "submitb" disabled="disabled" onchange = "this.disabled='';" type="submit">{#send#}</button></div>


<div id = "focusi"></div>
<input id = "charnum" type = "hidden" value = "0" />
<input id = "hasfocus" type = "hidden" value = "" />


<script type = "text/javascript">
startChat();
$('chattext').focus();
</script>

</div>

</body>
</html>