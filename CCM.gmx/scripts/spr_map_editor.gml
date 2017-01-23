global.map_name=get_string("请输入地图名称","NewMap");
global.ROW=get_integer("请输入棋盘宽度",9);
global.COL=get_integer("请输入棋盘高度",10);
global.player_number=get_integer("请输入玩家人数",2);
global.gameroom=room_add();
room_set_width(global.gameroom,global.ROW*50);
room_set_height(global.gameroom,global.COL*50);
room_set_persistent(global.gameroom,false);
room_set_background_colour(global.gameroom, c_black, true);

global.draw_type=0;
global.mune_width=150;
global.screen_move_speed=10;
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

global.aim=room_instance_add(global.gameroom,global.ROW*25,global.COL*25,obj_aim);
//----------------------------------------------------------全局GUI-------------------------------------------
room_instance_add(global.gameroom,global.ROW*25,global.COL*25,obj_edit_gui);

//------------------------------------------------------默认数据信息生成---------------------------------------
for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        global.board[i,j]=1;
    }
}

scp_com_map();


//--------------------------------------------------------显示设置------------------------------------------------
 display_set_gui_size(global.window_width,global.window_height);
//window_set_size(display_get_gui_width(),display_get_gui_height());
//surface_resize(application_surface,display_get_gui_width(),display_get_gui_height());
room_set_view(global.gameroom, 0, true, global.ROW*50, global.COL*50, global.window_width,global.window_height, 0, 0, global.window_width,global.window_height, 8*50, 8*50, 4, 4, -1);
room_set_view(global.gameroom, 1, true, 0, 0, global.view_width, global.view_height,global.mune_width+global.margin_width, global.margin_height, global.view_width, global.view_height, 8*50, 8*50, 10, 10, obj_aim);
//room_set_view(global.gameroom, 1, true, 0, 0, global.ROW*50, global.COL*50, 0, 0, global.ROW*50, global.COL*50, 8*50, 8*50, 4, 4, -1);
room_set_view_enabled( global.gameroom, true );
room_goto(global.gameroom);
