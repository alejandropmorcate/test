<?php

require_once('unit/unit_tester.php');
require_once('unit/reporter.php');
require_once('unit/autorun.php');
include("init.php");
error_reporting(E_ALL);

class TestOfCollabtive extends UnitTestCase
{
    function testProject()
    {
        $userid = $_SESSION["userid"];
        $project = new project();
        // add a project
        $pid = $project->add("testname", "testdesc", "12.01.08");
        $this->pid = $pid;
        $this->assertTrue($pid);
        // fetch the project
        $this->assertFalse($project->getProject(0));
        $this->assertTrue($project->getProject($pid));
        // edit the project
        $this->assertTrue($project->edit($pid, "testname2", "testdesc2", "12.02.08"));
        $this->assertTrue($project->getProjects());
        // get project timeline
        $this->assertTrue($project->getTimeline($pid, 0, 7));
        // get projects progress
        $this->assertNotNull($project->getProgress($pid));
        // close the project
        $this->assertTrue($project->close($pid));
        // open the project again
        $this->assertTrue($project->open($pid));
        // check if project files folder was created
        $this->assertTrue(file_exists(CL_ROOT . "/files/" . CL_CONFIG . "/$pid"));

        $this->assertNoErrors();
    }

    function testUser()
    {
        $userid = $_SESSION["userid"];
        $project = new project();
        $userobj = new user();
        // Add normal and admin user
        $uid = $userobj->add("Name1", "Email1", 1, "Password1");
        $this->assertTrue($uid);
        $this->uid = $uid;
        $adminid = $userobj->add("AdminName1", "AdminEmail1", 1, "AdminPassword1", 1);
        $this->adminid = $adminid;
        $this->assertTrue($adminid);
        // Edit
        $this->assertTrue($userobj->edit($uid, "Name2", "Email2", "2", "66117", "m", "www", "Address1_2", "Address2_2", "State2", "Country2", "" , "Locale2"));
        $this->assertTrue($userobj->edit($uid, "Name3", "Email3", "3", "66117", "w", "", "Address1_3", "Address2_3", "State3", "Country3", "", "Locale3", "Avatar3"));
        // Edit password
        $this->assertFalse($userobj->editpass($uid, "Password1", "Password2", "Password3"));
        $this->assertTrue($userobj->editpass($uid, "Password1", "Password2", "Password2"));
        // Get profile
        $this->assertFalse($userobj->getProfile(0));
        $this->assertTrue($userobj->getProfile($uid));
        // Get avatar
        $this->assertFalse($userobj->getAvatar(0));
        $this->assertTrue($userobj->getAvatar($uid));
        // Login
        $this->assertFalse($userobj->login("", ""));
        $this->assertFalse($userobj->login("", "Password2"));
        $this->assertFalse($userobj->login("Name3", ""));
        $this->assertFalse($userobj->login("Name3", "PasswordFalse"));
        $this->assertTrue($userobj->login("Name3", "Password2"));
        // Get all user profiles
        $this->assertTrue($userobj->getAllUsers());
        $this->assertTrue($userobj->getAllUsers(100));
        // Get online list
        $this->assertNotNull($userobj->getOnlineList());
        // Return if user is online
        $this->assertFalse($userobj->isOnline(0));
        $this->assertTrue($userobj->isOnline($uid));
        // Assign a user to a project
        $this->assertTrue($project->assign($uid, $this->pid));
        // Get a user's projects or a project's users respectively
        $this->assertNotNull($project->getMyProjectIds($uid));
        $this->assertNotNull($project->getMyProjects($uid));
        $this->assertFalse($project->getProjectMembers(0));
        $this->assertTrue($project->getProjectMembers($this->pid));
        // Delete the assignment of a user to a project
        $this->assertTrue($project->deassign($uid, $this->pid));

        $this->assertNoErrors();
    }

    function testMessages()
    {
        $project = new project();
        $userobj = new user();
        $msg = new message();
        // Add a message
        $mid = $msg->add($this->pid, "test" , "huhu" , "tag", $this->uid , "huhu", 0,0);
        $this->mid = $mid;
        $this->assertTrue($mid);
        // Get a message
        $this->assertFalse($msg->getMessage(0));
        $this->assertNotNull($msg->getMessage($mid));
        // Edit a message
        $this->assertTrue($msg->edit($mid, "title2", "text2", "tags,tags2"));
        // Reply to a message
        $rid = $msg->add($this->pid, "tes2t" , "huhu" , "tag,tags2", $this->uid , "huhu", $mid,0);
        $this->rid = $rid;
        $this->assertTrue($rid);
        // Get the replies for a message
        $this->assertTrue($msg->getReplies($mid));
        $this->assertFalse($msg->getReplies(1));
        // Get the latest messages
        $this->assertNotNull($msg->getLatestMessages());
        // Get replies for a reply (none available)
        $this->assertFalse($msg->getReplies($rid));
        // Get a project's messages
        $this->assertTrue($msg->getProjectMessages($this->pid));
        $this->assertFalse($msg->getProjectMessages(0));

        $this->assertNoErrors();
    }

    function testSearch()
    {
        $userid = $_SESSION["userid"];
        $such = new search();
        $query = "e";
        $result = $such->dosearch($query);
        $this->assertNotNull($result);
        $num = count($result);
        $this->assertNotNull($result);
        $finresult = array();
        foreach($result as $res)
        {
            if ($res["type"] != "project" and $res["type"] != "user")
            {
                if (chkproject($userid, $res["project"]))
                {
                    array_push($finresult, $res);
                }
            }
            else
            {
                if (chkproject($userid, $res["ID"]))
                {
                    array_push($finresult, $res);
                }
            }
        }
        $this->assertNotNull($finresult);
        $this->assertNoErrors();
    }

    function testProjectSearch()
    {
        $userid = $_SESSION["userid"];
        $such = new search();
        $query = "e";
        $result = $such->dosearch($query, $this->pid);
        $this->assertNotNull($result);
        $this->assertTrue($result);
        $num = count($result);
        $this->assertNotNull($result);
        $finresult = array();
        foreach($result as $res)
        {
            if ($res["type"] != "project" and $res["type"] != "user")
            {
                if (chkproject($userid, $res["project"]))
                {
                    array_push($finresult, $res);
                }
            }
            else
            {
                if (chkproject($userid, $res["ID"]))
                {
                    array_push($finresult, $res);
                }
            }
        }
        $this->assertNotNull($finresult);
        $this->assertNoErrors();
    }

    function testSettings()
    {
        $set = new settings();
        // get systemsettings
        $this->assertTrue($set->getSettings());
        // get available templates
        $this->assertTrue($set->getTemplates());

        $this->assertNoErrors();
    }

    function testMilestone()
    {
        $milestone = new milestone();
        $msid = $milestone->add($this->pid, "Milestonename1", "Description1", "12.01.2030", 1);
        $this->msid = $msid;

        $this->assertTrue($msid);
        // Edit a milestone
        $this->assertTrue($milestone->edit($msid, "Milestonename2", "Description2", "12.02.2030"));
        // Close a milestone
        $this->assertTrue($milestone->close($msid));
        // Get all finished milestones from a project
        $this->assertFalse($milestone->getDoneProjectMilestones(0));
        // Open a milestone
        $this->assertTrue($milestone->open($msid));
        // Get milestones
        $this->assertNotNull($milestone->getMilestones(0));
        $this->assertTrue($milestone->getMilestones());
        // Get all open milestones from a project
        $this->assertFalse($milestone->getAllProjectMilestones(0));
        $this->assertTrue($milestone->getAllProjectMilestones($this->pid));
        // Get today's open milestones from a project
        $this->assertFalse($milestone->getTodayProjectMilestones(0));
        $this->assertFalse($milestone->getTodayProjectMilestones($this->pid));
        // Get all open milestones wich are not late from a project
        $this->assertFalse($milestone->getProjectMilestones(0));
        $this->assertTrue($milestone->getProjectMilestones($this->pid));
        // Get a milestone
        $this->assertFalse($milestone->getMilestone(0));
        $this->assertNotNull($milestone->getMilestone($msid));

        $this->assertNoErrors();
    }

    function testTasklist()
    {
        $tasklist = new tasklist();
        $milestone = new milestone();
        // Add a tasklist
        $tlid = $tasklist->add_liste($this->pid, "TL_name1", "TL_description1");
        $this->tlid = $tlid;
        $this->assertTrue($tlid);
        // Edit a tasklist
        $this->assertTrue($tasklist->edit_liste($tlid, "TL_name2", "TL_description2", $this->msid));
        // Close a tasklist (which should close the associated milestone as well)
        $this->assertTrue($tasklist->close_liste($tlid));
        // Open a tasklist (and the milestone, too)
        $this->assertTrue($tasklist->open_liste($tlid));
        $this->assertTrue($milestone->open($this->msid));
        // Get a project's tasklists
        $this->assertFalse($tasklist->getProjectTasklists(0));
        $this->assertNotNull($tasklist->getProjectTasklists($this->pid));
        // Get a tasklist
        $this->assertFalse($tasklist->getTasklist(0));
        $this->assertNotNull($tasklist->getTasklist($tlid));
        // Get a tasklist's tasks
        $this->assertFalse($tasklist->getTasksFromList(0));

        $this->assertNoErrors();
    }

    function testTask()
    {
        $task = new task();
        $tasklist = new tasklist();
        // Add a task
        $tid = $task->add("24.07.2010", "T_title1", "T_text1", $this->tlid, $this->adminid, $this->pid);
        $this->tid = $tid;
        $this->assertTrue($tid);
        // Edit a task and make it be late
        $this->assertTrue($task->edit($tid, "25.07.2010", "T_title2", "T_text2", $this->tlid, $this->uid));
        // Open a task (and the tasklist, too)
        $this->assertTrue($task->open($tid));
        // Assign a task to a user
        $this->assertTrue($task->assign($tid, $this->adminid));
        // Delete the assigment
        $this->assertTrue($task->deassign($tid, $this->adminid));
        // Get a task
        $this->assertFalse($task->getTask(0));
        $this->assertTrue($task->getTask($tid));
        // Get a project's tasks
        $this->assertFalse($task->getProjectTasks(0));
        $this->assertTrue($task->getProjectTasks($this->pid));
        // Get a project's open, not late tasks
        $this->assertFalse($task->getMyProjectTasks(0));
        $this->assertTrue($task->getMyProjectTasks($this->pid));
        // Get a users's project tasks
        $this->assertFalse($task->getAllMyProjectTasks(0));
        $this->assertTrue($task->getAllMyProjectTasks($this->pid));
        // Get a user's late project tasks
        $this->assertFalse($task->getMyLateProjectTasks(0));
        $this->assertFalse($task->getMyLateProjectTasks($this->pid));
        // Get a user's project tasks for today
        $this->assertFalse($task->getMyTodayProjectTasks(0));
        $this->assertFalse($task->getMyTodayProjectTasks($this->pid));
        // Get a tasklist's tasks
        $this->assertTrue($tasklist->getTasksFromList($this->tlid));
        // Close a task (which should close the associated tasklist as well)
        $this->assertTrue($task->close($tid));
        // Get a user's done project tasks
        $this->assertFalse($task->getMyDoneProjectTasks(0));
        $this->assertNotNull($task->getMyDoneProjectTasks($this->pid));
        // Get a task's owner
        $this->assertFalse($task->getUser(0));
        $this->assertTrue($task->getUser($tid));

        $this->assertNoErrors();
    }

    function testTimetracker()
    {
        $timetracker = new timetracker();
        // Add a timetracker
        $this->assertFalse($timetracker->add($this->adminid, $this->pid, $this->tid, "Comment1", "15:04", "15:03"));

        $ttid = $timetracker->add($this->adminid, $this->pid, $this->tid, "Comment1", "15:01", "15:15");
        $this->ttid = $ttid;
        $this->assertTrue($ttid);
        // Edit a timetracker
        $this->assertFalse($timetracker->edit($this->ttid, 0, "frgr", "16:45", "15:00"));
        $this->assertTrue($timetracker->edit($this->ttid, 0, "tgt", "1215647865", "1215647890"));
        // Get a user's timetracking
        $this->assertNotNull($timetracker->getUserTrack($this->adminid));
        $this->assertNotNull($timetracker->getUserTrack($this->adminid, $this->pid));
        $this->assertFalse($timetracker->getUserTrack($this->uid));
        // Get a project's timetracking
        $this->assertNotNull($timetracker->getProjectTrack($this->pid));
        $track = $timetracker->getProjectTrack($this->pid, $this->adminid);
        $this->assertNotNull($track);
        $this->assertFalse($timetracker->getProjectTrack(0));
        // Get total tracked time
        $this->assertNotNull($timetracker->getTotalTrackTime($track));

        $this->assertNoErrors();
    }

    function testFile()
    {
        $file = new datei();
        // Delete a file
        $this->assertFalse($file->loeschen(0));
        // Get a file
        $this->assertFalse($file->getFile(0));
        // Get a project's files
        $this->assertFalse($file->getProjectFiles($this->pid));

        $this->assertNoErrors();
    }

    function testDatabase()
    {
        $db = new datenbank();
        // Establish a connection
        $this->assertError($db->connect("A", "B", "C"));
        $this->assertError($db->connect("A", "B", "C", "D"));

        $this->assertNoErrors();
    }

    function testLog()
    {
        $log = new mylog();
        // Add a log entry
        $lid = $log->add("testname2", "Project", "1", $this->pid);
        $this->lid = $lid;
        $this->assertTrue($lid);
        // Get a project's log entries
        $this->assertNotNull($log->getProjectLog($this->pid));
        $this->assertFalse($log->getProjectLog(430));
        // Get a user's log entries
        $this->assertNotNull($log->getUserLog($this->uid));
        // Get the latest log entries
        $this->assertNotNull($log->getLog());

        $this->assertNoErrors();
    }

    function testTags()
    {
        $cloud = new tags();
        $this->assertNotNull($cloud->getTagcloud($this->pid));
        $this->assertNoErrors();
    }

    function testInitfunctions(){
		$this->assertNotNull(detectSSL());
		$this->assertNotNull(getMyUrl());
    }
    function testEnde()
    {
        // Create objects for deletion
        $project = new project();
        $userobj = new user();
        $msg = new message();
        $task = new task();
        $tasklist = new tasklist();
        $milestone = new milestone();
        $timetracker = new timetracker();
        $log = new mylog();
        // Delete log entry
        $this->assertTrue($log->del($this->lid));
        // Delete messages
        $this->assertTrue($msg->del($this->mid));
        $this->assertTrue($msg->del($this->rid));
        // Delete user
        $this->assertTrue($userobj->del($this->uid));
        // Delete admin
        $this->assertTrue($userobj->del($this->adminid));
        // Delete milestone
        $this->assertTrue($milestone->del($this->msid));
        // Delete task
        $this->assertTrue($task->del($this->tid));
        // Delete tasklist
        $this->assertTrue($tasklist->del_liste($this->tlid));
        // Delete timetracker
        $this->assertTrue($tasklist->del_liste($this->ttid));
        // Delete project
        $this->assertTrue($project->del($this->pid));
        // Check if project files folder was deleted
        $this->assertFalse(file_exists(CL_ROOT . "/files/" . CL_CONFIG . "/" . $this->pid));
        $this->assertNoErrors();
    }
}

?>