//global.gamer[0]=1;
for(i=0;i<global.player_number;i++){
    global.player_status[i]=0;
}

global.mine=0;
global.player_status[global.mine]=1;
global.join_num=0;

/// Initialize the server object
var type = network_socket_tcp;
var port = 7521;
var max_clients = global.player_number;
server = network_create_server(type, port, max_clients);
global.clients=ds_list_create();
