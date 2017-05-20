//记录新玩家数据
var buffer = argument[0];
global.join_num++;
global.player_status[global.join_num]=1;
player_num=global.join_num;
player_name=buffer_read(buffer,buffer_string);
player_ip = ds_map_find_value(async_load, "ip");
player_socket=ds_map_find_value(async_load, "id");
client=ds_map_create();
ds_map_add(client,'player_num',player_num);
ds_map_add(client,'player_name',player_name);
ds_map_add(client,'player_socket',player_socket);
ds_map_add(client,'player_ip',player_ip);
ds_list_add(global.clients,client);
//为新玩家传输数据
    global.player22222222222222222222222222222=11;
    buff=buffer_create(1024,buffer_grow,1);
    buffer_seek(buff,buffer_seek_start,0);
    buffer_write(buff,buffer_u8,global.MARKPLAYER);
    buffer_write(buff,buffer_u8,player_num);
    buffer_write(buff,buffer_string,global.game_json);
    network_send_packet(player_socket,buff,buffer_tell(buff));
    buffer_delete(buff);
