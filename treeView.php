<?php
include('db.php');
if(isset($_POST['adduser'])){  
   $msg = userCreation();     
}

// insert query
function userCreation(){

      global $conn;
	  
	  /** @todo  Need to validate user arleady exist **/
	  
      $parent_id  = legal_input($_POST['parent_id']);
      $userName   = legal_input($_POST['userName']);
	  $query=$conn->prepare("INSERT INTO user (FIRST_NAME) VALUES (?)");
	  $query->bind_param('s',$userName);
	  $exec= $query->execute();
	  if($exec){
		$uid = $conn->insert_id;
		
		$query1=$conn->prepare("INSERT INTO team_map (USER_ID,REPORTING_TO) VALUES (?,?)");
		$query1->bind_param('ii',$uid,$parent_id);
		
		$exec= $query1->execute();
        $msg="User was created sucessfully";
        return $msg;
      
      }else{
        $msg= "Error: " . $query . "<br>" . mysqli_error($conn);
      }
}

/** Get the user team data **/

$catData	=	getTeamData();

function getTeamData($parent_id=0){

  global $conn;

  $query = $conn->prepare("SELECT tm.REPORTING_TO,tm.id as id, u.FIRST_NAME as name FROM team_map as tm 
							JOIN user as u on u.id = tm.USER_ID
							WHERE tm.REPORTING_TO=?");
  $query->bind_param('i',$parent_id); 
  $query->execute();
  $exec=$query->get_result();
  
  $catData=[];
  if($exec->num_rows > 0){

    while($row= $exec->fetch_assoc())
    {
        $catData[]=[
          'id'=>$row['id'],
          'parent_id'=>$row['REPORTING_TO'],
          'category_name'=>$row['name'],
          'nested_categories'=>getTeamData($row['id'])
        ];  
   }

   return $catData;
        
  }else{
    return $catData=[];
  }
}

/** Recursive call the build a tree view **/

function display_list($nested_categories){
  $list = '<ul>';
  foreach($nested_categories as $nested){

    $list .= '<li><code>'.$nested['category_name'].'</code>';
    
    if( ! empty($nested['nested_categories'])){
		
      $list .= display_list($nested['nested_categories']);
	
    }else{
		$list .= '</li>';
	}
  }
  $list .= '</ul>';
  
  return $list;
}

/** Recursive call the display the user in tree view **/

function display_option($nested_categories,$mark=' ')
{
  
  foreach($nested_categories as $nested){

    $option .= '<option value="'.$nested['id'].'">'.$mark.$nested['category_name'].'</option>';
    
    if( ! empty($nested['nested_categories'])){
      $option .= display_option($nested['nested_categories'],$mark.'&nbsp;&nbsp;&nbsp;');
    }
  } 
  return $option;
}

// convert illegal input to legal input
function legal_input($value) {
  $value = trim($value);
  $value = stripslashes($value);
  $value = htmlspecialchars($value);
  return $value;
}


?>