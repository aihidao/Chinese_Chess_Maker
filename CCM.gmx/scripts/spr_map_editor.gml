spr_cont();
global.map_name=get_string("请输入地图名称","NewMap");
global.ROW=get_integer("请输入棋盘宽度",9);
global.COL=get_integer("请输入棋盘高度",10);
while(global.player_number<2&&global.player_number>8){
    global.player_number=get_integer("请输入玩家人数(2~8)",2);
}
for(i=0;i<global.player_number;i++){
    global.player_side[i]=i%4;
    for(j=0;j<=8;j++){
        if(i==j){
            global.player[i,j]=1;
        }else{
            global.player[i,j]=0;
        }
    }
}

global.gameroom=room_add();
room_set_width(global.gameroom,global.ROW*50);
room_set_height(global.gameroom,global.COL*50);
room_set_persistent(global.gameroom,false);
room_set_background_colour(global.gameroom, c_black, true);



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

//目标文件，内含触发事件
global.aim=room_instance_add(global.gameroom,global.ROW*25,global.COL*25,obj_aim);
//----------------------------------------------------------全局GUI-------------------------------------------
room_instance_add(global.gameroom,global.ROW*25,global.COL*25,obj_edit_gui);

//------------------------------------------------------默认数据信息生成---------------------------------------
for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        global.board[i,j]=1;
        global.pieces[i,j]=0;
    }
}
scp_com_map();


//--------------------------------------------------------显示设置------------------------------------------------
display_set_gui_size(global.window_width,global.window_height);
room_set_view(global.gameroom, 0, true, global.ROW*50+global.mune_width,global.COL*50, global.window_width,global.window_height, 0, 0, global.window_width,global.window_height, 8*50, 8*50, 4, 4, -1);
room_set_view(global.gameroom, 1, true, 0, 0, global.view_width, global.view_height,global.mune_width+global.margin_width, global.margin_height, global.view_width, global.view_height, 8*50, 8*50, 10, 10, obj_aim);
room_set_view(global.gameroom, 2, true, global.ROW*50, global.COL*50, global.mune_width, global.view_height,0, 0, global.mune_width, global.view_height, 8*50, 8*50, 10, 10, -1);
room_set_view_enabled( global.gameroom,true);


//--------------------------------------------加入工具栏---------------------------------------------------------

room_instance_add(global.gameroom,0,0,obj_ME_water);
room_instance_add(global.gameroom,0,0,obj_ME_land);
room_instance_add(global.gameroom,0,0,obj_ME_right);
room_instance_add(global.gameroom,0,0,obj_ME_left);
//----
room_instance_add(global.gameroom,50,50,obj_ME_che);
room_instance_add(global.gameroom,50,50,obj_ME_bing);
room_instance_add(global.gameroom,50,50,obj_ME_jiang);
room_instance_add(global.gameroom,50,50,obj_ME_ma);
room_instance_add(global.gameroom,50,50,obj_ME_pao);
room_instance_add(global.gameroom,50,50,obj_ME_shi);
room_instance_add(global.gameroom,50,50,obj_ME_renshi);
room_instance_add(global.gameroom,50,50,obj_ME_shuai);
room_instance_add(global.gameroom,50,50,obj_ME_xiang);
room_instance_add(global.gameroom,50,50,obj_ME_mumu);
room_instance_add(global.gameroom,50,50,obj_ME_zu);
room_instance_add(global.gameroom,50,50,obj_ME_clear);
//---

//===

global.ti=(global.mune_width-global.mune_width%50)/50;
global.tj=15;
global.tw=(global.mune_width%50)/(global.ti+1);


room_goto(global.gameroom);
global.temp_i=0;
for(i=0;i<=8;++i){
    room_instance_add(global.gameroom,global.ROW*50+i*20,global.COL*50+8*50,obj_unit_color);
   
}
