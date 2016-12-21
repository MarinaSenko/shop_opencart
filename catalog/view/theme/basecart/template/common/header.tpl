<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<link href="catalog/view/theme/basecart/css/bootstrap.min.css" rel="stylesheet">
<link href="catalog/view/theme/basecart/css/font-awesome.min.css" rel="stylesheet">

<!-- START basecart module -->

<?php
  if ($theme == "basecart_module_themedefault") {
      include "catalog/view/theme/basecart/css/bootswatch/default.tpl";
  } elseif ($theme == "basecart_module_themecerulean") {
      include "catalog/view/theme/basecart/css/bootswatch/cerulean.tpl";
  } elseif ($theme == "basecart_module_themecosmo") {
      include "catalog/view/theme/basecart/css/bootswatch/cosmo.tpl";
  } elseif ($theme == "basecart_module_themecyborg") {
      include "catalog/view/theme/basecart/css/bootswatch/cyborg.tpl";
  } elseif ($theme == "basecart_module_themedarkly") {
      include "catalog/view/theme/basecart/css/bootswatch/darkly.tpl";
  } elseif ($theme == "basecart_module_themeflatly") {
      include "catalog/view/theme/basecart/css/bootswatch/flatly.tpl";
  } elseif ($theme == "basecart_module_themejournal") {
      include "catalog/view/theme/basecart/css/bootswatch/journal.tpl";
  } elseif ($theme == "basecart_module_themelumen") {
      include "catalog/view/theme/basecart/css/bootswatch/lumen.tpl";
  } elseif ($theme == "basecart_module_themepaper") {
      include "catalog/view/theme/basecart/css/bootswatch/paper.tpl";
  } elseif ($theme == "basecart_module_themereadable") {
      include "catalog/view/theme/basecart/css/bootswatch/readable.tpl";
  } elseif ($theme == "basecart_module_themesandstone") {
      include "catalog/view/theme/basecart/css/bootswatch/sandstone.tpl";
  } elseif ($theme == "basecart_module_themesimplex") {
      include "catalog/view/theme/basecart/css/bootswatch/simplex.tpl";
  } elseif ($theme == "basecart_module_themeslate") {
      include "catalog/view/theme/basecart/css/bootswatch/slate.tpl";
  } elseif ($theme == "basecart_module_themespacelab") {
      include "catalog/view/theme/basecart/css/bootswatch/spacelab.tpl";
  } elseif ($theme == "basecart_module_themesuperhero") {
      include "catalog/view/theme/basecart/css/bootswatch/superhero.tpl";
  } elseif ($theme == "basecart_module_themeunited") {
      include "catalog/view/theme/basecart/css/bootswatch/united.tpl";
  } elseif ($theme == "basecart_module_themeyeti") {
      include "catalog/view/theme/basecart/css/bootswatch/yeti.tpl";
  }
?>

<!-- END basecart module -->

<link href="catalog/view/theme/basecart/css/main.css" rel="stylesheet">

<script src="catalog/view/theme/basecart/js/jquery.min.js"></script>
<script src="catalog/view/theme/basecart/js/bootstrap.min.js"></script>
<script src="catalog/view/theme/basecart/js/common.js"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>">
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>">
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<header>
<?php if ($nav == "basecart_module_navinverse") { ?>
<?php $class = 'navbar-inverse'; ?>
<?php } else { ?>
<?php $class = 'navbar-default'; ?>
<?php } ?>
<nav class="navbar <?php echo $class; ?>">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <?php if ($logo) { ?>
      <a class="navbar-brand" href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
      <?php } else { ?>
      <a class="navbar-brand" href="<?php echo $home; ?>"><?php echo $name; ?></a>
      <?php } ?>
    </div>
    <?php if ($categories) { ?>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown">
          <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo $category['name']; ?> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <?php foreach ($children as $child) { ?>
              <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
              <?php } ?>
            <?php } ?>
            <li role="separator" class="divider"></li>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $text_all; ?> <?php echo $category['name']; ?></a></li>
          </ul>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li id="hiddenM"><a class="btn btn-link" role="button" data-toggle="collapse" href="#hiddenMenu" aria-expanded="false" aria-controls="hiddenMenu"><i class="fa fa-ellipsis-h n-icon"></i></a></li>
        <?php echo $cart; ?>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user n-icon"></i><span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
      </ul>
    </div>
    <?php } ?>
    <div class="collapse" id="hiddenMenu">
      <div class="row">
        <div class="col-sm-4">
          <?php echo $currency; ?>
        </div>
        <div class="col-sm-4">
          <?php echo $language; ?>
        </div>
          <div class="col-sm-4">
          <?php echo $search; ?>
        </div>
      </div>
    </div>
  </div>
</nav>
</header>

<a href="#" id="popup_toggle" class="callback">
    <div class="circlephone" style="transform-origin: center;"></div>
    <div class="circle-fill" style="transform-origin: center;"></div>
    <div class="img-circle" style="transform-origin: center;">
    <div class="img-circleblock" style="transform-origin: center;"></div></div></a>
<div class="overlay" id="overlay">
<div class="wrap"></div>
</div>


<div id="modal_form">
	  <h2>Заказать звонок!</h2>
	  <div class="comment">Оставьте Ваши данные и мы перезвоним Вам!</div>
      <a class="exit"></a>
	  <form method="post">
        <input type="text" placeholder="Как вас зовут?" name="name-zv" id="name" class="input_text">
        <input type="text" placeholder="Контактный телефон *" name="phone-zv" id="phone-zv" class="phone-zv">
		<div class="comment">Поля отмеченные <span class="required">*</span> обязательны для заполнения</div>
        <input class="button" type="submit" value="Перезвоните мне">
    </form>
</div>

<div id="overlay"></div>


<script>


  $(function() {
  	$('.callback').click( function(event){
  		event.preventDefault();
  		$('#overlay').fadeIn(400,
  		 	function(){
  				$('#modal_form')
  					.css('display', 'block')
  					.animate({opacity: 1, top: '50%'}, 200);
  		});
  	});

  	$('.exit, #overlay').click( function(){
  		$('#modal_form')
  			.animate({opacity: 0, top: '45%'}, 200,
  				function(){
  					$(this).css('display', 'none');
  					$('#overlay').fadeOut(400);
  				}
  			);
  	});
  });


</script>


<style>


  #modal_form {
  	width: 350px;
  	height: 300px;
  	border-radius: 5px;
  	background: #fff;
  	position: fixed;
  	top: 45%;
  	left: 50%;
  	margin-top: -135px;
  	margin-left: -175px;
  	display: none;
  	opacity: 0;
  	z-index: 5;
  	padding: 20px 10px;
  }

  #overlay {
  	z-index:3;
  	position:fixed;
  	background-color:#000;
  	opacity:0.8;
  	-moz-opacity:0.8;
  	filter:alpha(opacity=80);
  	width:100%;
  	height:100%;
  	top:0;
  	left:0;
  	cursor:pointer;
  	display:none;
  }

  #modal_form input[type="text"] {
      background-color: #fff;
      border: 1px solid #c0c0c0;
      border-radius: 1px;
      color: #555;
      display: block;
      font-size: 1em;
      height: 30px;
      padding: 5px;
      margin-bottom: 17px;
      width: 95%;
      float: left;
  }

  #modal_form  h2{
  	text-align: center;
  }
  #modal_form .comment {
      color: #797979;
      padding-bottom: 15px;
      font-size: 12px;
  }

  .exit {
      position: absolute;
      top: 5px;
      right: 5px;
      width: 28px;
      height: 28px;
      text-decoration: none;
      -webkit-border-radius: 50%;
      border-radius: 50%;
      border: 2px solid #3e5368;
      -webkit-transition: background 0.2s linear;
      -moz-transition: background 0.2s linear;
      -o-transition: background 0.2s linear;
      transition: background 0.2s linear;

  }
  .exit:after{
      display: block;
      font-size: 28px;
      content: "x";
  	padding-left: 7px;
      line-height: 26px;
      cursor: pointer;
      text-decoration: none;
      color: #3e5368;
      -webkit-transition: all 0.2s linear;
      -moz-transition: all 0.2s linear;
      -o-transition: all 0.2s linear;
      transition: all 0.2s linear;
  }
  .exit:hover {
      background: #DCDCDC;
  }

  #modal_form .button {
  	display: block;
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 3px;
      color: #555;
      cursor: pointer;
      font-size: 14px;
      font-weight: bold;
      height: 34px;
      margin: 10px 0;
      padding: 2px 16px;
      width: 185px;
  	margin: 0 auto;
  }
  #modal_form .button:hover {
      background-color: #4683ea;
      border: 1px solid #4387fd;
      color: #fff;
  }












    #popup_toggle{bottom:25px;right:10px;position:fixed; z-index:99999999;}
    .img-circle{background-color:#29AEE3;box-sizing:content-box;-webkit-box-sizing:content-box;}
    .circlephone{box-sizing:content-box;-webkit-box-sizing:content-box;border: 2px solid #29AEE3;width:150px;height:150px;bottom:-25px;right:10px;position:absolute;-webkit-border-radius:100%;-moz-border-radius: 100%;border-radius: 100%;opacity: .7;-webkit-animation: circle-anim 2.4s infinite ease-in-out !important;-moz-animation: circle-anim 2.4s infinite ease-in-out !important;-ms-animation: circle-anim 2.4s infinite ease-in-out !important;-o-animation: circle-anim 2.4s infinite ease-in-out !important;animation: circle-anim 2.4s infinite ease-in-out !important;-webkit-transition: all .5s;-moz-transition: all .5s;-o-transition: all .5s;transition: all 0.5s;}
    .circle-fill{box-sizing:content-box;-webkit-box-sizing:content-box;background-color:#29AEE3;width:100px;height:100px;bottom:0px;right:35px;position:absolute;-webkit-border-radius: 100%;-moz-border-radius: 100%;border-radius: 100%;border: 2px solid transparent;-webkit-animation: circle-fill-anim 2.3s infinite ease-in-out;-moz-animation: circle-fill-anim 2.3s infinite ease-in-out;-ms-animation: circle-fill-anim 2.3s infinite ease-in-out;-o-animation: circle-fill-anim 2.3s infinite ease-in-out;animation: circle-fill-anim 2.3s infinite ease-in-out;-webkit-transition: all .5s;-moz-transition: all .5s;-o-transition: all .5s;transition: all 0.5s;}
    .img-circle{box-sizing:content-box;-webkit-box-sizing:content-box;width:72px;height:72px;bottom: 14px;right: 49px;position:absolute;-webkit-border-radius: 100%;-moz-border-radius: 100%;border-radius: 100%;border: 2px solid transparent;opacity: .7;}
    .img-circleblock{box-sizing:content-box;-webkit-box-sizing:content-box;width:72px;height:72px;background-image:url(/image/mini.png);background-position: center center;background-repeat:no-repeat;animation-name: tossing;-webkit-animation-name: tossing;animation-duration: 1.5s;-webkit-animation-duration: 1.5s;animation-iteration-count: infinite;-webkit-animation-iteration-count: infinite;}
    .img-circle:hover{opacity: 1;}
    @keyframes pulse {0% {transform: scale(0.9);opacity: 1;}
      50% {transform: scale(1); opacity: 1; }
      100% {transform: scale(0.9);opacity: 1;}}
     @-webkit-keyframes pulse {0% {-webkit-transform: scale(0.95);opacity: 1;}
      50% {-webkit-transform: scale(1);opacity: 1;}
      100% {-webkit-transform: scale(0.95);opacity: 1;}}
    @keyframes tossing {
      0% {transform: rotate(-8deg);}
      50% {transform: rotate(8deg);}
      100% {transform: rotate(-8deg);}}
    @-webkit-keyframes tossing {
      0% {-webkit-transform: rotate(-8deg);}
      50% {-webkit-transform: rotate(8deg);}
      100% {-webkit-transform: rotate(-8deg);}}
    @-moz-keyframes circle-anim {
      0% {-moz-transform: rotate(0deg) scale(0.5) skew(1deg);opacity: .1;-moz-opacity: .1;-webkit-opacity: .1;-o-opacity: .1;}
      30% {-moz-transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .5;-moz-opacity: .5;-webkit-opacity: .5;-o-opacity: .5;}
      100% {-moz-transform: rotate(0deg) scale(1) skew(1deg);opacity: .6;-moz-opacity: .6;-webkit-opacity: .6;-o-opacity: .1;}}
    @-webkit-keyframes circle-anim {
      0% {-webkit-transform: rotate(0deg) scale(0.5) skew(1deg);-webkit-opacity: .1;}
      30% {-webkit-transform: rotate(0deg) scale(0.7) skew(1deg);-webkit-opacity: .5;}
      100% {-webkit-transform: rotate(0deg) scale(1) skew(1deg);-webkit-opacity: .1;}}
    @-o-keyframes circle-anim {
      0% {-o-transform: rotate(0deg) kscale(0.5) skew(1deg);-o-opacity: .1;}
      30% {-o-transform: rotate(0deg) scale(0.7) skew(1deg);-o-opacity: .5;}
      100% {-o-transform: rotate(0deg) scale(1) skew(1deg);-o-opacity: .1;}}
    @keyframes circle-anim {
      0% {transform: rotate(0deg) scale(0.5) skew(1deg);opacity: .1;}
      30% {transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .5;}
      100% {transform: rotate(0deg) scale(1) skew(1deg);
    opacity: .1;}}
    @-moz-keyframes circle-fill-anim {
      0% {-moz-transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .2;}
      50% {-moz-transform: rotate(0deg) -moz-scale(1) skew(1deg);opacity: .2;}
      100% {-moz-transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .2;}}
    @-webkit-keyframes circle-fill-anim {
      0% {-webkit-transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .2;  }
      50% {-webkit-transform: rotate(0deg) scale(1) skew(1deg);opacity: .2;  }
      100% {-webkit-transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .2;}}
    @-o-keyframes circle-fill-anim {
      0% {-o-transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .2;}
      50% {-o-transform: rotate(0deg) scale(1) skew(1deg);opacity: .2;}
      100% {-o-transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .2;}}
    @keyframes circle-fill-anim {
      0% {transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .2;}
      50% {transform: rotate(0deg) scale(1) skew(1deg);opacity: .2;}
      100% {transform: rotate(0deg) scale(0.7) skew(1deg);opacity: .2;}

</style>




