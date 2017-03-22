for(i=0;i<ds_list_size(global.clients);i++){
    client=ds_list_find_value(global.clients, i);
    player_socket=ds_map_find_value(client,'player_socket');
    
    
    buff=buffer_create(1024,buffer_grow,1);
    buffer_seek(buff,buffer_seek_start,0);
    buffer_write(buff,buffer_u8,global.GAMESTART);
    network_send_packet(player_socket,buff,buffer_tell(buff));
    buffer_delete(buff);
}
for(i=0;i<global.player_number;i++){
    global.player_status[i]=3;
}
scr_ready_room();
scr_gaming();
instance_destroy();
