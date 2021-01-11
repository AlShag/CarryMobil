top=$(document).scrollTop();
let order_list_count=1;
$(document).ready(function (){
    $('#view_password').click(function(){view_password()});
    $('#order_next_list').click(function(){order_next_list()});
    $('#order_back_list').click(function(){order_back_list()});
    $('#id_gruz_type').val($('#goods_type_select :selected').text());
    $('#order_send_button').click(function(){$('#order_send').click();});
    $('#goods_type_select').on('change', function() {
        result = $('#goods_type_select :selected').text();
        $('#id_gruz_type').val(result);
      });
    $('#from_adress').on('change', function() {
        $('#id_from_adress').val($('#from_adress').val());
      });
    $('#to_adress').on('change', function() {
        $('#id_to_adress').val($('#to_adress').val());
      });
});
$(document).scroll(function (){
   let top=$(document).scrollTop();
    if(top>1000){$('.to_up').show()} else $('.to_up').hide();
});
function view_password(){
    if($('#view_password').is(':checked')){
        $('#id_password').attr('type','text');
        $('label[for="view_password"] img').attr('src','/static/images/login/novisibility.svg');
    } else {
        $('#id_password').attr('type','password');
        $('label[for="view_password"] img').attr('src','/static/images/login/visibility.svg');
    }
}
function order_next_list(){
    order_list_count+=1;
    if(order_list_count>=2 & order_list_count<=4){$('#order_back_list').show()} else $('#order_back_list').hide();
    if(order_list_count>=4){$('#order_next_list').hide()} else $('#order_next_list').show();
    if(order_list_count==4){$('#order_send_button').show()} else $('#order_send_button').hide();
    if(order_list_count==5){$('#to_main').show()} else $('#to_main').hide();
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
    if(order_list_count==5){$('#to_main').show()} else $('#to_main').hide();
    $('.list').hide();
    $('.list_head').hide(); 
    $('#list_'+order_list_count).show();
    $('#list_head_'+order_list_count).show();
}