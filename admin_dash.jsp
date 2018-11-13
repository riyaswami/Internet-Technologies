<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="sangam" content="">
    <link rel="icon" href="icon.ico">

    <title>Dashboard</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/monthly.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="style/dashboard.css" rel="stylesheet">
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/plugins/dataTables/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/plugins/dataTables/dataTables.responsive.css">
    <link rel="stylesheet" type="text/css" href="css/plugins/dataTables/dataTables.tableTools.min.css">
    <link rel="stylesheet" type="text/css" href="css/plugins/dataTables/jquery.dataTables.yadcf.css">

  <style type="text/css">
       button{ border-radius: 5px;
        background-color: white;
        color:#676a6c;
    }
      button:hover{
      background-color:silver;
      }
      h3,h2,h4{
        font-weight: bold;
      }
      div .col-lg-6{
         margin-top: 20px;
         
      }

      .col-sm-6{

        width:45%;
      }
   </style>
<script type="text/javascript">
  $(document).ready(function(){
   /*
    $('#demo-1').monthly({
      mode: 'event',
      xmlUrl: 'news_monthly.php'
    });
  */
  });
</script>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        <a class="navbar-brand" href="#">AR Surveys</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="admin_dash.jsp">Dashboard</a></li>
            <li><a href="add_user.jsp">Add User</a></li>
            <li><a href="add_survey.jsp">Add Survey</a></li>
            <li><a href="view_survey.jsp">View Survey</a></li>
            <li><a href="users.jsp">Users</a></li>
            <li><a href="mypriorities.php">My Priority</a></li>
            <li><a target="_blank" style="color:red" href="help.php">User Instruction Guide</a></li>
            <li><a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
          </ul>
        </div>
      </div>

    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">  
           <li class="nav-header">
                  <a href="#">
                   <i class="glyphicon glyphicon-user"></i> <strong class="font-bold"><?php echo $_SESSION['USER']; ?></strong>
                 </a>
            </li>
            <li class="active"><a href="admin_dash.jsp">Dashboard</a></li>
            <li><a href="persons.php">Persons</a></li>
            <li><a href="organizations.php">Organizations</a></li>
            <li><a href="locations.php">Locations</a></li>
            <li><a href="news.php">News</a></li>
            <li><a href="delegates.php"> Party Delegates</a></li>
            <li><a href="topics.php">Tagged Topic</a></li>
            <li><a href="products.php">Product</a></li>
            <li><a href="mypriorities.php">My Priority</a></li>
            <li><a href="help.php">Help</a></li>
             <?php if ($_SESSION['role']=='admin') { ?>
            <li><a href="insert.php">Upload File</a></li>
            <li><a href="signup.php">Add User</a></li>  
            <li><a href="revert_file.php">Imports</a></li> 
            <li><a href="insertOther.php">Insert News</a></li>                
         <?php  } ?>
          </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h2 class="page-header">Dashboard</h2>
<!---body-->
            <?php    require_once('config/pdo.php');
                      require_once('config/dashboard_details_class.php'); ?>
                      <div class="row">
                        <div class="col-lg-12"> 
                                  <div style=" margin-bottom:10px;text-align:center;">
                                    <button type="button" class="btn btn-primary"><a style="color:white"  target="_blank" href="special_topic.php">Special Topic-19th Party Congress</a></button>&nbsp;<button type="button" class="btn btn-primary"><a style="color:white" target="_blank" href="special_topicdm.php">Special Topic-Border Issues</a></button>&nbsp;<button type="button" class="btn btn-primary"><a style="color:white" target="_blank" href="delegates.php">Party Delegates</a></button>&nbsp;<button type="button" class="btn btn-primary"><a style="color:white" target="_blank" href="locations_details.php?EntityId=2114">Tibet</a></button>&nbsp;<button type="button" class="btn btn-primary"><a style="color:white" target="_blank" href="locations_details.php?EntityId=2117">Xinjiang</a></button>&nbsp;<button type="button" class="btn btn-primary"><a style="color:white"  target="_blank" href="obor_dashboard.php">OBOR</a></button>&nbsp;<button type="button" class="btn btn-primary"><a style="color:white"  target="_blank" href="defenceTech_dashboard.php">Defence Technology</a></button>&nbsp;<button type="button" class="btn btn-primary"><a style="color:white"  target="_blank" href="india_dash.php">India</a></button>
                                  </div>
                        </div>

                                  <div class="col-lg-6">
                                        <table class="table table-striped">
                                            <thead>
                                              <tr bgcolor="#ed5565">
                                                <th colspan="3">Rising Political Leaders </th>
                                              </tr>
                                            <tr>
                                                <th>Person</th>
                                                <th>Category</th>
                                                <th>Actions</th>   
                                            </tr>
                                            </thead>
                                            <tbody>
                                                 <?php 
                                                  $result =dashDetails::RisinsLeadersNew();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        </div>
                               


                                     <div class="col-lg-6">
                                        <table class="table table-striped">
                                            <thead>
                                              <tr bgcolor="#ed5565">
                                                <th colspan="3">Future Possible Tibet leading Group Members</th>
                                              </tr>
                                            <tr>
                                                <th>Person</th>
                                                <th>Category</th>
                                                <th>Actions</th>   
                                            </tr>
                                            </thead>
                                            <tbody>
                                                 <?php 
                                                  $result =dashDetails::FutureTibetLeaders();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        </div>
                          

                                     <div class="col-lg-12">
                                        <table class="table table-striped">
                                            <thead>
                                              <tr bgcolor="#ed5565">
                                                <th colspan="3">Leaders served in Tibet</th>
                                              </tr>
                                            <tr>
                                                <th>Person</th>
                                                <th>Category</th>
                                                <th>Actions</th>   
                                            </tr>
                                            </thead>
                                            <tbody>
                                                 <?php 
                                                  $result =dashDetails::LeadersServedTibet();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        </div>
                               




                                    <hr>


                                   <div class="col-lg-12">
                                        <table class="table table-striped" id="rpl">
                                            <thead>
                                              <tr bgcolor="#ed5565">
                                                <th colspan="3">Rising Political Leaders</th>
                                              </tr>
                                            <tr>
                                                <th>Person</th>
                                                <th>Category</th>
                                                <th>Actions</th>   
                                            </tr>
                                            </thead>
                                            <tbody>
                                                 <?php 
                                                  $result =dashDetails::RPLeader();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        </div>
                                    </div><hr>

                        <div class="row">
                        <div class="col-lg-12"> 
                               
                                   <div class="col-lg-12">
                                        <table class="table table-striped" id="rpl">
                                            <thead>
                                              <tr bgcolor="#ed5565">
                                                <th colspan="3">Other Imp Leaders</th>
                                              </tr>
                                            <tr>
                                                <th>Person</th>
                                                <th>Category</th>
                                                <th>Actions</th>   
                                            </tr>
                                            </thead>
                                            <tbody>
                                                 <?php 
                                                  $result =dashDetails::OLLeader();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        </div>
                                    </div><hr>
                      <div class="row">    
                      <div class="col-lg-12"> 
                      <h3 class="page-header">Non Military Delegates</h3>
                 <!---body-->
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Actions</th>   
                            </tr>
                            </thead>
                            <tbody>
                      <?php
                           require_once('config/pdo.php');
                           require_once('config/delegates_details_class.php');
                            $result =delegatesDetails::delegatesAll();
                              foreach ($result as $coloumn) { ?>
                              <tr>
                                <td><?php echo $coloumn['PersonName'];?></td>
                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                <td style="white-space:nowrap;"><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a><?php 
                                  $stmt=$DB->prepare('select EntityId from user_priority where EntityId =? and uid=?');

                                  $stmt->execute(array($coloumn['EntityId'],$_SESSION['uid']));

                                  $rows=$stmt->fetch();
                                    
                                  if ($rows['EntityId']==$coloumn['EntityId']) { ?>
                                   
                                   <button style="background-color:green; color:white">Prioritize</button>

                                 <?php  } 
                                   else{ ?>
                                    <button onclick="prioritize(this.id)" id="<?php echo $coloumn['EntityId'];?>">Prioritize</button>
                                  <?php } ?>
                                  
                              </td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                      </div>  
                     </div>
             <!--End-->
 
           <div class="row">
           <div class="col-lg-12">
          <h3 class="page-header">Military Delegates</h3>
           <!---body-->
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Actions</th>   
                            </tr>
                            </thead>
                            <tbody>
                      <?php
                           require_once('config/pdo.php');
                           require_once('config/delegates_details_class.php');
                            $resultM =delegatesDetails::delegatesMilitary();
                              foreach ($resultM as $coloumnM) { ?>
                              <tr>
                                <td><?php echo $coloumnM['PersonName'];?></td>
                                <td><?php echo $coloumnM['PersonDesc'];?></td>
                                <td style="white-space:nowrap;"><a href="persons_details.php?EntityId=<?php echo $coloumnM['EntityId'];?>"><button>Show</button></a><?php 
                                  $stmt=$DB->prepare('select EntityId from user_priority where EntityId =? and uid=?');

                                  $stmt->execute(array($coloumnM['EntityId'],$_SESSION['uid']));

                                  $rows=$stmt->fetch();
                                    
                                  if ($rows['EntityId']==$coloumnM['EntityId']) { ?>
                                   
                                   <button style="background-color:green; color:white">Prioritize</button>

                                 <?php  } 
                                   else{ ?>
                                    <button onclick="prioritize(this.id)" id="<?php echo $coloumnM['EntityId'];?>">Prioritize</button>
                                  <?php } ?>
                                  
                              </td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                      </div>  
                          </div>
             <!--End-->
    
           <div class="row">
           <div class="col-lg-12">
            <h3 class="page-header">Financial Delegates</h3>
             <!---body-->     
                        <table id="example" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Actions</th>   
                            </tr>
                            </thead>
                            <tbody>
                      <?php
                           require_once('config/pdo.php');
                           require_once('config/delegates_details_class.php');
                            $resultF =delegatesDetails::delegatesFanancial();
                              foreach ($resultF as $coloumnF) { ?>
                              <tr>
                                <td><?php echo $coloumnF['PersonName'];?></td>
                                <td><?php echo $coloumnF['PersonDesc'];?></td>
                                <td style="white-space:nowrap;"><a href="persons_details.php?EntityId=<?php echo $coloumnF['EntityId'];?>"><button>Show</button></a><?php 
                                  $stmt=$DB->prepare('select EntityId from user_priority where EntityId =? and uid=?');

                                  $stmt->execute(array($coloumnF['EntityId'],$_SESSION['uid']));

                                  $rows=$stmt->fetch();
                                    
                                  if ($rows['EntityId']==$coloumnF['EntityId']) { ?>
                                   
                                   <button style="background-color:green; color:white">Prioritize</button>

                                 <?php  } 
                                   else{ ?>
                                    <button onclick="prioritize(this.id)" id="<?php echo $coloumnF['EntityId'];?>">Prioritize</button>
                                  <?php } ?>
                                  
                              </td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                      </div>  
                        </div>
             <!--End-->
      
                      <div class="row">
                     <div class="col-lg-12">

                                        <table class="table table-striped" id="News">
                                            <thead>
                                               <tr bgcolor="#f7a54a">
                                               <th colspan="5">Latest News</th>
                                              </tr>
                                              <tr>
                                                <th>Source</th>
                                                <th>Title</th>
                                                <th>Sector</th>
                                                <th>NewsDate</th>
                                                <th>Actions</th>
                                            </tr>   
                                            </thead>
                                            <tbody>
                                                <?php
                                        
                                            $result = DashDetails::latestnews();
                                              foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['NewsSource'];?></td>
                                                <td><?php echo $coloumn['NewsTitle'];?></td>
                                                <td><?php echo $coloumn['Sector_Name'];?></td>
                                                <td><?php echo $coloumn['NewsDateTime'];?></td>
                                                <td><a href="news_details.php?NewsId=<?php echo $coloumn['NewsId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                   </div>
                                </div>
                                <hr>
                                  <div class="row">
                                   <div class="col-lg-12">
                                        <table class="table table-striped" id="example">
                                            <thead>
                                              <tr bgcolor="#ed5565">
                                                <th colspan="3">PBSC Members</th>
                                              </tr>
                                            <tr>
                                                <th>Person</th>
                                                <th>Category</th>
                                                <th>Actions</th>   
                                            </tr>
                                            </thead>
                                            <tbody>
                                                 <?php 
                                                  $result =dashDetails::PBSCMember();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        </div>
                                    </div>
                                    <hr>
                                    
                            <div class="row">
                              
                              <div class="col-lg-6">
                      
                                  <table class="table table-striped">
                                      <thead>
                                         <tr bgcolor="#ed5565">
                                         <th colspan="3">Priority Person</th>
                                        </tr>
                                      <tr>
                                          <th>Person</th>
                                          <th>Category</th>
                                          <th>Actions</th>   
                                      </tr>
                                      </thead>
                                      <tbody>
                                           <?php
                                             
                                               $result =dashDetails::PriorityPerson(array($_SESSION['uid']));
                                               foreach ($result as $coloumn) { ?>
                                       <tr>
                                          <td><?php echo $coloumn['PersonName'];?></td>
                                          <td><?php echo substr($coloumn['PersonDesc'],0,4)."...";?></td>
                                          <td style="white-space:nowrap;"><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a><button onclick="Unprioritize(this.id)" id="<?php echo $coloumn['EntityId'];?>">UnPrioritize</button></td>
                                      </tr>
                                      <?php } ?>
                                      </tbody>
                                  </table>
                                  </div>
                                   <div class="col-lg-6">
                                        
                                          <table class="table table-striped">
                                              <thead>
                                                 <tr  bgcolor="#1ab394">
                                                    <th colspan="3">Priority Organization</th>
                                                 </tr>
                                                  <tr>
                                                  <th>Location</th>
                                                  <th>Desc</th>
                                                  <th>Actions</th>   
                                              </tr>
                                              </thead>
                                              <tbody>
                                                   <?php
                                              
                                                $result = dashDetails::PriorityOrganization(array($_SESSION['uid']));
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                                <td><?php echo substr($coloumn['OrganizationDesc'],0,4)."...";?></td>
                                                <td style="white-space:nowrap;"><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a><button onclick="Unprioritize(this.id)" id="<?php echo $coloumn['EntityId'];?>">UnPrioritize</button></td>
                                            </tr>
                                        <?php } ?>
                                        </tbody>
                                  </table>    
                            </div>
                        </div>
                        <hr>
                            <div class="row">
                                   <div class="col-lg-6">
                                      <table class="table table-striped" id="Location">
                                          <thead>
                                             <tr bgcolor="lightskyblue">
                                                 <th colspan="3">Priority Location</th>
                                             </tr>
                                              <tr>
                                                  <th>Location</th>
                                                  <th>Desc</th>
                                                  <th>Actions</th>   
                                              </tr>
                                              </thead>
                                              <tbody>
                                                   <?php
                                           
                                                $result = dashDetails::PriorityLocation(array($_SESSION['uid']));
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['LocationName'];?></td>
                                                <td><?php echo substr($coloumn['LocationDesc'],0,4)."...";;?></td>
                                                <td style="white-space:nowrap;"><a href="locations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a>  <button onclick="Unprioritize(this.id)" id="<?php echo $coloumn['EntityId'];?>">UnPrioritize</button></td>
                                            </tr>
                                            <?php } ?>
                                        </tbody>
                                       </table>
                                  </div>                 
                                        <div class="col-lg-6">
                                          <table class="table table-striped">
                                              <thead>
                                                  <tr bgcolor="teal">
                                                     <th colspan="3">Priority Date</th>
                                                  </tr>
                                                  <tr>
                                                  <th>Date</th>
                                                  <th>Actions</th>   
                                              </tr>
                                              </thead>
                                              <tbody>
                                                   <?php
                                               
                                                $result = dashDetails::PriorityDates(array($_SESSION['uid']));
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['date'];?></td>
                                                
                                                <td style="white-space:nowrap;"><a href="#pdn"><button>Show</button></a><button onclick="UnprioritizeDate(this.id)" id="<?php echo $coloumn['date'];?>">UnPrioritize</button></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        <hr>
                                  <div class="col-lg-8">
                                <div class='input-group date' id='mydatepicker'>
                               <input id="mydate" type='text' class="form-control" />
                                   <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                                   </span>
                                      </div>
                                        </div>
                                        <div class="col-lg-4">
                                          <button id="prioritizeDate" class="btn btn-primary">Add</button>
                                        </div>
                                        </div> 
                                  </div> <hr>
                          <div class="row">    
                            <div class="col-lg-6">
                                <table class="table table-striped " id="LatestTagPersons">
                                    <thead>
                                      <tr bgcolor="#ed5565">
                                       <th colspan="3">Latest Tagged Persons</th>
                                      </tr>
                                    <tr>
                                        <th>Person Name</th>
                                        <th>Persons Category</th>
                                        <th>Actions</th>   
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                     
                                    $TagedPersons = DashDetails::LatestTagedPerson();
                                      foreach ($TagedPersons as $TagedPerson) { ?>
                                    <tr>
                                        <td><?php echo $TagedPerson['PersonName'];?></td>
                                        <td><?php echo $TagedPerson['PersonDesc'];?></td>
                                        <td><a href="persons_details.php?EntityId=<?php echo $TagedPerson['EntityId'];?>"><button>Show</button></a></td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                              </div>
                            <div class="col-lg-6"> 
                              <table class="table table-striped" id="LatestTagOrg">
                                  <thead>
                                    <tr  bgcolor="#1ab394">
                                     <th colspan="5">Latest Tagged Organizations</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                    <?php
                                 
                                  $LatestTagOrgs = DashDetails::LatestTagOrg();
                                    foreach($LatestTagOrgs as $LatestTagOrg) { ?>
                                  <tr>
                                      <td><?php echo $LatestTagOrg['OrganizationName'];?></td>
                                      <td><?php echo $LatestTagOrg['OrganizationDesc'];?></td>
                                      <td><a href="organizations_details.php?EntityId=<?php echo $LatestTagOrg['EntityId'];?>"><button>Show</button></a></td>
                                  </tr>
                                  <?php } ?>
                                  </tbody>
                              </table>
                         </div>
                       </div><hr>
                         <div class="row">
                         <div class="col-lg-6">
                            <table class="table table-striped" id="LatestTagLocation">
                                <thead>
                                  <tr bgcolor="#f7a54a">
                                    <th colspan="5">Latest Tagged Locations</th>
                                  </tr>
                                  <tr>
                                    <th>Location Name</th>
                                    <th>Location Desc</th>                              
                                    <th>Actions</th>   
                                </tr>
                                </thead>
                                <tbody>
                              <?php
                                $LatestTagedLocations = DashDetails::LatestTagedLocation();
                                  foreach ($LatestTagedLocations as $LatestTagedLocation) { ?>
                                <tr>
                                    <td><?php echo $LatestTagedLocation['LocationName'];?></td>
                                    <td><?php echo $LatestTagedLocation['LocationDesc'];?></td>
                                    <td><a href="locations_details.php?EntityId=<?php echo $LatestTagedLocation['EntityId'];?>"><button>Show</button></a></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    <div class="col-lg-6">
                        <table class="table table-striped " id="example">
                            <thead>
                              <tr bgcolor="#ed5565">
                               <th colspan="3">Military Officers</th>
                              </tr>
                            <tr>
                                <th>Person Name</th>
                                <th>Persons Category</th>
                                <th>Actions</th>   
                            </tr>
                            </thead>
                            <tbody>
                                <?php
                             
                            $Militarys = DashDetails::PersonMilitary();
                              foreach ($Militarys as $Military) { ?>
                            <tr>
                                <td><?php echo $Military['PersonName'];?></td>
                                <td><?php echo $Military['PersonDesc'];?></td>
                                <td><a href="persons_details.php?EntityId=<?php echo $Military['EntityId'];?>&&PersonName=<?php echo $coloumn['PersonName'];?>&&PersonDesc=<?php echo $coloumn['PersonDesc'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                         </div>
                         </div><hr>
                         <div class="row">
                         <div class="col-lg-6"> 
                                  <table class="table table-striped">
                                      <thead>
                                        <tr  bgcolor="#ed5565">
                                         <th colspan="5">CPPCC Persons</th>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <th>Desc</th>
                                            <th>Actions</th>
                                        </tr>   
                                      </thead>
                                      <tbody>
                                        <?php 
                                                  $result =dashDetails::CPPCCPerson();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                               </div>
                                  
                               
                                        <div class="col-lg-6"> 
                                        <table class="table table-striped">
                                       <thead>
                                          <tr  bgcolor="#ed5565">
                                           <th colspan="5">18th CPC Members</th>
                                          </tr>
                                          <tr>
                                              <th>Name</th>
                                              <th>Desc</th>
                                              <th>Actions</th>
                                          </tr>   
                                        </thead>
                                        <tbody>
                                           <?php 
                                                  $result =dashDetails::CPC();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                  </div>
                                  </div><hr>
                                   <div class="row">   
                                   <div class="col-lg-6"> 
                                  <table class="table table-striped">
                                      <thead>
                                        <tr  bgcolor="#ed5565">
                                         <th colspan="5">S&t Persons</th>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <th>Desc</th>
                                            <th>Actions</th>
                                        </tr>   
                                      </thead>
                                      <tbody>
                                        <?php 
                                                  $result =dashDetails::SntPersons();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                  </tbody>
                                 </table>
                              </div>

                                <div class="col-lg-6">
                                        <table class="table table-striped" id="example">
                                            <thead>
                                              <tr bgcolor="#ed5565">
                                                <th colspan="3">CMC Members</th>
                                              </tr>
                                            <tr>
                                                <th>Person</th>
                                                <th>Category</th>
                                                <th>Actions</th>   
                                            </tr>
                                            </thead>
                                            <tbody>
                                                 <?php 
                                                  $result =dashDetails::CMCMember();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        </div>
                                  </div><hr>
                                 <div class="row">
                                 <div class="col-lg-6"> 
                                  <table class="table table-striped">
                                      <thead>
                                        <tr  bgcolor="#ed5565">
                                         <th colspan="5">NPC Persons</th>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <th>Desc</th>
                                            <th>Actions</th>
                                        </tr>   
                                      </thead>
                                      <tbody>
                                        <?php 
                                                  $result =dashDetails::NPCPersons();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                      </tbody>
                                  </table>
                             </div>

                           
                                 <div class="col-lg-6">
                                        <table class="table table-striped">
                                            <thead>
                                              <tr  bgcolor="#ed5565">
                                                <th colspan="3">Politoburo Organizations</th>
                                              </tr>
                                            <tr>
                                                <th>Person</th>
                                                <th>Category</th>
                                                <th>Actions</th>   
                                            </tr>
                                            </thead>
                                            <tbody>
                                                 <?php          
                                                  $result =dashDetails::PolitoburoMember();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                        </div>
                                      </div><hr>
                              <div class="row">
                              <div class="col-lg-6"> 
                                  <table class="table table-striped">
                                      <thead>
                                        <tr  bgcolor="#ed5565">
                                         <th colspan="5">Nuclear Persons</th>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <th>Desc</th>
                                            <th>Actions</th>
                                        </tr>   
                                      </thead>
                                      <tbody>
                                        <?php 
                                                  $result =dashDetails::NuclearPersons();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                  </tbody>
                              </table>
                         </div>
                                          
                            <div class="col-lg-6"> 
                                <table class="table table-striped">
                                    <thead>
                                      <tr  bgcolor="#ed5565">
                                       <th colspan="5">State Council Persons</th>
                                      </tr>
                                      <tr>
                                          <th>Name</th>
                                          <th>Desc</th>
                                          <th>Actions</th>
                                      </tr>   
                                    </thead>
                                    <tbody>
                                     <?php 
                                                  $result =dashDetails::StateCouncil();
                                                  foreach ($result as $coloumn) { ?>
                                            <tr>
                                                <td><?php echo $coloumn['PersonName'];?></td>
                                                <td><?php echo $coloumn['PersonDesc'];?></td>
                                                <td><a href="persons_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                </tbody>
                                </table>
                             </div>
                              </div><hr>

                        <div class="row">
                        <div class="col-lg-6"> 
                        <table class="table table-striped">
                            <thead>
                              <tr  bgcolor="#1ab394">
                               <th colspan="5">Nuclear Organizations</th>
                              </tr>
                              <tr>
                                  <th>Name</th>
                                  <th>Desc</th>
                                  <th>Actions</th>
                              </tr>   
                            </thead>
                            <tbody>
                              <?php
                           
                            $result = DashDetails::NuclearOrg();
                              foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>Nuclear Research Instt</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                   </div>
                           
                        <div class="col-lg-6">
                            <table class="table table-striped">
                            <thead>
                               <tr>
                              <tr  bgcolor="#1ab394">
                               <th colspan="3">Military Organizations</th>
                            </tr>
                                <th>Organization Name</th>
                                <th>Organization Desc</th>
                                <th>Action</th>    
                            </tr>
                            </thead>
                            <tbody>
                                <?php
                           
                            $result = DashDetails::MilitaryOrg();
                              foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td><?php echo $coloumn['OrganizationDesc'];?></td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>          
                    </div><hr>

                        <div class="row">
                         <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr bgcolor="#1ab394">
                                     <th colspan="5">R&D Organizations and University</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                  <?php
                                 $result = DashDetails::RndOrg();
                              foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>R&D Organizations</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div>
                           <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr bgcolor="#1ab394">
                                     <th colspan="5">Provincial CPC Organizations</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                  <?php
                              $result = DashDetails::ProvincialCPCOrg();
                              foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>Provincial CPC Organizations</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div> 
                          </div><hr>

                        <div class="row">
                          <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr bgcolor="#1ab394">
                                     <th colspan="5">Provincial CPPCC Organizations</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                   <?php
                                 $result = DashDetails::ProvincialCPPCCOrg();
                                  foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>Provincial CPPCC Organizations</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div>
                           <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr  bgcolor="#1ab394">
                                     <th colspan="5">Provincial People's Congress</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                  <?php
                                 $result = DashDetails::ProvincialPCOrg();
                                  foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>Provincial People's Congress</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div>
                        </div><hr>

                        <div class="row">

                          <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr  bgcolor="#1ab394">
                                     <th colspan="5">CPC Central Committees</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                  <?php
                                 $result = DashDetails::CPCCentralOrg();
                                  foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>CPC Central Committees</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div>

                           <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr  bgcolor="#1ab394">
                                     <th colspan="5">CPC Organizations</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                  <?php
                                 $result = DashDetails::CPCOrg();
                                  foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>CPC Organizations</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div>
                          </div><hr>

                        <div class="row">
                            <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr bgcolor="#f7a54a">
                                     <th colspan="5">MIlitiry Theaters</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                  <?php
                                 $result = DashDetails::militrythOrg();
                                  foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>MIlitiry Theaters</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div>

                           <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr bgcolor="#f7a54a">
                                     <th colspan="5">Common Defence Services / Hqtrs</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                  <?php
                                 $result = DashDetails::DefenceSH();
                                  foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>Common Defence Services</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div>
                          </div><hr>

                        <div class="row">
                     <div class="col-lg-6">
                        <table class="table table-striped">
                            <thead>
                               <tr bgcolor="#f7a54a">
                               <th colspan="5">Important Locations</th>
                              </tr>
                              <tr>
                                <th>Location Name</th>
                                <th>Location Desc</th>
                                 <th>Location Latitude</th>
                                <th>Location Longitude</th>
                                <th>Actions</th>   
                            </tr>
                            </thead>
                            <tbody>
                                <?php
                        
                            $result = DashDetails::Implocation();
                              foreach ($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['LocationName'];?></td>
                                <td><?php echo $coloumn['LocationDesc'];?></td>
                                <td><?php echo $coloumn['LocationLatitude'];?></td>
                                <td><?php echo $coloumn['LocationLongitude'];?></td>
                                <td><a href="locations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                    
                           <div class="col-lg-6"> 
                              <table class="table table-striped">
                                   <thead>
                                    <tr bgcolor="#f7a54a">
                                     <th colspan="5">Defence Organizations Groups</th>
                                    </tr>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Actions</th>
                                    </tr>   
                                  </thead>
                                  <tbody>
                                  <?php
                                 $result = DashDetails::DefenceOG();
                                  foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>Common Defence Services</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                                  </tbody>
                              </table>
                          </div>
                          </div><hr>

                        <div class="row">
                   <div class="col-lg-6"> 
                        <table class="table table-striped">
                             <thead>
                              <tr bgcolor="#f7a54a">
                               <th colspan="5">Military Region</th>
                              </tr>
                                <tr>
                                  <th>Name</th>
                                  <th>Desc</th>
                                  <th>Actions</th>
                              </tr>   
                            </thead>
                            <tbody style="height:200px;overflow:auto;">
                            <?php
                                 $result = DashDetails::militryReg();
                                  foreach($result as $coloumn) { ?>
                            <tr>
                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                <td>Military Region</td>
                                <td><a href="organizations_details.php?EntityId=<?php echo $coloumn['EntityId'];?>"><button>Show</button></a></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                  </div><hr>

                        <div class="row">

                             <div class="col-lg-12" style="margin-top:30px">
                                     <h3>News Calender</h3>
                                    <div class="monthly" id="demo-1"></div>
                              </div>  
                              </div>
                              <hr>

                       
                                       <div class="col-lg-12" style="margin-top:30px">
                                          <h3>Priority Person News</h3> 
                                          <table class="table table-hover" id="PriorityPersonNews">
                                           <thead>
                                                <tr bgcolor="#1ab394">
                                                   <th>News</th>
                                                   <th>Person</th>
                                                   <th>Sector</th>
                                                   <th>DateTime</th>
                                                   <th>Actions</th>   
                                                </tr>
                                              </thead>
                                              <tbody>
                                              <?php                    
                                               $result =dashDetails::PriorityPersonNews(array($_SESSION['uid']));
                                                foreach ($result as $coloumn) { ?>
                                              <tr bgcolor="lavender">
                                                  <td><?php echo $coloumn['NewsTitle'];?></td>
                                                  <td><?php echo $coloumn['personname'];?></td>
                                                  <td><?php echo $coloumn['Sector_Name'];?></td>
                                                  <td><?php echo $coloumn['NewsDateTime'];?></td>
                                                  <td><a href="news_details.php?NewsId=<?php echo $coloumn['NewsId'];?>"><button>Show</button></a></td>
                                              </tr>
                                              <?php } ?>
                                              </tbody>
                                          </table>
                                        </div>

                                        <div class="col-lg-12" style="margin-top:30px">
                                         <h3>Priority Organization News</h3>
                                          <table class="table table-hover" id="PriorityOrganizationNews">
                                              <thead>
                                                  <tr bgcolor="teal">
                                                  <th>News</th>
                                                  <th>Organization</th>
                                                  <th>Sector</th>
                                                  <th>DateTime</th>
                                                  <th>Actions</th>   
                                              </tr>
                                              </thead>
                                              <tbody>
                                                <?php
                                                $result = dashDetails::PriorityOrganizationNews(array($_SESSION['uid']));
                                                  foreach ($result as $coloumn) { ?>
                                            <tr bgcolor="lavender">
                                                <td><?php echo $coloumn['NewsTitle'];?></td>
                                                <td><?php echo $coloumn['OrganizationName'];?></td>
                                                <td><?php echo $coloumn['Sector_Name'];?></td>
                                                <td><?php echo $coloumn['NewsDateTime'];?></td>
                                                <td><a href="news_details.php?NewsId=<?php echo $coloumn['NewsId'];?>"><button id="button"><i class="fa fa-refresh fa-spin"></i> Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                         </div>

                                          <div class="col-lg-12" style="margin-top:30px">
                                         <h3>Priority Location News</h3>
                                          <table class="table table-hover" id="PriorityLocationNews">
                                              <thead>
                                                  <tr bgcolor="lightskyblue">
                                                  <th>News</th>
                                                  <th>Location</th>
                                                  <th>Sector</th>
                                                  <th>DateTime</th>
                                                  <th>Actions</th>   
                                              </tr>
                                              </thead>
                                              <tbody>
                                                   <?php
                                              
                                                $result = dashDetails::PriorityLocationNews(array($_SESSION['uid']));
                                                  foreach ($result as $coloumn) { ?>
                                            <tr bgcolor="lavender">
                                                <td><?php echo $coloumn['NewsTitle'];?></td>
                                                <td><?php echo $coloumn['LocationName'];?></td>
                                                <td><?php echo $coloumn['Sector_Name'];?></td>
                                                <td><?php echo $coloumn['NewsDateTime'];?></td>
                                                <td><a href="news_details.php?NewsId=<?php echo $coloumn['NewsId'];?>"><button id="button"><i class="fa fa-refresh fa-spin"></i> Show</button></a></td>
                                            </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                  
                                        </div>

                                          <div class="col-lg-12" style="margin-top:30px" id="pdn">
                                              <h3>Priority Date News</h3>
                                               <table class="table table-hover" id="PriorityDateNews">
                                                <thead>
                                                    <tr  bgcolor="teal">
                                                        
                                                        <th>Source</th>
                                                        <th>Title</th>
                                                        <th>Sector</th>
                                                        <th>DateTime</th>
                                                        <th>Action</th>
                                                    </tr>   
                                                    </thead>
                                                   
                                                    <tbody>
                                                        <?php
                                             
                                                    $result = dashDetails::PriorityDateNews(array($_SESSION['uid']));
                                                      foreach ($result as $coloumn) { ?>
                                                    <tr bgcolor="lavender">
                                                       
                                                        <td><?php echo $coloumn['NewsSource'];?></td>
                                                        <td><?php echo $coloumn['NewsTitle'];?></td>
                                                        <td><?php echo $coloumn['Sector_Name'];?></td>
                                                        <td><?php echo $coloumn['NewsDateTime'];?></td>
                                                         <td><a href="news_details.php?NewsId=<?php echo $coloumn['NewsId'];?>"><button id="button"><i class="fa fa-refresh fa-spin"></i> Show</button></a></td>
                                                    </tr>
                                                    <?php } ?>
                                                </tbody>
                                            </table>
                                        </div>
                                          
                                         
                                    </div>       
<!--End-->
        </div>
      </div>
    </div>
       
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <script src="js/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
 <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
     <script type="text/javascript">
       $(document).ready(function(){
            // alert('hello');
            $('#mydatepicker').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true,
                 format: 'yyyy-mm-dd',
                 });
           $("#prioritizeDate").click(function(){
             
             var date= $("#mydate").val();
            //alert(date);
            $.ajax({
            type: "GET",
            url: 'config/user_dates.php',
            data: {
                    'uid': <?php echo $_SESSION['uid']; ?>,
                    'NewsDateTime': date 
                   },
            success: function(response)
            {
              location.reload();
            } 
          });
       
            
           });
        });
    </script>
     <script type="text/javascript">
        function prioritize(EntityId){
              $.ajax({
              type: "GET",
              url: 'config/user_priority.php',
              data: {
                      'uid': <?php echo $_SESSION['uid']; ?>,
                      'entityid': EntityId 
                     },
              success: function(response)
              {
               document.getElementById(EntityId).style.color="white";
               document.getElementById(EntityId).style.backgroundColor="green";

              } 
            });
            }

     function Unprioritize(EntityId){
    
              $.ajax({
              type: "GET",
              url: 'config/user_Unpriority.php',
              data: {
                      'uid': <?php echo $_SESSION['uid']; ?>,
                      'entityid': EntityId 
                     },
              success: function(response)
              {
               document.getElementById(EntityId).style.color="white";
               document.getElementById(EntityId).style.backgroundColor="red";
               location.reload();
              } 
            });
            }
            
           function UnprioritizeDate(NewsDateTime){
             //alert('hello');
            $.ajax({
            type: "GET",
            url: 'config/user_dates_remove.php',
            data: {
                    'uid': <?php echo $_SESSION['uid']; ?>,
                    'NewsDateTime': NewsDateTime 
                   },
            success: function(response)
            {
              document.getElementById(NewsDateTime).style.color="white";
              document.getElementById(NewsDateTime).style.backgroundColor="red";
              location.reload();
            } 
          });
          }
     </script>
  </body>
</html>

