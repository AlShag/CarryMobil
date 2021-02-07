top=$(document).scrollTop();
let slide_id='';
let last_slide='';
let swiper=false;
$(document).ready(function (){
    last_slide=$('.slider input[type="radio"][name="advan_slider"]').last().attr('id');
    $('#view_password').click(function(){view_password()});
    $('#left_slide').click(function(){left_slide()});
    $('#right_slide').click(function(){right_slide()});
    $('#to_up').click(function(){$(document).scrollTop(0)});
    $('#show_nawmenu').click(function(){
        if($('.navmenu').css('right')!=($(document).width()/100*25)+'px'){$('.navmenu').addClass('showed');} else{$('.navmenu').removeClass('showed');};
    });
    if($(window).width() < 768) {
        on_mobile();
    }
});
$(document).scroll(function (){
   let top=$(document).scrollTop();
    if(top>1000){$('#to_up').show()} else $('#to_up').hide();
});
jQuery('.slider').swipe({});
function view_password(){
    if($('#view_password').is(':checked')){
        $('#id_password').attr('type','text');
        $('#id_password1').attr('type','text');
        $('label[for="view_password"] img').attr('src','/static/images/login/novisibility.svg');
    } else {
        $('#id_password').attr('type','password');
        $('#id_password1').attr('type','password');
        $('label[for="view_password"] img').attr('src','/static/images/login/visibility.svg');
    }
}
function left_slide(){
    slide_id=$('.slider input[type="radio"][name="advan_slider"]:checked').attr('id');
    slide_count=parseInt(slide_id.replace('advan_',''));
    if(slide_id!='advan_1'){
        slide_count--;
        $('#advan_'+slide_count).prop('checked', true);
        $('.advan').removeClass('slided');
        $('#advan'+slide_count).addClass('slided');
    }
    else $('#advan_4').prop('checked', true);
}

function right_slide(){
    slide_id=$('.slider input[type="radio"][name="advan_slider"]:checked').attr('id');
    slide_count=parseInt(slide_id.replace('advan_',''));
    if(slide_id!=last_slide){
        slide_count++;
        $('#advan_'+slide_count).prop('checked', true);
    }
    else $('#advan_1').prop('checked', true);
}

function on_mobile(){
    jQuery('.slider').swipe({
        swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
            console.log(direction);
            if(direction=='right') left_slide();
            if(direction=='left') right_slide();
        }
    });
    jQuery('body').swipe({
        swipe:function(event, direction, distance, duration, fingerCount, fingerData){
            console.log(fingerData);
            console.log(duration);
            console.log(fingerData[0].start['x']);
            console.log()
            if(($('.navmenu').css('right')>'25%') & (direction=='right') & (fingerData[0].start['x']<=100))$('.navmenu').addClass('showed');
            if(($('.navmenu').css('display')=='block') & (direction=='left') & (duration>150))$('.navmenu').removeClass('showed');
        }
    });
}   