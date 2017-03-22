global.game_info=ds_map_create();

//------------------------------------------
    for(j=0;j<global.COL;j++){
         for(i=0;i<global.ROW;i++){
            global.county[i,j]=0;
        }
    }
for(k=0;k<instance_number(obj_county);k++){
            temp=instance_find(obj_county,k);
            global.county[temp.x/50,temp.y/50]=1;
}
//------------------------------------------开始收集数据
global.board_info=ds_list_create();
global.map_info=ds_list_create();
global.pieces_info=ds_list_create();
global.county_info=ds_list_create();
global.side_info=ds_list_create();
global.player_info=ds_list_create();


for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        ds_list_add(global.map_info, global.game_map[i,j]);
        ds_list_add(global.pieces_info,global.pieces[i,j]);
        ds_list_add(global.board_info,global.board[i,j]);
        ds_list_add(global.county_info,global.county[i,j]);
    }
}

for(i=0;i<global.player_number;++i){
    for(j=0;j<8;j++){
        ds_list_add(global.player_info,global.player[i,j]);
    }
}

for(i=0;i<8;++i){
    ds_list_add(global.side_info,global.player_side[i]);
}

ds_map_add(global.game_info, "map_name", global.map_name); 
ds_map_add(global.game_info, "ROW", global.ROW);
ds_map_add(global.game_info, "COL", global.COL);
ds_map_add(global.game_info, "player_number", global.player_number);
ds_map_add_list(global.game_info, "map_info", global.map_info);
ds_map_add_list(global.game_info, "board_info", global.board_info);
ds_map_add_list(global.game_info, "pieces_info", global.pieces_info);
ds_map_add_list(global.game_info, "county_info", global.county_info);
ds_map_add_list(global.game_info, "player_info", global.player_info);
ds_map_add_list(global.game_info, "side_info", global.side_info);

global.game_json=json_encode(global.game_info);

var game_file= file_text_open_write(working_directory+"/gamemap/"+global.map_name+".cmap");
file_text_write_string(game_file, global.game_json);
file_text_close(game_file);

