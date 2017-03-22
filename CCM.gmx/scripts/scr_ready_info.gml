var buffer = argument[0];// 1, 100, 120

roomready=ds_list_create();
ds_list_read(roomready,buffer_read(buffer,buffer_string));

for(i=0;i<ds_list_size(roomready);i++){
    global.player_status[i]=ds_list_find_value(roomready, i);
}

