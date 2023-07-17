<?php
include('db_connect.php');
if(isset($_GET['id']) && !empty($_GET['id']) ){
	$qry = $conn->query("SELECT * FROM users where id = ".$_GET['id'])->fetch_array();
	foreach($qry as $k => $val){
		$meta[$k] =  $val;
	}
}
?>  
<!DOCTYPE html>
<html>
	<head>
		<?php include('header.php') ?>
        <?php 
        // session_start();
        // if(isset($_SESSION['login_id'])){
        //     header('Location:home.php');
        // }
        ?>
		<title>Employee Login</title>
	</head>
    <style>
        body {
			background-image: url(./images/bus.jpg);
    height: 96vh;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
    </style>
	<body id='login-body' class="bg-light">
    		<div class="card col-md-4 offset-md-4 mt-4">
                <div class="card-header-edge text-black">
                    <strong>Login</strong>
                </div>
            <div class="card-body">
                    <!-- <form id="login-frm">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="username" name="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control">
                        </div> 
                        <div class="form-group text-right">
                            <button class="btn btn-primary btn-block" name="submit">Login</button>
                        </div>
                        
                    </form>  -->
                    <strong>Add User</strong>
                    <form id="manage_user">
		
                    <div class="col-md-12">
			<div class="form-group mb-2">
				<label for="name" class="control-label">Designation</label>
				<input type="hidden" class="form-control" id="id" name="id" value='<?php echo isset($_GET['id']) ? $_GET['id'] : '' ?>' required="">
				<input type="text" class="form-control" id="name" name="name" required="" value="<?php echo isset($meta['name']) ? $meta['name'] : '' ?>">
			</div>  
			<div class="form-group mb-2">
				<label for="username" class="control-label">User Name</label>
				<input type="text" class="form-control" id="username" name="username" required value="<?php echo isset($meta['username']) ? $meta['username'] : '' ?>">
			</div>
			<div class="form-group mb-2">
				<label for="password" class="control-label">Password</label>
				<input type="password" class="form-control" id="password" name="password" required value="<?php echo isset($meta['password']) ? $meta['password'] : '' ?>">
			</div>
			
		</div>
	</form>
            </div>
            <a class="btn btn-primary btn-block" href="./">Home</a>
        </div>

		</body>

        <script>
  function add()
  {
    $.ajax({
			url:'./manage_user.php',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				alert("Not Added");
				console.log(err)
    			end_load()
    			alert_toast('An error occured','danger');
			},
			success:function(resp){
				if(resp == 1){
    				end_load()
    				$('.modal').modal('hide')
					alert("Added");
    				alert_toast('Data successfully saved','success');
    				load_user()
				}
			}
		})
  }

           $('#manage_user').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'./manage_user.php',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				alert("Not Added");
				console.log(err)
    			end_load()
    			alert_toast('An error occured','danger');
			},
			success:function(resp){
				if(resp == 1){
    				end_load()
    				$('.modal').modal('hide')
					alert("Added");
    				alert_toast('Data successfully saved','success');
    				load_user()
				}
			}
		})
	})
        </script>
</html>