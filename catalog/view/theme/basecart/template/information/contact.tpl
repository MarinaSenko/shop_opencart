<?php echo $header; ?>
<div class="container">
 <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <h1><?php echo $heading_title; ?></h1>
      <div class="well bs-component">
      <h3><?php echo $text_location; ?></h3>
          <div class="row">
            <?php if ($image) { ?>
            <div class="col-sm-3"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" /></div>
            <?php } ?>
            <div class="col-sm-3"><strong><?php echo $store; ?></strong><br />
              <address>
              <?php echo $address; ?>
              </address>
              <?php if ($geocode) { ?>
              <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
              <?php } ?>
            </div>
            <div class="col-sm-3"><strong><?php echo $text_telephone; ?></strong><br>
              <?php echo $telephone; ?><br />
              <br />
              <?php if ($fax) { ?>
              <strong><?php echo $text_fax; ?></strong><br>
              <?php echo $fax; ?>
              <?php } ?>
            </div>
            <div class="col-sm-3">
              <?php if ($open) { ?>
              <strong><?php echo $text_open; ?></strong><br />
              <?php echo $open; ?><br />
              <br />
              <?php } ?>
              <?php if ($comment) { ?>
              <strong><?php echo $text_comment; ?></strong><br />
              <?php echo $comment; ?>
              <?php } ?>
            </div>
          </div>
      </div>
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="well bs-component">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <h3><?php echo $text_contact; ?></h3>
            <div class="form-group required">
              <div class="col-sm-12">
                <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                <?php if ($error_name) { ?>
                <div class="text-danger"><?php echo $error_name; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <div class="col-sm-12">
                <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" placeholder="<?php echo $entry_email; ?>" class="form-control" />
                <?php if ($error_email) { ?>
                <div class="text-danger"><?php echo $error_email; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <div class="col-sm-12">
                <textarea name="enquiry" rows="10" id="input-enquiry" placeholder="<?php echo $entry_enquiry; ?>" class="form-control"><?php echo $enquiry; ?></textarea>
                <?php if ($error_enquiry) { ?>
                <div class="text-danger"><?php echo $error_enquiry; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php echo $captcha; ?>
          </fieldset>
          <div class="buttons">
            <div class="pull-right">
              <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
            </div>
          </div>
        </form>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
    <style>

        #map {
        			width: 100%;
        			height: 500px;
        }

    </style>

    <!-- 1. Создаем элемент внутри которого у нас будет отображаться карта Google Maps -->
    <div id="map"></div>
    <br>
    <br>





    <!-- 3. Подключаем библиотеку Google Maps Api, чтобы создать карту -->
    <!-- Атрибуты async и defer - позволяют загружать этот скрипт асинхронно, вместе с загрузкой всей страницы  -->
    <!-- В подключении библиотеки Google Maps Api в конце указан параметр callback, после  подключения и загрузки этого Api сработает функция initMap для отрисовки карты,  которую мы описали выше -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
    <script type="text/javascript">
        // 4. Пишем скрипт который создаст и отобразит карту Google Maps на странице.

        // Определяем переменную map
        var map;

        // Функция initMap которая отрисует карту на странице
        function initMap() {

        	// В переменной map создаем объект карты GoogleMaps и вешаем эту переменную на <div id="map"></div>
        	map = new google.maps.Map(document.getElementById('map'), {
        		// При создании объекта карты необходимо указать его свойства
        		// center - определяем точку на которой карта будет центрироваться
        		center: {lat: 50.445746, lng: 30.502781},
        		// zoom - определяет масштаб. 0 - видно всю платнеу. 18 - видно дома и улицы города.
        		zoom: 17,

        		// Добавляем свои стили для отображения карты
        		styles: [
        		    {
        		        "featureType": "administrative",
        		        "stylers": [
        		            {
        		                "visibility": "off"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "poi",
        		        "stylers": [
        		            {
        		                "visibility": "simplified"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "road",
        		        "elementType": "labels",
        		        "stylers": [
        		            {
        		                "visibility": "simplified"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "water",
        		        "stylers": [
        		            {
        		                "visibility": "simplified"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "transit",
        		        "stylers": [
        		            {
        		                "visibility": "simplified"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "landscape",
        		        "stylers": [
        		            {
        		                "visibility": "simplified"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "road.highway",
        		        "stylers": [
        		            {
        		                "visibility": "off"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "road.local",
        		        "stylers": [
        		            {
        		                "visibility": "on"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "road.highway",
        		        "elementType": "geometry",
        		        "stylers": [
        		            {
        		                "visibility": "on"
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "water",
        		        "stylers": [
        		            {
        		                "color": "#84afa3"
        		            },
        		            {
        		                "lightness": 52
        		            }
        		        ]
        		    },
        		    {
        		        "stylers": [
        		            {
        		                "saturation": -17
        		            },
        		            {
        		                "gamma": 0.36
        		            }
        		        ]
        		    },
        		    {
        		        "featureType": "transit.line",
        		        "elementType": "geometry",
        		        "stylers": [
        		            {
        		                "color": "#3f518c"
        		            }
        		        ]
        		    }
        		]});

        	// Создаем маркер на карте
        	var marker = new google.maps.Marker({

        		// Определяем позицию маркера
        	    position: {lat: 50.445746, lng: 30.502781},

        	    // Указываем на какой карте он должен появится. (На странице ведь может быть больше одной карты)
        	    map: map,

        	    // Пишем название маркера - появится если навести на него курсор и немного подождать
        	    title: 'PHP Academy',

        	    // Укажем свою иконку для маркера
        	    icon: '/image/logo.png'
        	});

        	// Создаем наполнение для информационного окна
        	var contentString = '<div id="content">'+
        	      '<div id="siteNotice">'+
        	      '</div>'+
        	      '<h1 id="firstHeading" class="firstHeading">PHP Academy</h1>'+
        	      '<div id="bodyContent">'+
        	      '<p>The best!!!</p>'+
        	      '<p><b>Веб-сайт:</b> <a href="http://php-academy.kiev.ua" target="_blank">http://php-academy.kiev.ua</a>'+
        	      '</p>'+
        	      '</div>'+
        	      '</div>';

        	// Создаем информационное окно
        	var infowindow = new google.maps.InfoWindow({
        	   content: contentString,
        	   maxWidth: 400
        	});

        	// Создаем прослушивание, по клику на маркер - открыть инфо-окно infowindow
        	marker.addListener('click', function() {
        		infowindow.open(map, marker);
        	});

        }
    </script>




</div>




<?php echo $footer; ?>
