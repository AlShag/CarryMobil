ymaps.ready(init);

function init(){
  // Подключаем поисковые подсказки к полю ввода.
  var DELIVERY_TARIFF = 20,
      MINIMUM_COST = 500
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
suggestView.state.events.add('change', function () {
  $('#id_162405983451135128378 input').val($('#from_address').val()); road_change();

});       
suggestView2.state.events.add('change', function () {
  $('#id_162405911894458286030 input.ymaps-2-1-78-route-panel-input__input').val($('#to_address').val()); road_change();
});

routePanelControl = new ymaps.control.RoutePanel({
  options: {
      // Добавим заголовок панели.
    
      title: 'Расчёт доставки'
  }
}),


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

routePanelControl.routePanel.options.set({
types: {auto: true}
});

myMap.controls.add(routePanelControl).add(zoomControl);

 // Получим ссылку на маршрут.
 routePanelControl.routePanel.getRouteAsync().then(function (route) {

  // Зададим максимально допустимое число маршрутов, возвращаемых мультимаршрутизатором.
  route.model.setParams({results: 1}, true);

  // Повесим обработчик на событие построения маршрута.
  route.model.events.add('requestsuccess', function () {

      var activeRoute = route.getActiveRoute();
      if (activeRoute) {
          // Получим протяженность маршрута.
          var length = route.getActiveRoute().properties.get("distance"),
          // Вычислим стоимость доставки.
              price = calculate(Math.round(length.value / 1000)),
          // Создадим макет содержимого балуна маршрута.
              balloonContentLayout = ymaps.templateLayoutFactory.createClass(
                  '<span>Расстояние: ' + length.text + '.</span><br/>' +
                  '<span style="font-weight: bold; font-style: italic">Стоимость доставки: ' + price + ' р.</span>');
          // Зададим этот макет для содержимого балуна.
          route.options.set('routeBalloonContentLayout', balloonContentLayout);
          // Откроем балун.
          activeRoute.balloon.open();
      }
  });

});
// Функция, вычисляющая стоимость доставки.
  function calculate(routeLength) {
    return Math.max(routeLength * DELIVERY_TARIFF, MINIMUM_COST);
  }
}