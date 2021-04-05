  let order_list_count=1;
  let cargo_type='';
  let city_name1='';
  let city_name2='';
  let roads_counter=1;
  let from_address='';
  let to_address='';
  to_address='';
  let current_road_price=0;
  let full_road = [{from:[],to:[],passing_to:0}];
  let passing_road = [{type:'',road: 0,in_road:[]}];
  let passing_roads_info = [];
  let full_type = {type:[],options:[],comment:[]}
  let transition_number=1;
  let transition_road = 0;
  let button_id='';
  let full_road_price=0;
  let cargo_weight=0;
  let order_price=0;
  let loader_count=0;
  let loader_time=0;
  let loader_price=0;
  let type_price=0;
  let type_conf_price=0;
  let available_lists=[1];
  let last_road='';
  let dop_road_added=false;
  let passing_road_added=false;
  let edding_form = false;
  let passing_to=0;
  let passing_type='';
  let not_accurate_price=false;
  let status_value=[];
  let intercity_price=[];
  let filter_cargo_type='';
  let filter_date1=$('#filter_date1').val();
  let filter_date2=$('#filter_date2').val();
  $(document).ready(function (){
      $('#order_next_list').click(function(){order_next_list()});// Переходы по order
      $('#order_back_list').click(function(){order_back_list()});
      $('#add_dop_road').click(function(){// Добавление доп. маршрута
        $('#passing_from_road').text(from_address);
        $('#passing_to_road').text(to_address);
        $('#road_add_choice').show();});
      $('#dop_road_adding').click(function(){passing_road_added=false;$('#road_add_choice').hide();road_add();});
      $('#passing_road_add').click(function(){
        passing_road_added=true;
        $('#road_add_choice').hide();
        passing_road_add();
        road_add();
      });
      
      $('#order_send_button').click(function(){//Отправка order
        if($('#user_accord').is(':checked')){
        $('.type_info').remove();
        $('#order_send').click();
        } else alert('Для отправки заявки необходимо согласие на обработку персональных данных');
      });
      $('#road_choice_exit').click(function(){$('#road_add_choice').hide();});
      $('#passing_road_add').click(function(){passing_road_added=true;});
      $('#road_del').click(function(){ del_road()});

      $('#cancel_order').click(function(){ $('#id_status').val(-1);});// order status change
      $('#order_enable').click(function(){ $('#id_status').val(1);});
      $('#order_complite').click(function(){ $('#id_status').val(2);});
      $('#add_changes').click(function(){add_order_changes();$('#send_order_changes').click()});
      $('#changing_add_new_road').click( function(){add_roads_field(this)});
      $('#create_order').click( function(){add_order_changes();$('#form_send').click();});

      $('#filter_cancel').click(function(){// отмена  фильтра 
        $('#type_filter option:first').prop('selected', true);
        $('#filter_date1').val('');
        $('#filter_date2').val('');
        $('.filter_value input[name="status"]').prop('checked', false);
        orders_filter(this);
        });
      $('#from_address').on('change', function(){road_change();});//Изменение маршрута
      $('#to_address').on('change', function(){road_change();});
      $('.roads input').on('change', function(){edit_road_change(this);});
      $('.filter_value input').on('change', function(){orders_filter(this)});
      $('#type_filter').on('change', function(){orders_filter(this)});
      $('#is_passing_road').on('change', function(){
        if($('#is_passing_road').is(':checked')){
          
          full_road_price=full_road_price/2;
          order_price=full_road_price+loader_price+type_price;
          $('#id_prices').val(order_price+'/'+full_road_price+'/type_price:'+type_price+'/loader_price:'+loader_price+'/');
          $('#road_full_price').text(full_road_price+' р');
          $('#order_price').text(order_price+'р');
        } else{
          full_road_price=full_road_price*2;
          order_price=full_road_price+loader_price+type_price;
          $('#id_prices').val(order_price+'/'+full_road_price+'/type_price:'+type_price+'/loader_price:'+loader_price+'/');
          $('#road_full_price').text(full_road_price+' р');
          $('#order_price').text(order_price+'р');
        }
      });

      $('#goods_type_select').on('change', function(){
          $('#goods_type_select').blur();
          result = $('#goods_type_select :selected').text();
          $('.for_type').hide();
          let option_class = $('#goods_type_select :selected').attr('class');
          if(option_class!='' & option_class!='None'){
            $('.for_type').show();
          } else {$('.for_type').hide();}
          if (option_class=='other') $('#cargo_name').show(); else $('#cargo_name').hide();
          $('#id_cargo_type').val(result);
          cargo_type=result;
          $('#full_cargo_type').val(cargo_type);
        });

      $('.cargo_value').on('change', function(){
        cargo_change();
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

    if(available_lists.indexOf(order_list_count+1)!=-1){
      order_list_count++;
      $('#order_progress').val(order_list_count);
      if(order_list_count>=2 & order_list_count<=4){$('#order_back_list').show()} else $('#order_back_list').hide();
      if(order_list_count>=4){$('#order_next_list').hide()} else $('#order_next_list').show();
      if(order_list_count==4){$('#order_send_button').show(); final_list();} else $('#order_send_button').hide();
      $('.list').hide();
      $('.list_head').hide();
      $('.mb_list_head').hide(); 
      $('#list_'+order_list_count).show();

      $('#list_head_'+order_list_count).show();
      $('#mb_list_head_'+order_list_count).show();
    }
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
        passing_road_added=false;
      }
      else{
        full_road.push({from:[''],to:[''],passing_to:0});
        $('#from_address').val('');
        $('#to_address').val('');
        from_address='';
        to_address='';
      }
      $('#road_'+roads_counter).click();
      transition_number=roads_counter;
      if($('#road_del').css('display')=='none') $('#road_del').show();
  }
  }
  function passing_road_add(){
    if(passing_road_added){
      if($('#passing_from_road').is(':checked')){
        $('#to_address').removeAttr('disabled');
        $('#from_address').val(from_address);
        $('#from_address').prop('disabled','true');
        passing_type = 'from';
        $('#to_address').val(''); to_address='';
      }
      if($('#passing_to_road').is(':checked')){
        $('#from_address').removeAttr('disabled');
        $('#to_address').val(to_address);
        $('#to_address').prop('disabled','true');
        passing_type = 'to';
        $('#from_address').val(''); from_address='';
      }
      passing_roads_info.push(transition_number+1);
    }
  }

  function del_road(){
    if(roads_counter>1){
      if(roads_counter!=transition_number){
        let last_full_road=full_road;
        full_road[transition_number-1].from[0]=last_full_road[transition_number].from[0];
        full_road[transition_number-1].to[0]=last_full_road[transition_number].to[0];
        for (let i=transition_number; i<=roads_counter-1; i++){
          full_road[i-1].from[0]=last_full_road[i].from[0];
          full_road[i-1].to[0]=last_full_road[i].to[0];
        }
        full_road.pop();
        $('#road_'+transition_number).remove();
        transition_number--;  
        $('#road_'+transition_number).click();
        roads_counter--;
        $('.road_button').remove();
        for (let n = 1; n <= roads_counter; n++){
          $('.roads').append('<button class="road_button" id="road_'+n+'" onclick="roads_transition(this)">'+n+'</button>');
        }
      } else{
        $('#road_'+transition_number).remove();
        full_road.pop();
        transition_number--;
        roads_counter--;
        $('#road_'+transition_number).click();
        road_change();
      }
      if(roads_counter<2){
        $('#road_del').hide();
      }
    }
  }
  function roads_transition(obj){
    button_id=obj.id;
    if($(window).width()>768){
      $('.road_button').css({
        'background' : 'none',
        'background-color' : 'none',
        'color' : 'white'
      });
      $('#'+obj.id).css({
        'background-color' : 'white',
        'color' : '#0085ff'
      });
    } else{
      $('.road_button').css({
        'background' : 'none',
        'background-color' : 'none',
        'color' : '#0085ff'
      });
      $('#'+obj.id).css({
        'background-color' : '#0085ff',
        'color' : 'white'
      });
    }
    transition_number=parseInt(button_id.replace('road_',''));
    $('#from_address').val(full_road[transition_number-1].from);
    $('#to_address').val(full_road[transition_number-1].to);
  }

  function road_change(){
      from_address=$('#from_address').val();
      to_address=$('#to_address').val();
      full_road[transition_number-1].from[0]=from_address;
      full_road[transition_number-1].to[0]=to_address;
  }

  function final_list(){
    $('#id_full_road').val('');
    $('#all_roads div').remove();
    full_road_price=0;
    order_price=0;
    intercity_price=[];
    let roads_price='';
    if(full_road.from!='' & full_road.to!=''){
      for (let n = 0; n <= roads_counter-1; n++){
        from_address=full_road[n].from[0];
        to_address=full_road[n].to[0];
        passing_to=full_road[n].passing_to;
        roads_price=roads_price+n+')'+road_price()+';';
        full_road_price+=road_price();
        if(passing_to==0){
          $('#all_roads').append('<div class="all_roads" id="id_road_'+(n+1)+'"><h4>Маршрут №'+(n+1)+':</h4>');
          $('#id_road_'+(n+1)).append('<span name="from" class="main_road" id="from_address_'+n+'">'+from_address+'</span><br>');
          $('#id_road_'+(n+1)).append('<span name="to" class="main_road" id="to_address_'+n+'">'+to_address+'</span><br></div>');
        } else{
          if(full_road[passing_to-1].from[0]!=from_address)$('#id_road_'+passing_to).append('<span name="from" class="passing_road" id="from_address_'+n+'">'+from_address+'</span><br>');
          if(full_road[passing_to-1].to[0]!=to_address)$('#id_road_'+passing_to).append('<span name="to" class="passing_road" id="to_address_'+n+'">'+to_address+'</span><br>');
        }
        $('#id_from_address').val($('#id_from_address').val()+full_road[n].from);
        $('#id_to_address').val($('#id_to_address').val()+full_road[n].from);
        $('#id_full_road').val($('#id_full_road').val()+'['+n+']'+'from:'+full_road[n].from[0]+';to:'+full_road[n].to[0]+';passing_to:'+ full_road[n].passing_to+';/');
      }
    }
    if(intercity_price.length>0){
      $('#order_express').show();
      $('label[for="order_express"]').show();
     } else{
      $('#order_express').hide();
      $('label[for="order_express"]').hide();
     }
    $('#road_full_price').text(full_road_price+' р');
    if(not_accurate_price) $('#road_full_price').text($('#road_full_price').text()+' - цена может отличаться');
    loader_count=$('#id_loader_count').val();
    loader_time=$('#id_loader_time_count').val();
    type_price=type_conf_price+parseInt($('#goods_type_select :selected').val());
    loader_price=(loader_count*loader_time)*400;
    if(full_road_price>=5000) $('.is_passing_road').show(); else $('.is_passing_road').hide();
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
        if(((to_address.includes(city_name1) & from_address.includes(city_name2)) || (from_address.includes(city_name1) & to_address.includes(city_name2))) & ((city_name1!='') & (city_name2!=''))){
          if(cargo_weight<1500)current_road_price=parseInt($('#city_price tr').eq(i).find('td').eq(4).text());
          else if(cargo_weight<3500){
            current_road_price=parseInt($('#city_price tr').eq(i).find('td').eq(4).text());
            type_conf_price=parseInt($('#city_price tr').eq(i).find('td').eq(5).text())-parseInt($('#city_price tr').eq(i).find('td').eq(4).text());
          }
          else if(cargo_weight<5000){
            current_road_price=parseInt($('#city_price tr').eq(i).find('td').eq(4).text());
            type_conf_price=parseInt($('#city_price tr').eq(i).find('td').eq(6).text())-parseInt($('#city_price tr').eq(i).find('td').eq(4).text());
          }
          if(passing_to!=0){
            current_road_price/=2;
          }
          i=l;
          if(city_name1!=city_name2) intercity_price.push(current_road_price);
        }
        else{
          current_road_price=0;
          not_accurate_price=true;
        }
      }
      return current_road_price;
    }

  function type_add(){
    if($('#goods_type_select :selected').text()){
    full_type.type.push($('#goods_type_select :selected').text());
    }
  }

  function available_list(){
    if(from_address!='' | to_address!=''){  
      if(available_lists.indexOf(2)==-1) available_lists.push(2);
      else if(available_lists.indexOf(3)==-1) available_lists.push(3);
      else if(available_lists.indexOf(4)==-1) available_lists.push(4);
    } else $('#warning_order_address').show();
  }

  function orders_filter(obj){
    let filter_name=obj.name;
    let date_filter=0;
    let dates_filter=0;
    if(filter_name=='status'){
      $('.filter_value input:checkbox').each(function(){
        if($(this).not(':checked')) status_value=[];
      });
      $('.filter_value input:checkbox:checked').each(function(){
        status_value.push($(this).val());
      });
    }
    if(filter_name=='type_filter'){
      filter_cargo_type=$('#type_filter option:checked').text();
    }
    if(filter_name=='date'){
      filter_date1=$('#filter_date1').val();
      filter_date2=$('#filter_date2').val();
    }
    if(filter_date1!=undefined | filter_date2!=undefined) dates_filter=1; else dates_filter=0;
    if(filter_name=='cancel'){
      filter_date1='';
      filter_date2='';
      status_value=[];
      filter_cargo_type='';
    }
    for(var i = 0, l = $('.orders_tr').length; i <= l; i++){
      let order_status = $('.orders_tr').eq(i).find('td').eq(6).text();
      let order_type=$('.orders_tr').eq(i).find('td').eq(4).text();
      let order_date=$('.orders_tr').eq(i).find('.order_start_time').text();
      order_date=(order_date.replace(/\s{2,}/g, ''));
      order_status=order_status.replace(/\s{2,}/g, '');
      order_type=(order_type.replace(/\s{2,}/g, ''));
      if (order_date!='')
        if((order_date>=filter_date1 & order_date<=filter_date2) || (order_date>=filter_date1 & filter_date2=='') || (filter_date1=='' & (order_date<=filter_date2 & filter_date2!=''))) date_filter=1;

      if((status_value.includes(order_status)) & (filter_cargo_type==order_type | $('#type_filter option:checked').val()=='all') & (date_filter))
        $('.orders_tr').eq(i).show();
      else if((status_value.includes(order_status)) & (date_filter) &(filter_cargo_type==''))// date and status
        $('.orders_tr').eq(i).show();
      else if((status_value.includes(order_status)) & (dates_filter==0) & (filter_cargo_type==order_type | $('#type_filter option:checked').val()=='all'))// status and type
        $('.orders_tr').eq(i).show();
      else if((date_filter) & (filter_cargo_type==order_type | $('#type_filter option:checked').val()=='all') & (status_value.length==0))// date and type
        $('.orders_tr').eq(i).show();
      else if((status_value.includes(order_status)) & (dates_filter==0) & (filter_cargo_type=='')) //status
        $('.orders_tr').eq(i).show();
      else if((status_value.length==0) & (date_filter) & (filter_cargo_type=='')) //date
        $('.orders_tr').eq(i).show();        
      else if((status_value.length==0) & (dates_filter==0) & (filter_cargo_type==order_type | $('#type_filter option:checked').val()=='all'))//type
        $('.orders_tr').eq(i).show();      
      else $('.orders_tr').eq(i).hide();
      if(filter_name=='cancel'){
        $('.orders_tr').eq(i).show();
      }
    }
  }

  function order_detail(){
    roads_counter=0;
    full_road = [{from:[],to:[],passing_to:0}];
    let full_road_info=$('#full_road_info').text();
    if($('#id_full_road').attr('type')=='text') full_road_info=$('#id_full_road').val();
    let order_status = $('#order_status').text();
    if(order_status==0) $('#order_status').text('Ожидается');
    if(order_status==1) $('#order_status').text('В процессе');
    if(order_status==2) $('#order_status').text('Выполнено');
    if(order_status==-1) $('#order_status').text('Откланено');
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
      road_from=road_from.replace('from:', '');
      road = road.replace(';','');
      let road_to = road.substr(0,road.indexOf(';'));
      road=road.replace(road_to, '');
      road_to=road_to.replace('to:', '');
      road = road.replace(';','');
      let road_passing_to = road.substr(0,road.indexOf(';'));
      road_passing_to = parseInt(road_passing_to.replace('passing_to:',''));
      road=road.replace(road_passing_to, '');
      road = road.replace(';','');
      road=full_road_info.substr(0,full_road_info.indexOf('/'));
      full_road_info=full_road_info.replace(road+'/','');
      if(n==0) full_road[0]={from:[road_from],to:[road_to],passing_to: road_passing_to};
      else full_road.push({from:[road_from],to:[road_to],passing_to: road_passing_to});
      if(!edding_form){
        if(road_passing_to==0){
          $('.roads').append('<div class="all_roads" id="id_road_'+(n+1)+'"><h4>Маршрут №'+(n+1)+':</h4>');
          $('#id_road_'+(n+1)).append('<span name="from" class="main_road" id="from_address_'+n+'">'+road_from+'</span><br>');
          $('#id_road_'+(n+1)).append('<span name="to" class="main_road" id="to_address_'+n+'">'+ road_to+'</span><br></div>');
        } else{
          if(full_road[passing_to].from[0]!=road_from)$('#id_road_'+(passing_to+1)).append('<span name="from" class="passing_road" id="from_address_'+n+'">'+road_from+'</span><br>');
          if(full_road[passing_to].to[0]!=road_to)$('#id_road_'+(passing_to+1)).append('<span name="to" class="passing_road" id="to_address_'+n+'">'+road_to+'</span><br>');
        }
      }
    }
    let prices = $('#prices').text();
    if($('#id_prices').attr('type')=='text') prices=$('#id_prices').val();
    let roads_prices=[];
    full_road_price=parseInt(prices.substr(0,prices.indexOf('/')));
    prices = prices.replace(full_road_price+'/','');
    $('#full_road_price').text(full_road_price+' руб.');
    for (let l = 0; l < roads_counter; l++){
      prices=prices.replace(prices.substr(0,prices.indexOf(')')+1),'');
      current_road_price=parseInt(prices.substr(0,prices.indexOf(';')));
      prices = prices.replace(current_road_price+';','');
      roads_prices.push(current_road_price);
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

  function order_edit_form(){
    edding_form=true;
    order_detail();
    for (let n = 0; n < roads_counter; n++) {
      from_address=full_road[n].from[0];
        to_address=full_road[n].to[0];
        passing_to=full_road[n].passing_to;
      if(passing_to==0){
        $('.roads').append('<div class="all_roads" id="id_road_'+(n+1)+'"><h4>Маршрут №'+(n+1)+':</h4>');
        $('#id_road_'+(n+1)).append('<input type="text" name="from" class="main_road" value="'+from_address+'" id="from_address_'+n+'"><br>');
        $('#id_road_'+(n+1)).append('<input type="text" name="to" class="main_road" value="'+to_address+'" id="to_address_'+n+'"></input><br></div>');
        $('#id_road_'+(n+1)).append('<input type="button" name="passing" id="passing_'+(n+1)+'" onclick="add_roads_field(this)" value="Добавить доп точку"><br>');
      } else{
          if(full_road[passing_to-1].from[0]!=from_address)$('#id_road_'+passing_to).append('<input type="text" name="from" value="'+from_address+'" class="passing_road" id="from_address_'+n+'"><br>');
          if(full_road[passing_to-1].to[0]!=to_address)$('#id_road_'+passing_to).append('<input type="text" name="to" value="'+to_address+'" class="passing_road" id="to_address_'+n+'"><br>');
      }
    }
  }

  function edit_road_change(obj){
    let input_id=(obj.id);
    if(obj.name=='from'){
      in_full_road=parseInt(input_id.replace('from_address_',''));
      full_road[in_full_road].from[0]=obj.value;
    }
    if(obj.name=='to'){
      in_full_road=parseInt(input_id.replace('to_address_',''));
      full_road[in_full_road].to[0]=obj.value;
    }
    from_address=$(obj).val();
    to_address=$(obj).val();
  }

  function add_order_changes(){
    $('#id_full_road').val('');
    for (let n = 0; n <= full_road.length-1; n++){
      $('#id_full_road').val($('#id_full_road').val()+'['+n+']'+'from:'+full_road[n].from[0]+';to:'+full_road[n].to[0]+';passing_to:'+ full_road[n].passing_to+';/');
    }
  }

  function add_roads_field(obj){
    let field_type=obj.name;
    if (field_type=='new'){
      from_address='';
      to_address='';
      road_passing_to=0;
      full_road[roads_counter]={from:[from_address],to:[to_address],passing_to: road_passing_to};
      $('.roads').append('<div class="all_roads" id="id_road_'+(roads_counter+1)+'"><h4>Маршрут №'+(roads_counter+1)+':</h4>');
      $('#id_road_'+(roads_counter+1)).append('<input type="text" name="from" placeholder="Откуда" class="main_road" onchange="edit_road_change(this)" value="'+from_address+'" id="from_address_'+roads_counter+'"><br>');
      $('#id_road_'+(roads_counter+1)).append('<input type="text" name="to" placeholder="Куда" class="main_road" onchange="edit_road_change(this)" value="'+to_address+'" id="to_address_'+roads_counter+'"></input><br></div>');
      roads_counter++;
    }
    if (field_type=='passing'){
      passing_to=parseInt(obj.id.replace('passing_',''));
      from_address=full_road[passing_to-1].from[0];
      to_address='';
      road_passing_to=0;
      full_road[roads_counter]={from:[from_address],to:[to_address],passing_to: passing_to};
      $('#id_road_'+(passing_to)).append('<input type="text" name="to" value="'+to_address+'" class="passing_road" onchange="edit_road_change(this)" id="to_address_'+(roads_counter)+'"><br>');
    }
  }

  function cargo_change(){
    $('#full_cargo_type').val(cargo_type);
    let cargo_length=$('#cargo_len_value').val();
    let cargo_height=$('#cargo_height_value').val();
    let cargo_width=$('#cargo_width_value').val();
    if(cargo_length>5 | cargo_height>2.25 | cargo_width>2.5) type_conf_price=300;
    cargo_weight=$('#cargo_weight_value').val();
    $('#id_cargo_type_comment').val('[Длина:'+cargo_length+';Высота:'+cargo_height+';Ширина:'+cargo_width+';Вес:'+cargo_weight+'');
    if($('#goods_type_select :selected').attr('class')=='other'){
      let cargo_name=$('#cargo_name_value').val();
      $('#id_cargo_type_comment').val(cargo_name+'[Высота:'+cargo_height+';Ширина:'+cargo_width+';Вес:'+cargo_weight+';]');
    }
  }