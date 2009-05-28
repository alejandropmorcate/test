<?php
require("./init.php");
// variables
$action = getArrayVal($_GET, "action");
$id = getArrayVal($_GET, "id");
$user = getArrayVal($_GET, "user");
// output in xml or json
$mode = getArrayVal($_GET, "mode");
// create new array to xml converter
$xml = new toXml();
// Projects
if ($action == "project.get")
{
    $obj = (object) new project();
    $theData = $obj->getProject($id);
    $theRootNode = "project";
} elseif ($action == "myprojects.get")
{
    $obj = (object) new project();
    $theData = $obj->getMyProjects($id);

    $theRootNode = "myprojects";
} elseif ($action == "project.members.get")
{
    $obj = (object) new project();
    $theData = $obj->getProjectMembers($id);
    $theRootNode = "members";
}
// Users
elseif ($action == "user.profile.get")
{
    $obj = (object) new user();
    $theData = $obj->getProfile($id);
    $theRootNode = "user";
} elseif ($action == "user.id.get")
{
    $obj = (object) new user();
    $theData = $obj->getId($id);
    $theRootNode = "user";
} elseif ($action == "user.list.get")
{
    $obj = (object) new user();
    $theData = $obj->getAllUsers(100000);
    $theRootNode = "userlist";
} elseif ($action == "user.tasks.get")
{
    $obj = (object) new task();
    $project = new project();

    $myprojects = $project->getMyProjects($user);
    $theData = array();

    foreach($myprojects as $proj)
    {
        $theArr = $obj->getAllMyProjectTasks($proj["ID"], 10000, $user);
        array_push($theData, $theArr);
    }
    $theData = reduceArray($theData);
    $sort = array();
    foreach($theData as $data)
    {
        array_push($sort, $data["ID"]);
    }
    array_multisort($sort, SORT_NUMERIC, SORT_ASC, $theData);

    $theRootNode = "tasks";
}
// convert to XML or JSON
if ($mode == "json")
{
    $theXml = $xml->arrToJSON($theData);
}
else
{
    $theXml = $xml->arrToXml($theData, $theRootNode);
}
// output to the user
echo $theXml;

?>
