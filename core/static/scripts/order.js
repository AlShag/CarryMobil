  let order_list_count=1;
  let cargo_type='';
  let city_name1='';
  let city_name2='';
  let roads_counter=1;
  let from_address=$('#from_address').val();
  let to_address=$('#to_address').val();
  to_address='';
  let current_road_price=0;
  let full_road = [{from:[],to:[],passing_to:0}];
  let passing_road = [{type:'',road: 0,in_road:[]}];
  let passing_roads_info = [];
  console.log(full_road[0]);
  let full_type = {type:[],options:[],comment:[]}
  let transition_number=1;
  let transition_road = 0;
  let button_id='';
  let full_road_price=0;
  let order_price=0;
  let loader_count=0;
  let loader_time=0;
  let loader_price=0;
  let type_price=0;
  let available_lists=[1];
  let last_road='';
  let dop_road_added=false;
  let passing_road_added=false;
  let passing_to=0;
  $(document).ready(function (){
      $('#order_next_list').click(function(){order_next_list()});
      $('#order_back_list').click(function(){order_back_list()});
      $('#add_dop_road').click(function(){// Добавление доп. маршрута
        $('#passing_from_road').text(from_address);
        $('#passing_to_road').text(to_address);
        $('#road_add_choice').show();});
      $('#dop_road_adding').click(function(){$('#road_add_choice').show();});
      $('#passing_road_add').click(function(){
        passing_road_added=true;
        $('#road_add_choice').hide();
        passing_road_add();
        road_add();
      });
      $('#id_cargo_type').val($('#goods_type_select :selected').text());
      $('#order_send_button').click(function(){
        $('#order_send').click();
      });
      $('#road_choice_exit').click(function(){$('#road_add_choice').hide();});
      $('#passing_road_add').click(function(){passing_road_added=true;});
      $('#road_del').click(function(){ del_road()});
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
        });
      $('#from_address').on('change', function() {
          from_address=$('#from_address').val();
        });
      $('#to_address').on('change', function() {
          to_address=$('#to_address').val();
          $('#id_to_address').val(to_address);
        });
  });
  function order_next_list(){
    available_list();
    order_list_count+=1;
    // if(available_lists.indexOf(order_list_count)!=-1){
      $('#order_progress').val(order_list_count);
      if(order_list_count>=2 & order_list_count<=4){$('#order_back_list').show()} else $('#order_back_list').hide();
      if(order_list_count>=4){$('#order_next_list').hide()} else $('#order_next_list').show();
      if(order_list_count==4){$('#order_send_button').show(); final_list();} else $('#order_send_button').hide();
      $('.list').hide();
      $('.list_head').hide();
      $('.mb_list_head').hide(); 
      $('#list_'+order_list_count).show();
      console.log($('#list_head_'+order_list_count).show());
      $('#list_head_'+order_list_count).show();
      $('#mb_list_head_'+order_list_count).show();
    // }
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
    if((from_address!='') && (to_address!='') || ((passing_road_added & from_address!='') || (passing_road_added & to_address!=''))){
      $(document).css('overflow-y','hidden');
      roads_counter++;
      $('.roads').append('<button class="road_button" id="road_'+roads_counter+'" onclick="roads_transition(this)">'+roads_counter+'</button>');
      last_road=$('.road_button').last().attr('id');
      if(passing_road_added){
        if(passing_roads_info.includes(transition_number)){
          full_road.push({from:[from_address],to:[to_address], passing_to:full_road[transition_number-1].passing_to});
        } else
        full_road.push({from:[from_address],to:[to_address], passing_to: transition_number});
        from_address='';
        to_address='';
        passing_road_added=false;
      }
      else{
        full_road.push({from:[],to:[]});
        $('#from_address').val('');
        $('#to_address').val('');
        from_address='';
        to_address='';
      }
      $('#road_'+roads_counter).click();
      transition_number=roads_counter;
      console.log(full_road);
  }
  }
  function passing_road_add(){
    if(passing_road_added){
      let passing_type='';
      if($('#passing_from_road').is(':checked')){
        $('#from_address').val(from_address);
        passing_type = 'from';
        $('#to_address').val(''); to_address='';
      }
      if($('#passing_to_road').is(':checked')){
        $('#to_address').val(to_address);
        passing_type = 'to';
        $('#from_address').val(''); from_address='';
      }
      passing_roads_info.push(transition_number+1);
    }
  }
  function del_road(){
    let last_full_road=full_road;
    full_road[transition_number-1].from[0]=last_full_road[transition_number].from[0];
    full_road[transition_number-1].to[0]=last_full_road[transition_number].to[0];
    for (let i=transition_number; i<=roads_counter-1; i++){
      full_road[i-1].from[0]=last_full_road[i].from[0];
      full_road[i-1].to[0]=last_full_road[i].to[0];
    }
    $('#road_'+transition_number).remove();
    console.log(full_road);
    transition_number--;  
    $('#road_'+transition_number).click();
    roads_counter--;
    $('.road_button').remove();
    for (let n = 1; n <= roads_counter; n++){
      $('.roads').append('<button class="road_button" id="road_'+n+'" onclick="roads_transition(this)">'+n+'</button>');
    }
  }
  function roads_transition(obj){
    button_id=obj.id;
    $('.road_button').css({
      'background' : 'none',
      'background-color' : 'none',
      'color' : 'white'
    });
    $('#'+obj.id).css({
      'background-color' : 'white',
      'color' : '#0085ff'
  });
    transition_number=parseInt(button_id.replace('road_',''));
    $('#from_address').val(full_road[transition_number-1].from);
    $('#to_address').val(full_road[transition_number-1].to);
  }

  function road_change(){
      from_address=$('#from_address').val();
      to_address=$('#to_address').val();
      full_road[transition_number-1].from[0]=from_address;
      full_road[transition_number-1].to[0]=to_address;
      console.log(transition_number-1);
  }

  function final_list(){
    $('#id_full_road').val('');
    $('#full_road option').remove();
    full_road_price=0;
    order_price=0;
    let roads_price='';
    if(full_road.from!='' & full_road.to!=''){
      for (let n = 0; n <= roads_counter-1; n++){
        from_address=full_road[n].from[0];
        to_address=full_road[n].to[0];
        passing_to=full_road[n].passing_to;
        roads_price=roads_price+n+')'+road_price()+';';
        full_road_price+=road_price();
        $('#full_road').append('<option name="from" id="address_from_'+n+'">'+from_address+'</option>');
        $('#full_road').append('<option name="to" id="address_to_'+n+'">'+to_address+'</option>');
        $('#id_from_address').val($('#id_from_address').val()+full_road[n].from);
        $('#id_to_address').val($('#id_to_address').val()+full_road[n].from);
        $('#id_full_road').val($('#id_full_road').val()+'['+n+']'+'from:'+full_road[n].from[0]+';to:'+full_road[n].to[0]+';passing_to:'+ full_road[n].passing_to+';/');
      }
    }
    $('#road_full_price').text(full_road_price+' р');
    loader_count=$('#id_loader_count').val();
    loader_time=$('#id_loader_time_count').val();
    type_price=parseInt($('#goods_type_select :selected').val());
    loader_price=(loader_count*loader_time)*350;
    order_price=full_road_price+loader_price+type_price;
    $('#id_prices').val(full_road_price+'/'+roads_price+'/type_price:'+type_price+'/loader_price:'+loader_price+'/');
    $('#loader_price').text(loader_price+' р');
    $('#loader_count').text(loader_count+' чел.');
    $('#loader_time').text(loader_time+' час.');
    $('#id_order_price').val(order_price);
    $('#type_full_price').text(type_price+' р')
    $('#order_price').text(order_price+'р');
    
    // type_add();
  }

  function road_price(){
      for(var i = 0, l = $('#city_price tr').length; i <= l; i++){
        let city_name1 = $('#city_price tr').eq(i).find('td').eq(1).text();
        let city_name2 = $('#city_price tr').eq(i).find('td').eq(2).text();
        console.log(to_address);
        if(((to_address.includes(city_name1) & from_address.includes(city_name2)) || (from_address.includes(city_name1) & to_address.includes(city_name2))) & ((city_name1!='') & (city_name2!=''))){
          current_road_price=parseInt($('#city_price tr').eq(i).find('td').eq(4).text());
          if(passing_to!=0){
            current_road_price/=2;
          }
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
    // console.log(full_type.type[1]);
    }
  }

  function available_list(){
    if((full_road.from!='') | (full_road.to!='')){  
      // console.log(available_lists.indexOf(2));
      if(available_lists.indexOf(2)==-1) available_lists.push(2);
      else if(available_lists.indexOf(3)==-1) available_lists.push(3);
      else if(available_lists.indexOf(4)==-1) available_lists.push(4);
      console.log(available_lists);
    }
  }

  function order_detail(){
    roads_counter=0;
    full_road = [{from:[],to:[],passing_to:0}];
    let full_road_info=$('#full_road_info').text();
    let order_status = $('#order_status').text();
    if(order_status==0) $('#order_status').text('Ожидается');
    if(order_status==1) $('#order_status').text('Выполнено');
    if(order_status==-1) $('#order_status').text('Откланено');
    console.log(full_road_info);
    for (let i = 0; i < full_road_info.length; i++){ // Количество дорог
      if(full_road_info[i] === '/') roads_counter++;
    }
    for (let n = 0; n < roads_counter; n++) {
      let road = full_road_info.substr(0,full_road_info.indexOf('/'));
      road = road.replace('[','');
      road = road.replace(']','');
      road_num = road.substr(0,1);
      road = road.replace(road_num,'');
      let road_from = road.substr(0,road.indexOf(';'));
      road=road.replace(road_from, '');
      road = road.replace(';','');
      let road_to = road.substr(0,road.indexOf(';'));
      road=road.replace(road_to, '');
      road = road.replace(';','');
      let road_passing_to = road.substr(0,road.indexOf(';'));
      road_passing_to = parseInt(road_passing_to.replace('passing_to:',''));
      road=road.replace(road_passing_to, '');
      road = road.replace(';','');
      console.log(road_from);
      console.log(road_to);
      console.log(road_passing_to);
      road=full_road_info.substr(0,full_road_info.indexOf('/'));
      full_road_info=full_road_info.replace(road+'/','');
      $('.roads').append('<label>'+road_from+'</label><br>');
      $('.roads').append('<label>'+road_to+'</label><br>');
    }
    let prices = $('#prices').text();
    let roads_prices=[];
    full_road_price=parseInt(prices.substr(0,prices.indexOf('/')));
    prices = prices.replace(full_road_price+'/','');
    $('#full_road_price').text(full_road_price+' руб.');
    console.log(prices);
    for (let l = 0; l < roads_counter; l++){
      prices=prices.replace(prices.substr(0,prices.indexOf(')')+1),'');
      console.log(prices);
      current_road_price=parseInt(prices.substr(0,prices.indexOf(';')));
      prices = prices.replace(current_road_price+';','');
      roads_prices.push(current_road_price);
      // roads_prices.push(parseInt(prices.substr('')))
    }
    prices = prices.replace('/type_price:','');
    type_price = parseInt(prices.substr(0,prices.indexOf('/')));
    prices = prices.replace(type_price+'/','');
    prices = prices.replace('loader_price:','');
    loader_price = parseInt(prices.substr(0,prices.indexOf('/')));
    prices = prices.replace(loader_price+'/','');
    $('#type_price').text(type_price+' руб.');
    $('#loader_price').text(loader_price+' руб.');
  }