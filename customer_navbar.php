  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto">Bus Booking</h1>
     
      <nav class="nav-menu d-none d-lg-block" id='top-nav'>
        <ul>
        <li ><a href="#"><?php echo $_SESSION['login_name'] ?> </a>
        <li > <a href="javascript:void(0)" id="manage_account">Change Password</a></li>
   <li ><a href="./index.php?page=cust_schedule">Schedule </a>
   <li ><a href="./customer_logout.php">Log Out </a>
            
          </li>
          </li>
          
        </ul>
        
      </nav> 


    </div>
  </header>
  <script>
    $(document).ready(function(){
      var page = '<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>';
      if(page != ''){
        $('#top-nav li').removeClass('active')
        $('#top-nav li.nav-'+page).addClass('active')
      }
      

  $('#book_now').click(function(){
      uni_modal('Find Schedule','book_filter_cust.php')
  })
    })
   
  	$('#book_now').click(function(){
      uni_modal('Find Schedule','book_filter_cust.php')
  })
  $('#manage_account').click(function(){
      uni_modal('Manage Account','manage_account.php')
  })
 
  </script>


  