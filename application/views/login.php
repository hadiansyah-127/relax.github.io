<!doctype html>
<html lang="en">
<head>
    <base href="<?=base_url()?>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Christian Rosandhy">
     <title>BATAN - Aplikasi Barang Gudang</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/alertify.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="login" class="body">

  <form action="home/login" class="login-form" method="post">
    <h1 class=>
      <span> <img style="height: 50px; margin-top: -40px;" src="asset/batan.png"> </span>
    </h1>
    <h2>Aplikasi Pengambilan Barang Gudang</h2>
    <p>Khusus Admin</p>

    <fieldset>
      
       <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
          <input type="text" name="username" id="usrnm" placeholder="Username" class="form-control">
       </div>
       <br>
       <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
          <input type="password" name="password" id="pswd" class="form-control" placeholder="Password">
      </div>
      <br>
      <button class="btn btn-block btn-lg btn-info">
          <span class="fa fa-sign-in"></span> Masuk
      </button>       

    </fieldset>
  </form>

    <script src="js/jquery.js"></script>
    <script src="js/alertify.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script>
      $(function(){
        <?=$this->cms->show_alert()?>
      });
    </script>
</body>
</html>

