var buffer = argument[0];

rooms=ds_list_create();
a_room=ds_map_create();
global.list_test=buffer_read(buffer,buffer_string);
ds_list_read(rooms,global.list_test);
//rooms=buffer_read(buffer,buffer_string);
num=ds_list_size(rooms);
if(num>8){
    num=8;
}

for(i=0;i<num;i++){
    ds_map_read(a_room,ds_list_find_value(rooms,i));
     (instance_find(obj_select_room,i)).map_name=ds_map_find_value(a_room,"map_name");
     (instance_find(obj_select_room,i)).player_num=ds_map_find_value(a_room,"player_num");
     (instance_find(obj_select_room,i)).map_id=ds_map_find_value(a_room,"map_id");
     (instance_find(obj_select_room,i)).room_id=ds_map_find_value(a_room,"room_id");
     (instance_find(obj_select_room,i)).visible=true;
     
     //(instance_find(obj_select_room,i)).map_name="map_name";
     //(instance_find(obj_select_room,i)).player_num="player_num";
     //(instance_find(obj_select_room,i)).map_id="map_id";
     //(instance_find(obj_select_room,i)).visible=true;
}
