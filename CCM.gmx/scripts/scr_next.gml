var buffer = argument[0];// 1, 100, 120 
status=ds_list_create();
ds_list_read(status,buffer_read(buffer,buffer_string));

for(i=0;i<ds_list_size(status);i++){
    global.player_status[i]=ds_list_find_value(status, i);
}
