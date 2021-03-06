#define scr_received_packet
///scr_received_packet(buffer);
var buffer = argument[0];// 1, 100, 120

message_id = buffer_read(buffer, buffer_u8);
switch(message_id){
    case global.NEWPLAYER:scr_new_player(buffer);break;
    case global.NEWPLAYER2:scr_new_player2(buffer);break;
    case global.JOINNETROOM:scr_new_net_player(buffer);break;
    case global.JIONROOM:scr_new_player(buffer);break;
    case global.NET_MARKPLAYER:scr_select_room(buffer);break;
    case global.MARKHOST:scr_new_behost(buffer);break;
    case global.MARKPLAYER:scr_client_gaming(buffer);break;
    case global.READYROOM:scr_ready_room(buffer);break;
    case global.READYINFO:scr_ready_info(buffer);break;
    case global.PLAYERREADY:scr_ready(buffer);break;
    case global.PLAYERCANCELREADY:scr_ready_cancel(buffer);break;
    case global.GAMESTART:scr_gaming(buffer);break;
    case global.MOVE:scr_move(buffer);break;
    case global.EAT:scr_eat(buffer);break;
    case global.NEXT:scr_next(buffer);break;
    
    case global.ROOMHOST_CREAT:scr_net_room_has_set(buffer);break;
}


#define scr_new_net_player

//------------------------------------------------------------------------
spr_cont();
var buffer = argument[0];
global.mine=buffer_read(buffer,buffer_u8);
global.game_info=json_decode(global.game_json);
global.map_name=ds_map_find_value(global.game_info,"map_name");
global.ROW=ds_map_find_value(global.game_info, "ROW");
global.COL=ds_map_find_value(global.game_info, "COL");
global.player_number=ds_map_find_value(global.game_info, "player_number");
global.map_info=ds_map_find_value(global.game_info, "map_info");
global.board_info=ds_map_find_value(global.game_info, "board_info");
global.pieces_info=ds_map_find_value(global.game_info, "pieces_info");
global.county_info=ds_map_find_value(global.game_info, "county_info");
global.player_info=ds_map_find_value(global.game_info, "player_info");
global.side_info=ds_map_find_value(global.game_info, "side_info");


for(i=0;i<global.player_number;i++){
    global.player_status[i]=0;
}
global.player_status[global.mine]=1;


//----------------------------------------------------------房间设定
global.gamingroom=room_add();
room_set_width(global.gamingroom,global.ROW*50);
room_set_height(global.gamingroom,global.COL*50);
room_set_persistent(global.gamingroom,false);
room_set_background_colour(global.gamingroom, c_purple, true);
//--------------------------------------------------------位置信息放置
for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        global.game_map[i,j]=ds_list_find_value(global.map_info,i*global.COL+j);
        global.pieces[i,j]=ds_list_find_value(global.pieces_info,i*global.COL+j);
        global.board[i,j]=ds_list_find_value(global.board_info,i*global.COL+j);
        global.county[i,j]=ds_list_find_value(global.county_info,i*global.COL+j);
    }
}

for(i=0;i<global.player_number;i++){
    for(j=0;j<8;j++){
        global.player[i,j]=ds_list_find_value(global.player_info,i*8+j);
    }
}

for(i=0;i<8;i++){
    global.player_side[i]=ds_list_find_value(global.side_info,i);
}

NORTH=0;
SOUNTH=0;
EAST=0;
WEST=0;
for(i=0;i<8;i++){
    if(global.player[global.mine,i]==1){
        switch(global.player_side[i]){
            case global.SOUNTH:SOUNTH++;break;
            case global.WEST:WEST++;break;
            case global.NORTH:NORTH++;break;
            case global.EAST:EAST++;break;
        }
    }
}
temp=SOUNTH
global.LOC_SIDE=global.SOUNTH;
if(WEST>temp){
    temp=WEST;
    global.LOC_SIDE=global.WEST;
}

if(NORTH>temp){
    temp=NORTH;
    global.LOC_SIDE=global.NORTH;
}

if(EAST>temp){
    temp=EAST;
    global.LOC_SIDE=global.EAST;
}
global.tn=NORTH;
global.ts=SOUNTH;
global.tw=WEST;
global.te=EAST;


//目标文件，内含触发事件
global.aim=room_instance_add(global.gamingroom,global.ROW*25,global.COL*25,obj_aim);
//--------------------------------------------------------设置游戏相机-------------------------------------
if(global.window_width-global.mune_width>global.ROW*50){
    global.view_width=global.ROW*50;
    global.margin_width=((global.window_width-global.mune_width)-global.ROW*50)/2;
}else{
    global.view_width=global.window_width-global.mune_width;
    global.margin_width=0;
}

if(global.window_height>global.COL*50){
    global.view_height=global.COL*50;
    global.margin_height=((global.window_height)-global.COL*50)/2;
}else{
    global.view_height=global.window_height;
    global.margin_height=0;
}
//----------------------------------------------------------全局GUI-------------------------------------------
room_instance_add(global.gamingroom,global.ROW*25,global.COL*25,obj_edit_gui);

//--------------------------------------------------------显示设置------------------------------------------------
display_set_gui_size(global.window_width,global.window_height);
room_set_view(global.gamingroom, 0, true, global.ROW*50+global.mune_width,global.COL*50, global.window_width,global.window_height, 0, 0, global.window_width,global.window_height, 8*50, 8*50, 4, 4, -1);
room_set_view(global.gamingroom, 1, true, 0, 0, global.view_width, global.view_height,global.mune_width+global.margin_width, global.margin_height, global.view_width, global.view_height, 8*50, 8*50, 10, 10, obj_aim);
room_set_view(global.gamingroom, 2, true, global.ROW*50, global.COL*50, global.mune_width, global.window_height,0, 0, global.mune_width, global.window_height, 8*50, 8*50, 10, 10, -1);
room_set_view_enabled(global.gamingroom,true);

//---------------------------------------------玩家状态栏-----------------------------------------------------------


//生成棋谱
for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        draw_sprite_part(spr_bg,-1,(global.game_map[i,j]%9)*50, int64( (global.game_map[i,j]/9))*50, 50, 50,i*50,j*50);
    }
}
global.gamer_id=0;
for(i=0;i<global.player_number;++i){
    //玩家状态
    if(i=global.mine){
        room_instance_add(global.gamingroom,global.ROW*50+100,global.COL*50+i*75+25,obj_ui_ready);
    }
    
    global.gamer[i]=room_instance_add(global.gamingroom,global.ROW*50,global.COL*50+i*75,obj_ui_status);
}
//room_instance_add(global.gamingroom,200,200,obj_ready);
room_instance_add(global.gamingroom,200,400,obj_client);
//room_instance_add(global.gamingroom,200,400,obj_cancel);
room_goto(global.gamingroom);
scr_change_view();

var size = 1024;
var type = buffer_fixed;
var alignment = 1;
buffer=buffer_create(size,type,alignment);
    buffer_seek(buffer,buffer_seek_start,0);
    buffer_write(buffer,buffer_u8,global.READYROOM);
    buffer_write(buffer,buffer_u8,global.map_id);
    network_send_packet(global.client_socket,buffer,buffer_tell(buffer));
    buffer_delete(buffer);
    
    
    
   /*
 buffer=buffer_create(size,type,alignment);
    buffer_seek(buffer,buffer_seek_start,0);
    buffer_write(buffer,buffer_u8,global.NEWPLAYER2);
    buffer_write(buffer,buffer_string,global.username);
    network_send_packet(global.client_socket,buffer,buffer_tell(buffer));
    buffer_delete(buffer);
    */