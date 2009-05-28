<?php
ob_start ("ob_gzhandler");
header("Content-type: text/css; charset: utf-8");
header("Cache-Control: must-revalidate");
$offset = 60 * 60 ;
$ExpStr = "Expires:" .
gmdate("D, d M Y H:i:s",
time() + $offset) . "GMT";
header($ExpStr);
?>
/* ## Basic-Elements ## start ## */

html, body {
	margin:0;
	padding:0;
	height:100%;
	font-family:Arial, helvetica, sans-serif;
	font-size:10pt;
	background:#d9dee8;
}

body {
	color:#2a4069;
}

body a, body a:visited {
	text-decoration:none;
	outline: none;
}

.hidden {
	visibility:hidden;
}

.visible {
	visibility:visible;
}

.clear_both {
	clear:both;
}

.clear_both_b {
	clear:both;
	height:15px;
}

img {
	border:none;
}

::selection {
	background:rgb(138,157,186);
	color:white;
}

::-moz-selection {
	background:rgb(138,157,186);
	color:white;
}

ul {
	margin:0;
	padding:0;
	list-style-type:none;
}

td.message ul {
	padding:0 0 0 5px;
	margin: 0 0 0 10px;
	list-style-type: disc;
}

.error_message {
	color:red;
}

/* ## Basic-Elements ## end ## */
#site_background {
	min-width:980px;
	min-height:100%;
	background: url(../img/head_bg_a.jpg) repeat-x;
}

#sitebody {
	display:block;
	width:980px;
	min-height:100%;
	margin:0 auto;
}

#header {
	width:960px;
	height:120px;
	padding:0 10px 0 10px;
	color:white;
	background: url(../img/head_bg_b.jpg) no-repeat right 0;
}

#header a:link, #header a:visited {
	color:white;
	text-decoration:none;
}

#header .left {
	float:left;
	width:680px;
	padding:22px 0;
}

#header .right {
	float:left;
	width:280px;
	padding:22px 0;
}

/* ## Header Menue ## start ## */

#header .button {
	padding:18px 0;
}

#header .button a {
	display:block;
	float:left;
	width:30px;
	height:30px;
	margin-right:5px;
}

#header .button a span{
	display:none;
	position:relative;
	z-index:2;
	top:35px;
	left:3px;
	white-space:nowrap;
	font-size:9pt;
}

#header .button a:hover span{
	display:block;
}

#header .button a.desktop, #header .button a.desktop_active {
	background: url(../img/head_desktop.png) no-repeat;
}
#header .button a.profil, #header .button a.profil_active {
	background: url(../img/head_profil.png) no-repeat;
}
#header .button a.admin, #header .button a.admin_active {
	background: url(../img/head_admin.png) no-repeat;
}
#header .button a.logout, #header .button a.logout_active {
	background: url(../img/head_logout.png) no-repeat;
}

#header .button a:hover.desktop, #header .button a.desktop_active,
#header .button a:hover.profil, #header .button a.profil_active,
#header .button a:hover.admin, #header .button a.admin_active,
#header .button a:hover.logout, #header .button a.logout_active
{
	background-position:bottom;
}


/* ## Header Menue ## end ## */

/* ## Tabs Menue ## start ## */

#tabs {
	clear:both;
	height:65px;
}

#tabs a {
	display:block;
	float:left;
	width:40px;
	height:40px;
	margin:0 5px 0 0;
	padding:0;
	text-decoration:none;
}

#tabs a.overview, #tabs a.overview_active {
	background: url(../img/symbols/tab_project.png) no-repeat;
}
#tabs a.msgs, #tabs a.msgs_active {
	background: url(../img/symbols/tab_msgs.png) no-repeat;
}
#tabs a.tasks, #tabs a.tasks_active {
	background: url(../img/symbols/tab_tasks.png) no-repeat;
}
#tabs a.miles, #tabs a.miles_active {
	background: url(../img/symbols/tab_miles.png) no-repeat;
}
#tabs a.files, #tabs a.files_active {
	background: url(../img/symbols/tab_files.png) no-repeat;
}
#tabs a.users, #tabs a.users_active {
	background: url(../img/symbols/tab_users.png) no-repeat;
}
#tabs a.tracking, #tabs a.tracking_active {
	background: url(../img/symbols/tab_tracking.png) no-repeat;
}
#tabs a.system, #tabs a.system_active {
	background: url(../img/symbols/tab_system.png) no-repeat;
}

#tabs a:hover.overview, #tabs a.overview_active,
#tabs a:hover.msgs, #tabs a.msgs_active,
#tabs a:hover.tasks, #tabs a.tasks_active,
#tabs a:hover.miles, #tabs a.miles_active,
#tabs a:hover.files, #tabs a.files_active,
#tabs a:hover.users, #tabs a.users_active,
#tabs a:hover.tracking, #tabs a.tracking_active,
#tabs a:hover.system, #tabs a.system_active
{
	background-position:bottom;
}

#tabs a span{
	display:none;
	position:relative;
	z-index:2;
	top:45px;
	left:3px;
	white-space:nowrap;
	font-size:9pt;
}
#tabs a:hover span{
	display:block;
}

/* ## Tabs Menue ## end ## */

table.login {
	color:white;
	margin:0 auto;
}
table.login td{
	margin:0;
	padding:0;
}
table.login .left{
	display:block;
	width:26px;
	height:158px;
	background: url(../img/login_left.jpg) no-repeat;
}
table.login td.mid{
	padding:0 15px 0 15px;
	height:158px;
	background: url(../img/login_mid.jpg) repeat-x;
	text-align:left;
}
table.login .right{
	display:block;
	width:26px;
	height:158px;
	background: url(../img/login_right.jpg) no-repeat;
}

#contentwrapper {
	display:block;
	padding:26px 10px 0 10px;
}

/* ## Content Left ## start ## */

.content_left {
	float:left;
	width:660px;
	margin:0 20px 0 0;
}

.block_a, .block_b, .block_c {
	width:638px;
	margin:0 0 25px 0;
	padding:2px;
}

.block_a {
	background: url(../img/block_bg_a.png);
	border:1px solid rgb(139,157,186);
	color:#2a4069;
}

.block_b {
	background: url(../img/block_bg_b.png);
	border:1px solid rgb(163,163,163);
	color:#4c4b4b;
}

.content_left .block_b a {
	color:#4c4b4b;
}

.block_c {
	background: url(../img/block_bg_c.png);
	border:1px solid rgb(186,164,139);
	color:#6b582a;
}

.content_left .block_c a{
	color:#6b582a;
}

.block_a .in,.block_b .in,.block_c .in {
	padding:5px 5px 0 5px;
}
.block_a .in {
	background: url(../img/block_in_bg_a.png) repeat-x;
}
.block_b .in {
	background: url(../img/block_in_bg_b.png) repeat-x;
}
.block_c .in {
	background: url(../img/block_in_bg_c.png) repeat-x;
}

.block_in_wrapper {
	width:586px;
	margin:0 0 15px 0;
	padding:15px 0 15px 40px;
	background:white;
	border:1px solid #8b9dba;
}

.block_b .block_in_wrapper, .block_b .avatar, block_b  {
	border-color:#bababa;
}

.block_c .block_in_wrapper, .block_c .avatar {
	border-color:#bab78b;
}

.block_b ul li.bg_a .bg_one, .block_b ul li.bg_b .bg_one, .block_b tr.bg_second td {
	background: url(../img/block_bg_b.png);
	border-bottom:1px solid #d9d9d9;
}
.block_b ul li.bg_a .bg_two, .block_b ul li.bg_b .bg_two, .block_b tr.bg_first td {
	background:white;
	border-bottom:1px solid #d9d9d9;
}

/* ## Tabs ## start ## */
.tabs {
	height:56px;
}

.tabs a {
	float:left;
	display:block;
	padding:10px 10px 10px 10px;
	margin-right:1px;
	background:#f4f4f4;
}


/* ## Tabs ## end ## */

/* ## Block-headline - Aufklappfunktion ## start ## */
a.win_block {
	display:block;
	width:100%;
	height:33px;
	background: url(../img/win_up.png) no-repeat 602px 8px;
}
a:hover.win_block {
	background-position:602px -17px;
}
a.win_none {
	display:block;
	width:100%;
	height:33px;
	background: url(../img/win_down.png) no-repeat 602px 8px;
}
a:hover.win_none {
	background-position:602px -17px;
}

.win_tools {
	position:absolute;
	display:block;
	height:32px;
	top:-33px;
	z-index:255;
}
.win_tools h2 a:hover span {
   	text-decoration:underline;
}
a.wintool_close, a.wintool_edit, a.wintool_del {
	display:block;
	float:left;
	width:16px;
	height:16px;
	margin:8px 4px 0 0;
}

a.wintool_close {
	background: url(../img/wintool_close.png) no-repeat;
}

a.wintool_edit {
	background: url(../img/wintool_edit.png) no-repeat;
}

a.wintool_del {
	background: url(../img/wintool_del.png) no-repeat;
}

a:hover.wintool_close, a:hover.wintool_edit, a:hover.wintool_del {
	background-position: bottom;
}


/* ## Block-headline - Aufklappfunktion ## end ## */

.headline {
	height:33px;
	width:100%;
}

.content_left .headline a:hover {
	text-decoration:none;
}

.headline img {
	float:left;
	margin-left:2px;
}

.headline span {
	float:left;
	display:block;
	padding:5px 0 0 6px;
	cursor:pointer;
}

.content_left a, .content_right a {
	color:#2a4069;
}

.content_left a:hover, .content_right a:hover {
	text-decoration:underline;
}

/* ## Content Left Table ## start ## */

.table_head table, .thead {
	font-size:10pt;
	height:23px;
	font-weight:bold;
}

.block_a .table_head table {
	background:#cedbec;
}

.block_b .table_head table {
	background:#e3e3e3;
}

.block_c .table_head table {
	background:#e6e4d6;
}

ul li{
	height:100%;
	width:100%;
	clear:both;
}

/* ## Color Mix ## start ## */
ul li.bg_a{
	background:rgb(255,255,255);
}

ul li.bg_b{

}

/* ## Color Mix ## end ## */

.block_a .marker_late table, .block_a .marker_late a, .block_b .marker_late table, .block_b .marker_late a , .block_c .marker_late table, .block_c .marker_late a {
	color: rgb(198,36,36);
}
.block_a .marker_today table, .block_a .marker_today a, .block_b .marker_today table, .block_b .marker_today a, .block_c .marker_today table, .block_c .marker_today a {
	color: rgb(55,120,20);
}

.marker_all_closed table, .marker_all_closed a {
	color:#2a4069;
	border-color:#2a4069;
	opacity:.6;
	filter:alpha(opacity=60);
	-moz-opacity:.6;
}

.focus_off {
	margin-top:1px;
	border-bottom:1px solid #c8d6e8;
}

.block_b .focus_off {
	border-color:#d9d9d9;
}

.block_c .focus_off {
	border-color:#e2e0cf;
}

.focus_on {
	margin-top:0;
	border-top:1px solid rgb(138,157,186);
	border-bottom:1px solid rgb(138,157,186);
}

.marker_late .focus_on, .marker_late .focus_on table {
	border-color: rgb(198,36,36);
}

.marker_today .focus_on, .marker_today .focus_on table {
	border-color: rgb(55,120,20);
}

.block_a .marker_all .focus_on, .block_a table {
	border-color: rgb(138,157,186);
}

.block_b .marker_all .focus_on, .block_b table{
	border-color:#4c4b4b;
}

.block_c .marker_all .focus_on, .block_c table {
	border-color:#6b582a;
}

.table_body {
	float:left;
	margin:0 0 15px 0;
	overflow:hidden;
}

table td {
	font-size:10pt;
	padding:5px 0 5px 0;
}

table span.info {
	font-size:8pt;
}

table td.a {
	width:40px;

}
table td.b, table.description td.b {
	width:230px;
	padding-right:4px;
}
table td.c {
	width:160px;
}
table td.d {
	width:147px;
}

table td.e {
	width:47px;
}
table td.tools {
	width:47px;
}
table.description {
	border-top:1px dashed;
}

table.description td{
	padding:15px 0 17px 0;
}

table td.descript {
	width:588px;
}
table td.descript .descin {
	width:588px;
	overflow-x:auto;
	overflow-y:none;
}
table td.message {
	width:404px;
	overflow:auto;
}
table td.message .msgin {
	width:393px;
	padding-right:11px;
	overflow-x:auto;
	overflow-y:none;
}

table td.label {
	width:100px;
}

.accordion_toggle {
	position:relative;
}
.accordion_toggle a.open {
	position:absolute;
	top:-26px;
	left:40px;
	width:220px;
	height:21px;
	margin-bottom:-26px;
	padding-top:5px;
	z-index:100;
	background: url(../img/open_a.png) no-repeat right;
}
.accordion_toggle a:hover.open {
	background: url(../img/open_o.png) no-repeat right;
	text-decoration:none;
}
.accordion_toggle_active a.open{
	background: url(../img/close_a.png) no-repeat right;
}
.accordion_toggle_active a:hover.open{
	background: url(../img/close_o.png) no-repeat right;
	text-decoration:none;
}
.link_in_toggle {
	position:relative;
	z-index:101;
}
.link_in_toggle a {
	position:absolute;
	top:-26px;
	left:40px;
	height:21px;
	margin-bottom:-26px;
	padding-top:5px;
}

.accordion_content {
	overflow:hidden;
}

table.timeline {
	width:100%;
	background:#e6e4d6;
	float:left;
}
table.timeline tr.head {
	font-weight:bold;
}
table.timeline td {
	padding:3px 5px 3px 5px;
}
table.timeline td a{
	font-weight:bold;
}
table.timeline tr.content td {
	background:white;
}
table.timeline tr.content td.second {
	background:#f9f8f4;
}
table.timeline tr.content td.today {
	background:#f4faf2;
}
table.timeline tr.content td.nav {
	width:12px;
	text-align:center;
}
table.timeline tr.content td.nav a:hover {
	text-decoration:none;
}
table.timeline tr.content td.today, table.timeline tr.content td.today a{
	color: rgb(55,120,20);
}
table.timeline p{
	margin:5px 0;
}

/* ## Tools ## start ## */

table td.tools a {
	display:block;
	float:left;
	margin-right:5px;
	width:16px;
	height:16px;
}
a.tool_edit {
	background: url(../img/tool_edit.png) no-repeat;
}
a.tool_del {
	background: url(../img/tool_del.png) no-repeat;
}
a:hover.tool_edit, a:hover.tool_del {
	background-position: bottom;
}

/* ## Tools ## end ## */


/* ## Content Left Table ## end ## */
/* ## Content Left ## end ## */

/* ## Content Right ## start ## */

.content_right {
	float:left;
	width:280px;
}

.right_in {
	float:left;
	width:161px;
	border:1px solid #8b9dba;
	background:white;
	overflow: hidden;
}

.right_in h2 {
	background:#cedbec;
	padding:1px 3px 1px 3px;
	margin:0;
	position:relative;
}

.right_in li {
	padding-left:5px;
	height:20px;
	line-height:20px;
	float:left;
}

.right_in li a.user {
	float:left;
	padding-left:12px;
	background: url(../img/symbols/user_list.png) no-repeat left 4px;
}

a.chat {
	display:block;
	float:left;
	width:12px;
	height:12px;
	background: url(../img/icon_chat.png) no-repeat;
	margin:4px 0 0 5px;
}

#indicator1 {
	position:absolute;
	top:2px;
	right:5px;
}

.status_active {
	color: rgb(55,120,20);
}

.status_inactive {
	color: rgb(198,36,36);
}

/* ## Headlines ## start ## */

h1 {
	font-size:14pt;
	margin:0 0 10px 0;
}

h1.head {
	font-size:24pt;
	margin:0 0 0px 0;
	color:white;
	height:35px;
}

h1 span {
	font-size:11pt;
	font-weight:normal;
	margin-left:6px;
}

h2 {
	font-size:11pt;
	margin:0 0 10px 0;
}

h2.head {
	font-size:11pt;
	margin:0 0 10px 0;
	color:white;
	font-weight:normal;
}


/* ## Headlines ## end ## */

/* ## Variable Button ## start ## */
a.butn_link, a.butn_link_b, .block_b a.butn_link, .block_b a.butn_link_b, .block_c a.butn_link, .block_c a.butn_link_b {
	display:block;
	float:left;
	background: url(../img/butn_main_left_a.png) left bottom no-repeat;
	padding:0 0 0 5px;
	text-decoration:none;
	margin:0 5px 0 0;
}
.block_b a.butn_link, .block_b a.butn_link_b {
	background: url(../img/butn_main_left_b.png) left bottom no-repeat;
}
.block_c a.butn_link, .block_c a.butn_link_b {
	background: url(../img/butn_main_left_c.png) left bottom no-repeat;
}
a.butn_link_b, .block_b a.butn_link_b, .block_c a.butn_link_b {
	margin-left:40px;
}
a.butn_link span, a.butn_link_b span, .block_b a.butn_link span, .block_b a.butn_link_b span, .block_c a.butn_link span, .block_c a.butn_link_b span {
	width:auto;
	display:block;
	float:left;
	height:24px;
	line-height:24px;
	padding:0 8px 0 4px;
	background: url(../img/butn_main_right_a.png) right bottom no-repeat;
	cursor:pointer;
	font-size:12px;
	color:rgb(53,73,117);
}
.block_b a.butn_link span, .block_b a.butn_link_b span {
	background: url(../img/butn_main_right_b.png) right bottom no-repeat;
	color:#4c4b4b;
}

.block_c a.butn_link span, .block_c a.butn_link_b span {
	background: url(../img/butn_main_right_c.png) right bottom no-repeat;
	color:#6b582a;
}

a.butn_link span img {
   	float:left;
   	width:20px;
   	position:relative;
   	left:-3px;
   	top:3px;
}

a.butn_link:hover, a.butn_link_b:hover {
	background-position: left top;
	text-decoration:none;
}
a.butn_link:hover span, a.butn_link_b:hover span {
	background-position: right top;
}

a.butn_check, a.butn_checked, a.butn_reply {
	display:block;
	width:16px;
	height:16px;
	background: url(../img/check_a.png) no-repeat center top;
	margin:0 0 0 10px;
}
a.butn_reply {
	background: url(../img/reply_a.png) no-repeat center top;
}
a.butn_check:hover, a.butn_checked, a.butn_reply:hover {
	background-position:bottom;
}

a.scroll_left, a.scroll_right {
	display:block;
	width:9px;
	height:50px;
	margin:0 auto;
	background: url(../img/scroll_left.png) no-repeat center left;
}
a.scroll_right {
	background: url(../img/scroll_right.png) no-repeat center left;
}
a.scroll_left:hover, a.scroll_right:hover {
	background-position:center right;
}

/* ## Variable Button ## end## */


.calender_wrapper {
	border: 1px #8b9dba solid;
	float:left;
	background:#e7edf4;
}

.clock {
	clear:both;
	text-align:center;
	background: #cedbec;
	padding:2px;
	font-size:12px;
	border-top: 1px #8b9dba solid;
}

.avatar {
	float:left;
	border:1px solid #8b9dba;
	padding:3px;

}

.avatar img {
	float:left;
}

.paging_wrapper {
	float:right;
	height:24px;
	line-height:24px;
	width:439px;
	margin-top:-17px;
	padding:0 10px 1px 0;
	text-align:right;
}
.paginate {
	float:right;
	padding-top:3px;
}

/* ## Infos ## start ## */
.infowin_left {
	position:relative;
	top:-65px;
	left:315px;
	width:321px;
	height:40px;
	margin:0 0 -40px 0;
	font-size:8pt;
	float:left;
}
.infowin_left img {
   	float:left;
   	margin:-3px 3px -6px -3px;
}
.info_in_red, .info_in_green, .info_in_yellow {
	padding:5px;
	border:1px solid #c62424;
	float:right;
	color:#c62424;
	background:#f9e9e9;
	line-height:22px;
}
.info_in_green {
	border-color:#377814;
	color:#377814;
	background:#ebf1e7;
}
.info_in_yellow {
	border-color:#a68a03;
	color:#a68a03;
	background:#faf7e6;
}

/* ## Infos ## end ## */

/* ## Footer ## start ## */

.footer {
	clear:both;
	width:100%;
	min-width:980px;
	height:26px;
	font-size:9pt;
	background:rgb(53,73,117);
	color:white;
	margin-top:-26px;
}

.footer a {
	color:white;
}

.footer table {
	width:100%;
	height:26px;
}

.footer .mid {
	width:950px;
}

/* ## Footer ## end ## */

.tooltip {
	background:#e6e4d6;
	color:#6b582a;
	border:1px solid #6b582a;
	padding:10px;
	max-width:300px;
	z-index:100;
}

.export {
	width:26px;
	height:26px;
	margin-left:8px;
	float:left;
	position:relative;
	top:-5px;
	background: url(../img/symbols/export.png) no-repeat;
}
.export_men {
	float:left;
	visibility:hidden;
	height:26px;
	width:500px;
	position:absolute;
	left:100%;
	top:0;
}
.export a {
	float:left;
	display:block;
	width:26px;
	height:26px;
}

.export:hover .export_men {
	visibility:visible;
}


.waiting {
	background-image:url('../img/symbols/indicator_arrows.gif');
	background-repeat:no-repeat;
	background-position:center center;
}

.bigWaiting {
	background-image:url('img/bigWaiting.gif');
	background-repeat:no-repeat;
	background-position:center 20%;
	background-color:white;
}

.blackWaiting {
	background-image:url('img/blackWaiting.gif');
	background-repeat:no-repeat;
	background-position:center center;
	background-color:black;
}

.bigBlackWaiting {
	background-image:url('img/bigBlackWaiting.gif');
	background-repeat:no-repeat;
	background-position:center center;
	background-color:black;
}