let order_list_count=1;
let cargo_type='';
let city_name1='';
let city_name2='';
let roads_counter=1;
let from_address=$('#from_address').val();
let to_address=$('#to_address').val();
to_address='';
let current_road_price=0;
let full_road = {from:[],to:[]};
let full_type = {type:[],options:[],comment:[]}
let transition_number=1;
let button_id='';
let full_road_price=0;
let order_price=0;
let loader_count=0;
let loader_time=0;
let loader_price=0;
let type_price=0;
$(document).ready(function (){
    $('#order_next_list').click(function(){order_next_list()});
    $('#order_back_list').click(function(){order_back_list()});
    $('#add_dop_road').click(function(){road_add()});
    $('#id_cargo_type').val($('#goods_type_select :selected').text());
    $('#order_send_button').click(function(){$('#order_send').click();});
    $('#from_address').on('change', function(){road_change();});
    $('#to_address').on('change', function(){road_change();});
    $('#goods_type_select').on('change', function(){
        $('#goods_type_select').blur();
        result = $('#goods_type_select :selected').text();
        $('.for_type').hide();
        let option_class = '#'+$('#goods_type_select :selected').attr('class')+'_add';
        if(option_class!='#_add' | option_class!='') $(option_class).show();
        $('#id_cargo_type').val(result);
        cargo_type=result;
        $('#full_cargo_type').val(cargo_type);
      });
    $('#from_address').on('change', function() {
        from_address=$('#from_address').val();
        // let city_name_pos1 = from_address.indexOf('г.')+3;
        // let city_name_pos2 = from_address.indexOf(',')-2;
        // let city_name = from_address.substr(city_name_pos1,city_name_pos2);
        // alert(city_name);
      });
    $('#to_address').on('change', function() {
        to_address=$('#to_address').val();
        $('#id_to_address').val(to_address);
      });
});
function order_next_list(){
    order_list_count+=1;
    if(order_list_count>=2 & order_list_count<=4){$('#order_back_list').show()} else $('#order_back_list').hide();
    if(order_list_count>=4){$('#order_next_list').hide()} else $('#order_next_list').show();
    if(order_list_count==4){$('#order_send_button').show(); final_list();} else $('#order_send_button').hide();
    $('.list').hide();
    $('.list_head').hide(); 
    $('#list_'+order_list_count).show();
    $('#list_head_'+order_list_count).show();
}
function order_back_list(){
    order_list_count-=1;
    if(order_list_count==1) $('#order_back_list').hide();
    if(order_list_count==4){$('#order_next_list').hide()} else $('#order_next_list').show();
    if(order_list_count==4){$('#order_send_button').show()} else $('#order_send_button').hide();
    $('.list').hide();
    $('.list_head').hide(); 
    $('#list_'+order_list_count).show();
    $('#list_head_'+order_list_count).show();
}
function road_add(){
  if(roads_counter==1){
    from_address=$('#from_address').val();
    to_address=$('#to_address').val();
  }
  if((from_address!='') && (to_address!='')){
    full_road.from.push(from_address);
    full_road.to.push(to_address);
    roads_counter++;
    $('.roads').append('<button class="road_button" id="road_'+roads_counter+'" onclick="roads_transition(this)">'+roads_counter+'</button>');
    $('#from_address').val('');
    $('#to_address').val('');
    from_address='';
    to_address='';
    transition_number++;
  }
}
function roads_transition(obj){
  button_id=obj.id;
  $('.road_button').css('background-color','white');
  $('#'+obj.id).css('background-color','black');
  transition_number=parseInt(button_id.replace('road_',''));
  $('#from_address').val(full_road.from[transition_number-1]);
  $('#to_address').val(full_road.to[transition_number-1]);
}

function road_change(){
  from_address=$('#from_address').val();
  to_address=$('#to_address').val();
  console.log(transition_number);
  full_road.from[transition_number-1]=from_address;
  full_road.to[transition_number-1]=to_address;
}

function final_list(){
  $('#full_road option').remove();
  full_road_price=0;
  order_price=0;
  if(full_road.from!='' & full_road.to!=''){
    for (let n = 0; n <= roads_counter-1; n++){
      from_address=full_road.from[n];
      to_address=full_road.to[n];
      full_road_price+=road_price();
      $('#full_road').append('<option name="from" id="address_from_'+n+'">'+full_road.from[n]+'</option>');
      $('#full_road').append('<option name="to" id="address_to_'+n+'">'+full_road.to[n]+'</option>');
    }
  }
  $('#road_full_price').text(full_road_price+' р');
  $('#id_from_address').val(full_road.from);
  $('#id_to_address').val(full_road.to);
  loader_count=$('#id_loader_count').val();
  loader_time=$('#id_loader_time_count').val();
  type_price=parseInt($('#goods_type_select :selected').val());
  console.log(loader_count);
  console.log(loader_time);
  loader_price=(loader_count*loader_time)*350;
  order_price=full_road_price+loader_price+type_price;
  $('#loader_price').text(loader_price+' р');
  $('#loader_count').text(loader_count+' чел.');
  $('#loader_time').text(loader_time+' час.');
  $('#id_order_price').val(order_price);
  $('#type_full_price').text(type_price+' р')
  $('#order_price').text(order_price+'р');
  // type_add();
}

function road_price(){
    console.log(roads_counter);
    for(var i = 0, l = $('#city_price tr').length; i <= l; i++){
      let city_name1 = $('#city_price tr').eq(i).find('td').eq(1).text();
      let city_name2 = $('#city_price tr').eq(i).find('td').eq(2).text();
      if(((to_address.includes(city_name1) & from_address.includes(city_name2)) || (from_address.includes(city_name1) & to_address.includes(city_name2))) & ((city_name1!='') & (city_name2!=''))){
        current_road_price=parseInt($('#city_price tr').eq(i).find('td').eq(4).text());
        console.log($('#city_price tr').eq(i).find('td').eq(4).text());
        i=l;
      }
      else{
        console.log('Иначе');
        current_road_price=500;
        console.log(current_road_price);
      }
    }
    return current_road_price;
  }

function type_add(){
  if($('#goods_type_select :selected').text()){
  full_type.type.push($('#goods_type_select :selected').text());
  console.log(full_type.type[1]);
  }
}