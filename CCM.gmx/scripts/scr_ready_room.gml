for(i=0;i<ds_list_size(global.clients);i++){
    client=ds_list_find_value(global.clients, i);
    player_socket=ds_map_find_value(client,'player_socket');
    
    roomready=ds_list_create();
    for(j=0;j<global.player_number;j++){
        ds_list_add(roomready,global.player_status[j]);
    }
    buff=buffer_create(1024,buffer_grow,1);
    buffer_seek(buff,buffer_seek_start,0);
    buffer_write(buff,buffer_u8,global.READYINFO);
    buffer_write(buff,buffer_string,ds_list_write(roomready));
    network_send_packet(player_socket,buff,buffer_tell(buff));
    buffer_delete(buff);
}
