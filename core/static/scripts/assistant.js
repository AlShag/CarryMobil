let user_name='Пользователь';
let assistant_message='';
let user_last_message='';
let order_steps=1;
let order_instruction_is=false;
$(document).ready(function (){
    $('#user-message-sent').click(function(){
        user_to_assistant_message();
     });
    $('#take_off_instruction').click(function(){
        order_instruction_is=false;
     });
    $('#take-order-assistant').click(function(){
        order_instruction_is=true;
        $('#user-assistant-text').val('Оформи заказ');
        $('#user-message-sent').click();
        order_instruction();
        $('#user-variable').empty();
        $('#user-variable').append('<span id="next_order_instruction" onclick="order_instruction();">Далее</span><span id="back_order_instruction" onclick="order_steps--;order_instruction();">Назад</span><span id="take_off_instruction">Завершить</span>');
     });
});
function user_to_assistant_message(){
    user_last_message=$('#user-assistant-text').val();
    $('#user-assistant-dialog').append('<div class="user-message"><label>'+user_name+'</label><p>'+user_last_message+'</p></div>');
    var block = document.getElementById("user-assistant-dialog");
    block.scrollTop = 9999;
    $('#user-assistant-text').val('');
}
function assistant_to_user_message(){
    $('#user-assistant-dialog').append('<div class="assistant-message"><label>Ассистент</label><p>'+assistant_message+'</p></div>');
    var block = document.getElementById("user-assistant-dialog");
    block.scrollTop = 9999;
}
function order_instruction(){
    console.log(order_steps);
    if(order_instruction_is){
        if(order_steps==1){
            assistant_message='Для начала заполните поля Откуда и Куда. Откуда - пункт отправления груза. Куда - пункт отправки груза.'
            assistant_to_user_message();
            $('#from_address').click();
            order_steps++;
        } else if(order_steps==2){
            assistant_message='Заполните поле "Дата отправки" для того чтобы, мы отправили транспорт в назначенное вами время.'
            assistant_to_user_message();
            order_steps++;
        } else if(order_steps==3){
            if(transition_number!=2){
                $('#order_next_list').click();
            }   order_steps++;
                assistant_message='Далее выберите тип перевозимого груза'
                assistant_to_user_message();
            }
         else if(order_steps==4){
            console.log(transition_number);
            if(transition_number!=3){
                $('#order_next_list').click();
                order_steps++;
            }
            assistant_message='Если вы нуждаетесь в услугах грузчиков, выберите количество грузчиков и при необходимости время работы.'
            assistant_to_user_message();
        } else if(order_steps==5){
            if(transition_number!=4){
                $('#order_next_list').click();
                order_steps++;
                $('#user-variable').empty();
                $('#user-variable').append('<span id="send_order_instruction" onclick="$(`#order_send_button`).click();">Отправить</span><span id="back_order_instruction" onclick="order_steps--;order_instruction();">Назад</span><span id="take_off_instruction">Завершить</span>');    
            }
            assistant_message='Мы подошли к конечной странице, заполните поле номера телефона, чтобы мы смогли с вами связаться.'
            assistant_to_user_message();
            } else if (order_steps==6){
            if(transition_number==4){
            $('#send_order_instruction').click();
            order_steps++;
        }
    }
    }
}