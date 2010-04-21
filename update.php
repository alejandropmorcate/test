<?php
error_reporting(0);
require("./init.php");

// -> 0.5
mysql_query("
CREATE TABLE IF NOT EXISTS `roles` (
  `ID` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `projects` text NOT NULL,
  `tasks` text NOT NULL,
  `milestones` text NOT NULL,
  `messages` text NOT NULL,
  `files` text NOT NULL,
  `timetracker` text NOT NULL,
  `admin` text NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM;");

mysql_query("
CREATE TABLE IF NOT EXISTS `roles_assigned` (
  `ID` int(10) NOT NULL auto_increment,
  `user` int(10) NOT NULL,
  `role` int(10) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM;");

$upd = mysql_query("UPDATE settings SET dateformat='d.m.Y'");

$sel = mysql_query("SELECT COUNT(*) FROM roles");
$rolenum = mysql_fetch_row($sel);
if ((int) $rolenum[0] < 1)
{
    // insert default roles
    mysql_query("ALTER TABLE `roles` ADD `chat` TEXT AFTER `timetracker`"); // needed when updating from before 0.5

    $rolesobj = new roles();

    $adminrid = $rolesobj->add("Admin", array("add" => 1, "edit" => 1, "del" => 1 , "close" => 1), array("add" => 1, "edit" => 1, "del" => 1, "close" => 1), array("add" => 1, "edit" => 1, "del" => 1, "close" => 1), array("add" => 1, "edit" => 1, "del" => 1, "close" => 1), array("add" => 1, "edit" => 1, "del" => 1), array("add" => 1, "edit" => 1, "del" => 1, "read" => 1), array("add" => 0), array("add" => 1));

    $userrid = $rolesobj->add("User", array("add" => 1, "edit" => 1, "del" => 0, "close" => 0), array("add" => 1, "edit" => 1, "del" => 0), array("add" => 1, "edit" => 1, "del" => 1), array("add" => 1, "edit" => 1, "del" => 1), array("add" => 1, "edit" => 1, "del" => 1), array("add" => 1, "edit" => 1, "del" => 1, "read" => 0), array("add" => 1) , array("add" => 0));

    $clientrid = $rolesobj->add("Client", array("add" => 0, "edit" => 0, "del" => 0, "close" => 0), array("add" => 0, "edit" => 0, "del" => 0), array("add" => 0, "edit" => 0, "del" => 0), array("add" => 0, "edit" => 0, "del" => 0), array("add" => 0, "edit" => 0, "del" => 0), array("add" => 0, "edit" => 0, "del" => 0, "read" => 0), array("add" => 0), array("add" => 0));

    if (!$adminrid or !$userrid or !$clientrid)
    {
        die("failed to create initial roles");
    }
    // get all admins
    $admins = mysql_query("SELECT ID FROM user WHERE admin = 5");
    // assign all admins to the admin role
    while ($admin = mysql_fetch_row($admins))
    {
        $rolesobj->assign($adminrid, $admin[0]);
    }

    $users = mysql_query("SELECT ID FROM user WHERE admin = 1");
    while ($user = mysql_fetch_row($users))
    {
        $rolesobj->assign($userrid, $user[0]);
    }

    $clients = mysql_query("SELECT ID FROM user WHERE admin = 0");
    while ($client = mysql_fetch_row($clients))
    {
        $rolesobj->assign($clientrid, $client[0]);
    }
    sleep(1);
}
// drop the admin field, it is no longer needed
mysql_query("ALTER TABLE `user` DROP `admin`");
// drop the favicon field in system settings, no longer needed
mysql_query("ALTER TABLE `settings` DROP `favicon`");
// add new fields for rss username and pass
mysql_query("ALTER TABLE `settings` ADD `rssuser` VARCHAR( 255 ) NOT NULL ,
ADD `rsspass` VARCHAR( 255 ) NOT NULL");

// 0.5.5
mysql_query("ALTER TABLE `roles` ADD `chat` TEXT AFTER `timetracker`");
mysql_query("ALTER TABLE `user` CHANGE `company` `company` VARCHAR( 256 )");

//0.6
mysql_query("ALTER TABLE `projectfolders` ADD `parent` INT(10) unsigned NOT NULL default '0' AFTER `ID`");
mysql_query("ALTER TABLE `projectfolders` ADD `visible` text NOT NULL AFTER `description`");
mysql_query("ALTER TABLE `files` ADD `visible` text NOT NULL");
mysql_query("ALTER TABLE `files` ADD `user` INT(10) NOT NULL default '0' AFTER `milestone`");
mysql_query("ALTER TABLE `user` CHANGE `zip` `zip` VARCHAR( 10 )"); // overlooked with 0.5

//0.6.3
mysql_query("ALTER TABLE `files` DROP `seenby`");

// version independent
// clear templates cache
$handle = opendir($template->compile_dir);
while (false !== ($file = readdir($handle)))
{
    if ($file != "." and $file != "..")
    {
        unlink(CL_ROOT . "/" . $template->compile_dir . "/" . $file);
    }
}
// optimize tables
$opt1 = mysql_query("OPTIMIZE TABLE `files`");
$opt2 = mysql_query("OPTIMIZE TABLE `files_attached`");
$opt3 = mysql_query("OPTIMIZE TABLE `log`");
$opt4 = mysql_query("OPTIMIZE TABLE `messages`");
$opt5 = mysql_query("OPTIMIZE TABLE `milestones`");
$opt6 = mysql_query("OPTIMIZE TABLE `milestones_assigned`");
$opt7 = mysql_query("OPTIMIZE TABLE `projekte`");
$opt8 = mysql_query("OPTIMIZE TABLE `projekte_assigned`");
$opt9 = mysql_query("OPTIMIZE TABLE `timetracker`");
$opt10 = mysql_query("OPTIMIZE TABLE `projectfolders`");
$opt11 = mysql_query("OPTIMIZE TABLE `ŗoles`");
$opt12 = mysql_query("OPTIMIZE TABLE `roles_assigned`");

$template->display("update.tpl");
?>