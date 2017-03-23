/// Initialize the client
spr_cont();

var type = network_socket_tcp;
var ip = instance_find(obj_input, 0).stringbox;
var port = 7521;
global.client_socket = network_create_socket(type);
network_connect(global.client_socket, ip, port);
var size = 1024;
var type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size, type, alignment);

/// Create a click and send it to the server
//instance_create(mouse_x, mouse_y, obj_click);
/*
buffer_seek(buffer, buffer_seek_start, 0);

buffer_write(buffer,buffer_u8,1);
buffer_write(buffer,buffer_string,'Just a test for game!');

network_send_packet(socket, buffer, buffer_tell(buffer));
*/

    global.netjoin=1000;
    buffer=buffer_create(size,type,alignment);
    buffer_seek(buffer,buffer_seek_start,0);
    buffer_write(buffer,buffer_u8,global.NEWPLAYER);
    buffer_write(buffer,buffer_string,'zhangsan');
    network_send_packet(global.client_socket,buffer,buffer_tell(buffer));
    buffer_delete(buffer);

