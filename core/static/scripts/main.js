top=$(document).scrollTop();
$(document).ready(function (){
    $('#view_password').click(function(){view_password()});    
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