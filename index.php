<?php
include('treeView.php');
?>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<title>TEAM STRUCTURE</title>
</head>
<body>
<!--====form section start====-->
<div class="left-col">
<ul>
  <li><a href="index.php?add=add-user">Add Team Member</a></li>
  <li><a href="index.php">View Team Structure</a></li>
</ul>      
</div>
<!--====form section start====-->

<div class="right-col">
<div class="form">
    
<p style="color:red"><?php if(!empty($msg)){echo $msg; }?></p> <?php

    $add=$_GET['add']??'';
	
      switch ($add) {
      case 'add-user':
              
?>

   <!--==== category form=====-->
	<div class="form-title">
   <h2>CREATE USER</h2>
   </div>
   <form method="post" name="addcat"  action="index.php">
	  <label>Existing Users</label>
	  <select name="parent_id">
           
<?php  foreach ($catData as $cat) { ?> 
		<option value="<?php echo $cat['id']; ?>"><?php echo $cat['category_name']; ?></option> <?php

         if( ! empty($cat['nested_categories'])){
            echo display_option($cat['nested_categories'], $mark.'&nbsp;&nbsp;&nbsp;');
          } 
       }
              
?>

       </select>
          <label>Enter New User</label>
          <input type="text" placeholder="Enter Full Name" name="userName" required>
          <input type="submit" name="adduser" value="Add User">
    </form>
    <!--=======subcategory form====-->
                  
<?php

      break;
      default:
              
?>

<!--=====category subcategory list=====-->
 <figure>
 
<?php
foreach($catData as $cat){ ?>
      <ul class="tree"> 
			  <li><code>
		<?php echo $cat['category_name']; ?>
		</code>
		<?php

			  if( ! empty($cat['nested_categories'])){

				echo display_list($cat['nested_categories']);
			  }else{ ?>
	</li>
			<?php  }				  
												
		?>

		
<!--======category subcategory list=====-->
      
   </ul>                                      
<?php  }
        break;}
    
?>
 
    </figure>
  
    </div>
  </div>
  
 

</body>
</html>