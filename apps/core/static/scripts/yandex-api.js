let timer=1
let timer2=1

ymaps.ready(init);

function init(){
  // Подключаем поисковые подсказки к полю ввода.
  var DELIVERY_TARIFF = 40,
      MINIMUM_COST = 700
  var suggestView = new ymaps.SuggestView('from_address');
  var suggestView2 = new ymaps.SuggestView('to_address');
  var myMap = new ymaps.Map('map', {
    center: [54.901383, 52.297113],
    zoom: 9,
    type: 'yandex#map',
    controls: ['searchControl'],
    behaviors: ['scrollZoom', 'drag']
  });

  var searchControl = new ymaps.control.SearchControl({
    options: {
        provider: 'yandex#search'
    }
  
});

// routePanelControl = new ymaps.control.RoutePanel({
//   options: {
//     // Добавим заголовок панели.
//     from: 'Москва',
//     title: 'Расчёт доставки'
//   }
// }),

// suggestView.state.events.add('change', function () {
//   $('.ymaps-2-1-78-route-panel-input__input[placeholder="Откуда"]').val($('#from_address').val()); setTimeout($('#id_16240645489145071552 .ymaps-2-1-78-route-panel-input__location').click(), 4000)

// }); 
// suggestView2.state.events.add('change', function () {
//   $('.ymaps-2-1-78-route-panel-input__input[placeholder="Куда"]').val($('#to_address').val()); road_change();
// });

zoomControl = new ymaps.control.ZoomControl({
  options: {
      size: 'small',
      float: 'none',
      position: {
          bottom: 145,
          right: 10
      }
  }
});

// routePanelControl.routePanel.options.set({
// types: {auto: true}
// });
myMap.controls.add('routePanelControl', {
  maxWidth: 300,
});

var routePanel = myMap.controls.get('routePanelControl').routePanel;
routePanel.options.set('adjustMapMargin', true);
routePanel.state.set({
    type: "auto"
});
suggestView.state.events.add('change', function () {
  setTimeout(from_road_choice,2000);
});
suggestView2.state.events.add('change', function () {
  setTimeout(to_road_choice,2000);
 
});


function from_road_choice(){
  routePanel.state.set({
    from: $('#from_address').val(),
  });
}

function to_road_choice(){
  routePanel.state.set({
    to: $('#to_address').val(),
  });
}

 // Получим ссылку на маршрут.
    routePanel.getRouteAsync().then(function (route) {

  // Зададим максимально допустимое число маршрутов, возвращаемых мультимаршрутизатором.
  route.model.setParams({results: 1}, true);

  // Повесим обработчик на событие построения маршрута.
  route.model.events.add('requestsuccess', function () {

      var activeRoute = route.getActiveRoute();
      if (activeRoute) {
          // Получим протяженность маршрута.
          var length = route.getActiveRoute().properties.get("distance");
          if (length.value <= 10000) DELIVERY_TARIFF=100
          else if(length.value <= 15000) DELIVERY_TARIFF=60;
          console.log((length.value <= 15000));
          // Вычислим стоимость доставки.
          var price = calculate(Math.round(length.value / 1000)),
          // Создадим макет содержимого балуна маршрута.
              balloonContentLayout = ymaps.templateLayoutFactory.createClass(
                  '<span>Расстояние: ' + length.text + '.</span><br/>' +
                  '<span style="font-weight: bold; font-style: italic">Стоимость доставки: ' + price + ' р.</span>');
          // Зададим этот макет для содержимого балуна.
          route.options.set('routeBalloonContentLayout', balloonContentLayout);
          // Откроем балун.
          activeRoute.balloon.open();
      }
      current_road_price=price;
      if(road_prices.length<transition_number){
        road_prices.push(price);
      } else if(road_prices.length==transition_number){
        road_prices[transition_number-1]=price;
      }
  });
});
// Функция, вычисляющая стоимость доставки.
  function calculate(routeLength) {
    return Math.max(routeLength * DELIVERY_TARIFF, MINIMUM_COST);
  }
}