///scr_received_packet(buffer);
var buffer = argument[0];// 1, 100, 120

message_id = buffer_read(buffer, buffer_u8);
switch(message_id){
    case global.NEWPLAYER:scr_new_player(buffer);break;
    case global.MARKPLAYER:scr_client_gaming(buffer);break;
    case global.READYROOM:scr_ready_room(buffer);break;
    case global.READYINFO:scr_ready_info(buffer);break;
    case global.PLAYERREADY:scr_ready(buffer);break;
    case global.PLAYERCANCELREADY:scr_ready_cancel(buffer);break;
    case global.GAMESTART:scr_gaming(buffer);break;
    case global.MOVE:scr_move(buffer);break;
    case global.EAT:scr_eat(buffer);break;
    case global.NEXT:scr_next(buffer);break;
}

