
spr_cont();
//加载游戏数据
global.map_name='四国争';
fileid = file_text_open_read(working_directory+"/gamemap/"+global.map_name+".cmap");
global.game_json=file_text_read_string(fileid);
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


//----------------------------------------------------------房间设定
global.gamingroom=room_add();
room_set_width(global.gamingroom,global.ROW*50);
room_set_height(global.gamingroom,global.COL*50);
room_set_persistent(global.gamingroom,false);
room_set_background_colour(global.gamingroom, c_purple, true);
//--------------------------------------------------------位置信息放置
for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        global.game_map[i,j]=ds_list_find_value(global.map_info,i*global.ROW+j);
        global.pieces[i,j]=ds_list_find_value(global.pieces_info,i*global.ROW+j);
        global.board[i,j]=ds_list_find_value(global.board_info,i*global.ROW+j);
        global.county[i,j]=ds_list_find_value(global.county_info,i*global.ROW+j);
    }
}

for(i=0;i<global.player_number;++i){
    for(j=0;j<8;j++){
        global.player[i,j]=ds_list_find_value(global.player_info,i*global.player_number+j);
    }
}

for(i=0;i<8;++i){
    global.player_side[i]=ds_list_find_value(global.side_info,i);
}



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
    global.gamer[i]=room_instance_add(global.gamingroom,global.ROW*50,global.COL*50+i*75,obj_gamer);
}
room_instance_add(global.gamingroom,200,200,obj_ready);
room_instance_add(global.gamingroom,200,400,obj_cancel);
room_goto(global.gamingroom);


scp_host();






