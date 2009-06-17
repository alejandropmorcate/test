<?php
/**
 * class datei (file) provides methods to handle files and folders
 *
 * @author Open Dynamics / Philipp Kiszka <info@o-dyn.de>
 * @name datei
 * @version 0.5.5
 * @package Collabtive
 * @link http://www.o-dyn.de
 * @license http://opensource.org/licenses/gpl-license.php GNU General Public License v3 or later
 */
class datei
{
    /**
     * Constructor
     * Initialize the event log
     */
    function __construct()
    {
        $this->mylog = new mylog;
    }

    /**
     * Delete a file
     *
     * @param int $datei File ID
     * @return bool
     */
    function loeschen($datei)
    {
        $datei = (int) $datei;

        $sel1 = mysql_query("SELECT datei,name,project,title FROM files WHERE ID = $datei");
        $thisfile = mysql_fetch_row($sel1);
        if (!empty($thisfile))
        {
            $fname = $thisfile[1];
            $project = $thisfile[2];
            $ftitle = $thisfile[3];
            $thisfile = $thisfile[0];

            $delfile = "./" . $thisfile;

            if (!file_exists($delfile))
            {
                return false;
            }
            $del = mysql_query("DELETE FROM files WHERE ID = $datei");
            $del2 = mysql_query("DELETE FROM files_attached WHERE file = $datei");
            if ($del)
            {
                if (unlink($delfile))
                {
                    $this->mylog->add($ftitle, 'datei' , 3, $project);
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        else
        {
            return false;
        }
    }

    function moveFile($file, $target)
    {
        $file = (int) $file;
        $target = (int)$target;

        $thefile = $this->getFile($file);

        $thefolder = $this->getFolder($target);

        $targetstr = "files/" . CL_CONFIG . "/" . $thefile["project"] . "/" . $thefolder["name"] . "/" . $thefile["name"];
        $rootstr = CL_ROOT . "/" . $thefile["datei"];

        $upd = mysql_query("UPDATE files SET datei = '$targetstr', folder = '$thefolder[ID]' WHERE ID = $thefile[ID]");
        return rename($rootstr, $targetstr);
    }

    /**
     * Create a new folder
     *
     * @param int $project Project ID the folder belongs to
     * @param string $folder Name of the new folder
     * @param string $desc Description of the folder
     * @return bool
     */
    function addFolder($parent, $project, $folder, $desc, $visible = "")
    {
        $project = (int) $project;
        $folder = mysql_real_escape_string($folder);
        $desc = mysql_real_escape_string($desc);

        $folder = str_replace("ä", "ae" , $folder);
        $folder = str_replace("ö", "oe" , $folder);
        $folder = str_replace("ü", "ue" , $folder);
        $folder = str_replace("ß", "ss" , $folder);
        // remove whitespace
        $folder = preg_replace("/\W/", "", $folder);
        $folder = preg_replace("/[^-_0-9a-zA-Z]/", "_", $folder);
        // insert the folder into the db
        $ins = mysql_query("INSERT INTO projectfolders (parent,project,name,description,visible) VALUES ($parent,$project,'$folder','$desc','$visstr')");
        if ($ins)
        {
            // create the folder
            $makefolder = CL_ROOT . "/files/" . CL_CONFIG . "/$project/$folder/";
            if (!file_exists($makefolder))
            {
                if (mkdir($makefolder, 0777))
                {
                    // folder created return true
                    return true;
                }
            }
            else
            {
                // folder already existed, return false
                return false;
            }
        }
        else
        {
            // folder wasnt created , return false
            return false;
        }
    }

    /**
     * Get directory
     *
     * @param string $id Directory
     * @return array $files Found files and directories
     */
    function getFolder($id)
    {
        $id = (int) $id;
        $sel = mysql_query("SELECT * FROM projectfolders WHERE ID = $id LIMIT 1");
        $folder = mysql_fetch_array($sel);
        $folder["subfolders"] = $this->getSubFolders($folder["ID"]);

        return $folder;
    }
    /**
     * Recursively get subdirectories of a given directory
     *
     * @param int $id Directory
     * @return array $files Found files and directories
     */
    function getSubFolders($parent)
    {
        $parent = (int) $parent;
        $sel = mysql_query("SELECT * FROM projectfolders WHERE parent = $parent");

        $folders = array();

        while ($folder = mysql_fetch_array($sel))
        {
            $folder["subfolders"] = $this->getSubFolders($folder["ID"]);
            array_push($folders, $folder);
        }

        if (!empty($folders))
        {
            return $folders;
        }
        else
        {
            return false;
        }
    }

    /**
     * Get all the directories in a project
     *
     * @param string $id project Project ID
     * @return array $files Found files and directories
     */
    function getProjectFolders($project, $parent = 0)
    {
        $project = (int) $project;

        $sel = mysql_query("SELECT * FROM projectfolders WHERE project = $project AND parent = $parent");
        $folders = array();

        while ($folder = mysql_fetch_array($sel))
        {
            $folder["subfolders"] = $this->getSubFolders($folder["ID"]);
            array_push($folders, $folder);
        }

        if (!empty($folders))
        {
            return $folders;
        }
        else
        {
            return false;
        }
    }
    /**
     * Get all the directories in a project
     *
     * @param string $id project Project ID
     * @return array $files Found files and directories
     */
    function getAllProjectFolders($project)
    {
        $project = (int) $project;

        $sel = mysql_query("SELECT * FROM projectfolders WHERE project = $project");
        $folders = array();

        while ($folder = mysql_fetch_array($sel))
        {
            $folder["subfolders"] = $this->getSubFolders($folder["ID"]);
            array_push($folders, $folder);
        }

        if (!empty($folders))
        {
            return $folders;
        }
        else
        {
            return false;
        }
    }

    /**
     * Delete a folder
     * Deletes the given folder with all files in it.
     *
     * @param int $id folder id
     * @param int $id project id
     * @return array $files Found files and directories
     */
    function deleteFolder($id, $project)
    {
        $id = (int) $id;
        $folder = $this->getFolder($id);
        $files = $this->getProjectFiles($project, 10000, $id);
        // delete all the files in the folder from the database (and filesystem as well)
        foreach($files as $file)
        {
            $this->loeschen($file["ID"]);
        }
        if (!empty($folders["subfolders"]))
        {
            foreach($folder["subfolders"] as $sub)
            {
                $this->deleteFolder($sub["ID"], $sub["project"]);
            }
        }
        $del = mysql_query("DELETE FROM projectfolders WHERE ID = $id");
        // remove directory
        $foldstr = CL_ROOT . "/files/" . CL_CONFIG . "/$project/" . $folder["name"] . "/";
        echo $foldstr . "<br>";
        delete_directory($foldstr);

        return true;
    }

    /**
     * Upload a file
     * Does filename sanitizing as well as MIME-type determination
     * Also adds the file to the database using add_file()
     *
     * @param string $fname Name of the HTML form field POSTed from
     * @param string $ziel Destination directory
     * @param int $project Project ID of the associated project
     * @return bool
     */
    function upload($fname, $ziel, $project, $folder = 0)
    {
        $name = $_FILES[$fname]['name'];
        $typ = $_FILES[$fname]['type'];
        $size = $_FILES[$fname]['size'];
        $tmp_name = $_FILES[$fname]['tmp_name'];
        $tstr = $fname . "-title";
        $tastr = $fname . "-tags";
        $visible = $_POST["visible"];

        $visstr = "";

        $title = $_POST[$tstr];
        $tags = $_POST[$tastr];
        $error = $_FILES[$fname]['error'];
        $root = CL_ROOT;

        if (empty($name))
        {
            return false;
        }

        $desc = $_POST['desc'];

        $tagobj = new tags();
        $tags = $tagobj->formatInputTags($tags);
        // find the extension
        $teilnamen = explode(".", $name);
        $teile = count($teilnamen);
        $workteile = $teile - 1;
        $erweiterung = $teilnamen[$workteile];
        $subname = "";
        // if its a php file, treat it as plaintext so its not executed when opened in the browser.
        if (stristr($typ, "php"))
        {
            $erweiterung = "txt";
            $typ = "text/plain";
        }

        for ($i = 0; $i < $workteile; $i++)
        {
            $subname .= $teilnamen[$i];
        }

        $randval = mt_rand(1, 9999999);
        // only allow a-z , 0-9 in filenames, substitute other chars with _
        $subname = str_replace("ä", "ae" , $subname);
        $subname = str_replace("ö", "oe" , $subname);
        $subname = str_replace("ü", "ue" , $subname);
        $subname = str_replace("ß", "ss" , $subname);
        $subname = preg_replace("/[^-_0-9a-zA-Z]/", "_", $subname);
        // remove whitespace
        $subname = preg_replace("/\W/", "", $subname);
        // if filename is longer than 200 chars, cut it.
        if (strlen($subname) > 200)
        {
            $subname = substr($subname, 0, 200);
        }

        $name = $subname . "_" . $randval . "." . $erweiterung;
        $datei_final = $root . "/" . $ziel . "/" . $name;
        $datei_final2 = $ziel . "/" . $name;

        if (!file_exists($datei_final))
        {
            if (move_uploaded_file($tmp_name, $datei_final))
            {
                $filesize = filesize($datei_final);
                if ($project > 0)
                {
                    /**
                     * file did not already exist, was uploaded, and a project is set
                     * add the file to the database, add the upload event to the log and return the file ID.
                     */
                    chmod($datei_final, 0755);
                    $fid = $this->add_file($name, $desc, $project, 0, "$tags", $datei_final2, "$typ", $title, $folder, $visstr);
                    $this->mylog->add($title, 'datei', 1, $project);
                    return $fid;
                }
                else
                {
                    // no project means the file is not added to the database wilfully. return file name.
                    return $name;
                }
            }
            else
            {
                // file was not uploaded / error occured. return false
                return false;
            }
        }
        else
        {
            // file already exists. return false
            return false;
        }
    }

    /**
     * Edit a file
     *
     * @param int $id File ID
     * @param string $title Title of the file
     * @param string $desc Description text
     * @param string $tags Associated tags (not yet implemented)
     * @return bool
     */
    function edit($id, $title, $desc, $tags)
    {
        $id = (int) $id;
        $title = mysql_real_escape_string($title);
        $desc = mysql_real_escape_string($desc);
        $tags = mysql_real_escape_string($tags);
        // get project for logging
        $sel = mysql_query("SELECT project FROM files WHERE ID = $id");
        $proj = mysql_fetch_row($sel);
        $project = $proj[0];

        $sql = mysql_query("UPDATE files SET `title` = '$title', `desc` = '$desc', `tags` = '$tags' WHERE id = $id");
        if ($sql)
        {
            $this->mylog->add($title, 'datei' , 2, $project);
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
     * List all files associated to a given project
     *
     * @param string $id Project ID
     * @param int $lim Limit
     * @param int $folder Folder
     * @return array $files Found files
     */
    function getProjectFiles($id, $lim = 25, $folder = "")
    {
        $id = (int) $id;
        $lim = (int) $lim;
        $folder = (int) $folder;

        if ($folder > 0)
        {
            $fold = "files/" . CL_CONFIG . "/$id/$folder/";
            $sel = mysql_query("SELECT COUNT(*) FROM files WHERE project = $id AND folder = $folder ORDER BY ID DESC");
        }
        else
        {
            $sel = mysql_query("SELECT COUNT(*) FROM files WHERE project = $id AND folder = 0 ORDER BY ID DESC");
        }
        $num = mysql_fetch_row($sel);
        $num = $num[0];
        SmartyPaginate::connect();
        // set items per page
        SmartyPaginate::setLimit($lim);
        SmartyPaginate::setTotal($num);

        $start = SmartyPaginate::getCurrentIndex();
        $lim = SmartyPaginate::getLimit();

        $files = array();

        if ($folder > 0)
        {
            $sql = "SELECT * FROM files WHERE project = $id AND folder = $folder ORDER BY  ID DESC LIMIT $start,$lim";
            $sel2 = mysql_query($sql);
        }
        else
        {
            $sel2 = mysql_query("SELECT * FROM files WHERE project = $id AND folder = 0 ORDER BY  ID DESC LIMIT $start,$lim");
        }
        $tagobj = new tags();
        while ($file = mysql_fetch_array($sel2))
        {
            if (!empty($file))
            {
                $file['type'] = str_replace("/", "-", $file['type']);
                $set = new settings();
                $settings = $set->getSettings();
                $myfile = "./templates/" . $settings['template'] . "/images/files/" . $file['type'] . ".png";

                if (stristr($file['type'], "image"))
                {
                    $file['imgfile'] = 1;
                } elseif (stristr($file['type'], "text"))
                {
                    $file['imgfile'] = 2;
                }
                else
                {
                    $file['imgfile'] = 0;
                }

                if (!file_exists($myfile))
                {
                    $file['type'] = "none";
                }
                $thetags = $tagobj->splitTagStr($file["tags"]);;
                $file["tagsarr"] = $thetags;
                $file["tagnum"] = count($file["tagsarr"]);
                $file["title"] = stripslashes($file["title"]);
                $file["desc"] = stripslashes($file["desc"]);
                $file["tags"] = stripslashes($file["tags"]);
                array_push($files, $file);
            }
        }

        if (!empty($files))
        {
            return $files;
        }
        else
        {
            return false;
        }
    }

    /**
     * List all files associated to a given project
     *
     * @param string $id Project ID
     * @param int $lim Limit
     * @param int $folder Folder
     * @return array $files Found files
     */
    function getAllProjectFiles($id)
    {
        $id = (int) $id;
        $lim = (int) $lim;
        $folder = (int) $folder;

        $files = array();

        $sel2 = mysql_query("SELECT * FROM files WHERE project = $id  ORDER BY  ID DESC");

        $tagobj = new tags();
        while ($file = mysql_fetch_array($sel2))
        {
            if (!empty($file))
            {
                $file['type'] = str_replace("/", "-", $file['type']);
                $set = new settings();
                $settings = $set->getSettings();
                $myfile = "./templates/" . $settings['template'] . "/images/files/" . $file['type'] . ".png";

                if (stristr($file['type'], "image"))
                {
                    $file['imgfile'] = 1;
                } elseif (stristr($file['type'], "text"))
                {
                    $file['imgfile'] = 2;
                }
                else
                {
                    $file['imgfile'] = 0;
                }

                if (!file_exists($myfile))
                {
                    $file['type'] = "none";
                }
                $thetags = $tagobj->splitTagStr($file["tags"]);;
                $file["tagsarr"] = $thetags;
                $file["tagnum"] = count($file["tagsarr"]);
                $file["title"] = stripslashes($file["title"]);
                $file["desc"] = stripslashes($file["desc"]);
                $file["tags"] = stripslashes($file["tags"]);
                array_push($files, $file);
            }
        }

        if (!empty($files))
        {
            return $files;
        }
        else
        {
            return false;
        }
    }
    /**
     * Return a file
     *
     * @param string $id File ID
     * @return array $file File details
     */
    function getFile($id)
    {
        $id = (int) $id;

        $sel = mysql_query("SELECT * FROM files WHERE ID=$id");

        $file = mysql_fetch_array($sel);
        if (!empty($file))
        {
            $file['type'] = str_replace("/", "-", $file["type"]);
            $set = new settings();
            $settings = $set->getSettings();
            $myfile = "./templates/" . $settings["template"] . "/images/files/" . $file['type'] . ".png";
            if (!file_exists($myfile))
            {
                $file['type'] = "none";
            }

            $file["title"] = stripslashes($file["title"]);
            $file["desc"] = stripslashes($file["desc"]);
            $file["tags"] = stripslashes($file["tags"]);

            return $file;
        }
        else
        {
            return false;
        }
    }
    /**
     * Seed the random number generator
     *
     * @return float $value Initial value
     */
    private function make_seed()
    {
        list($usec, $sec) = explode(' ', microtime());
        $value = (float) $sec + ((float) $usec * 100000);
        return $value;
    }

    /**
     * Add a file to the database
     *
     * @param string $name Filename
     * @param string $desc Description
     * @param int $project ID of the associated project
     * @param int $milestone ID of the associated milestone
     * @param string $tags Tags for the file (not yet implemented)
     * @param string $datei File path
     * @param string $type MIME Type
     * @param string $title Title of the file
     * @param int $ folder Optional parameter. It holds the ID of the subfolder the file is uploaded to (0 = root directory)
     * @return bool $insid
     */
    private function add_file($name, $desc, $project, $milestone, $tags, $datei, $type, $title, $folder = 0, $visstr = "")
    {
        $name = mysql_real_escape_string($name);
        $desc = mysql_real_escape_string($desc);
        $tags = mysql_real_escape_string($tags);
        $datei = mysql_real_escape_string($datei);
        $project = (int) $project;
        $milestone = (int) $milestone;
        $folder = (int) $folder;
        $type = mysql_real_escape_string($type);
        $title = mysql_real_escape_string($title);
        $now = time();
        $ins = mysql_query("INSERT INTO files (`name`,`desc`,`project`,`milestone`,`tags`,`added`,`datei`,`type`,`title`,`folder`,`visible`) VALUES ('$name','$desc',$project,$milestone,'$tags','$now','$datei','$type','$title','$folder','$visstr')");

        if ($ins)
        {
            $insid = mysql_insert_id();
            return $insid;
        }
        else
        {
            return false;
        }
    }
}

?>