<?php if(isset($_SESSION['login_id'])) include 'admin_navbar.php'; else include 'navbar.php'; ?>

 <section id="bg-bus" class="d-flex align-items-center">
    <div class="container">
      <?php if(!isset($_SESSION['login_id'])): ?>
      <!--	<center><button class="btn btn-info btn-lg" type="button" id="book_now">Book Now</button></center>     
      <button class="float-right btn btn-primary btn-sm" type="button" id="new_user">Add New <i class="fa fa-plus"></i></button> -->
     <?php else: ?>
        <h2>Welcome:-  <?php echo $_SESSION['login_username'] ?>  </h2>  
      <?php endif; ?>
    </div>
  </section>
  <script>
  $(document).ready(function(){
		load_user()
	})
  	$('#book_now').click(function(){
      uni_modal('Find Schedule','book_filter.php')
  })
  $('#new_user').click(function(){
		uni_modal('Add New User','manage_user.php')
	});
  </script>