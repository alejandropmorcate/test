<?php
error_reporting(0);
require("./init.php");
function dircopy($srcdir, $dstdir, $breakdir)
{
    $num = 0;

    if (!is_dir($dstdir))
    {
        mkdir($dstdir);
    }
    if ($curdir = opendir($srcdir))
    {
        while ($file = readdir($curdir))
        {
            if ($file != '.' && $file != '..' and $file != $breakdir)
            {
                $srcfile = $srcdir . '\\' . $file;
                $dstfile = $dstdir . '\\' . $file;
                if (is_file($srcfile))
                {
                    if (copy($srcfile, $dstfile))
                    {
                        $num++;
                    }
                }
                else if (is_dir($srcfile))
                {
                    $num += dircopy($srcfile, $dstfile, CL_CONFIG);
                }
            }
        }
        closedir($curdir);
    }
    return $num;
}

$table6 = mysql_query("ALTER TABLE `user` ADD `zip` VARCHAR( 5 ) NOT NULL AFTER `lastlogin` ,
ADD `gender` CHAR( 1 ) NOT NULL AFTER `zip` ,
ADD `url` VARCHAR( 255 ) NOT NULL AFTER `gender`");
$table7 = mysql_query("ALTER TABLE `settings` CHANGE `locale` `locale` CHAR( 6 ) NOT NULL");
$table8 = mysql_query("ALTER TABLE `settings` ADD `timezone` CHAR( 80 ) NOT NULL AFTER `locale`");
if ($table8)
{
    $timezone = date_default_timezone_get();
    $set_timezone = mysql_query("UPDATE `settings` SET `timezone`='$timezone'");
}
$table9 = mysql_query("ALTER TABLE `user` CHANGE `locale` `locale` CHAR( 6 ) NOT NULL");

$table16 = mysql_query("UPDATE user SET admin=5 WHERE ID = 1");
$table17 = mysql_query("ALTER TABLE `messages` ADD `tags` VARCHAR( 255 ) NOT NULL AFTER `text`");
$table18 = mysql_query("ALTER TABLE `user` ADD `tags` VARCHAR( 255 ) NOT NULL AFTER `country`");
$table19 = mysql_query("ALTER TABLE `projectfolders` ADD `description` VARCHAR( 255 ) NOT NULL");
$table21 = mysql_query("ALTER TABLE `messages` ADD `milestone` INT( 10 ) NOT NULL");
$table20 = mysql_query("ALTER TABLE `settings` ADD `mailnotify` TINYINT( 1 ) NOT NULL DEFAULT '1',
ADD `mailfrom` VARCHAR( 255 ) NOT NULL ,
ADD `mailmethod` VARCHAR( 5 ) NOT NULL ,
ADD `mailhost` VARCHAR( 255 ) NOT NULL ,
ADD `mailuser` VARCHAR( 255 ) NOT NULL ,
ADD `mailpass` VARCHAR( 255 ) NOT NULL");
if ($table20)
{
    $upd = mysql_query("UPDATE settings SET mailnotify=1,mailfrom='Collabtive@localhost',mailmethod='mail'");
}

$docopy = false;
if (!file_exists(CL_ROOT . "/files/" . CL_CONFIG))
{
    mkdir(CL_ROOT . "/files/" . CL_CONFIG, 0777);
    $docopy = true;
}
if (!file_exists(CL_ROOT . "/files/" . CL_CONFIG . "/avatar/"))
{
    mkdir(CL_ROOT . "/files/" . CL_CONFIG . "/avatar/", 0777);
}
if ($docopy)
{
    dircopy("./files/", "./files/" . CL_CONFIG . "/", CL_CONFIG);
}
// 0.4.8 -> 0.4.9
$table21 = mysql_query("ALTER TABLE `settings` ADD `mailfromname` VARCHAR( 255 ) NOT NULL AFTER `mailfrom`");
$table22 = mysql_query("ALTER TABLE `user` ADD `rate` VARCHAR( 10 ) NOT NULL");
$table23 = mysql_query("ALTER TABLE `projekte` ADD `budget` FLOAT NOT NULL DEFAULT '0'");
$table24 = mysql_query("ALTER TABLE `user` ADD `tel1` VARCHAR( 255 ) NOT NULL AFTER `email` , ADD `tel2` VARCHAR( 255 ) NOT NULL AFTER `tel1`");
$table25 = mysql_query("ALTER TABLE `settings` ADD `dateformat` VARCHAR( 50 ) NOT NULL AFTER `timezone`");
$table25 = mysql_query("ALTER TABLE `files` ADD `folder` INT( 10 ) NOT NULL");
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
mysql_query("ALTER TABLE `user` CHANGE `zip` `zip` VARCHAR( 10 )"); // overlooked with 0.5
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
$opt8 = mysql_query("OPTIMIZE TABLE `timetracker`");
$opt8 = mysql_query("OPTIMIZE TABLE `projectfolders`");
$template->display("update.tpl");

?>