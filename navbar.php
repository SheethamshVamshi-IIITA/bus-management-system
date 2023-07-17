<head>

</head>
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center" id="nevbar">

      <h1 class="logo mr-auto"><a href="./index.php?page=home">Bus Booking</a></h1>

      <nav class="nav-menu d-none d-lg-block" id='top-nav'>
        <ul>
        <li class="drop-down nav-bus nav-location"><a href="#">Login</a>
            <ul>
              <li><a href="./employee.php">Employee Login</a></li>
              <li><a href="./customer.php">Customer Login</a></li>
              <li><a href="./admin.php">Admin Login</a></li>
             </ul>
          </li>   
      
         <li class="nav-schedule"><a href="./index.php?page=schedule_home">Schedule</a></li>
         <li class="nav-home"><a href="./">Home</a></li>
        
              
        </ul>
       
      </nav>


    </div>
  </header>
  <script>
 $('#new_user').click(function(){
		uni_modal('Add New User','manage_user.php');
	})

    $(document).ready(function(){
      var page = '<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>';
      if(page != ''){
        $('#top-nav li').removeClass('active')
        $('#top-nav li.nav-'+page).addClass('active')
      }
      
 $('#new_user').click(function(){
		uni_modal('Add New User','manage_user.php');
	})
      $('#manage_account').click(function(){
      uni_modal('Manage Account','manage_account.php')
  })
 
    })
   

  </script>

  