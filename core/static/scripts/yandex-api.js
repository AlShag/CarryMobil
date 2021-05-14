ymaps.ready(init);

function init(){
  // Подключаем поисковые подсказки к полю ввода.
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
  $('.ymaps-2-1-78-searchbox-input__input').val($('#from_address').val()); road_change();$('.ymaps-2-1-78-searchbox-button-text').click();
  $('.ymaps-2-1-78-balloon__close-button').click();
});       
suggestView2.state.events.add('change', function () {
  $('.ymaps-2-1-78-searchbox-input__input').val($('#to_address').val()); road_change();$('.ymaps-2-1-78-searchbox-button-text').click();
});       
}