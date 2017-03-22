///server_handle_connect()

/*
Handle the networking event when its type is "network_type_connect"
*/

// Check to see if this event is meant for this particular server
if (async_load[? "id"] == tcp_socket) {
    var client_socket  = async_load[? "socket"];
    var ip             = async_load[? "ip"];
    var port           = async_load[? "port"];
    
    // Create the data structures for the new client
    ds_list_add(tcp_client_sockets, client_socket);
    var info = ds_map_create();
    ds_map_add_map(tcp_client_infos, client_socket, info);
    info[? "socket"] = client_socket;
    //info[? "client uid"] = server_generate_client_uid();
    info[? "ip"] = ip;
    //info[? "connect time"] = date_current_datetime();
    //info[? "ping"] = -1;
    info[? "ip"] = ip;
    info[? "tcp port"] = port;
    //info[? "udp port"] = -1;
    //info[? "last udp time"] = date_current_datetime();
    info[? "last tcp time"] = date_current_datetime();
    
    //event_call(client_connect_event, id, client_socket, info[? "client uid"], ip, port);
}
