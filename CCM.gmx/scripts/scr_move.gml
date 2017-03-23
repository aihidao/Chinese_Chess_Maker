var buffer = argument[0];// 1, 100, 120 
type=buffer_read(buffer,buffer_u16);
m_x=buffer_read(buffer,buffer_u16);
m_y=buffer_read(buffer,buffer_u16);
t_x=buffer_read(buffer,buffer_u16);
t_y=buffer_read(buffer,buffer_u16);
if(global.pieces[m_x/50,m_y/50]!=0){
    for(i=0;i<instance_number(obj_piece);i++){
        piece=instance_find(obj_piece,i);
        if(piece.x==m_x&&piece.y==m_y){
            piece.x=t_x;
            piece.y=t_y;
            global.pieces[m_x/50,m_y/50]=0;
            global.pieces[t_x/50,t_y/50]=type;
            break;
        }
    }
}

global.temp_move_send=1;
if(global.mine==0){
    buff=buffer_create(1024,buffer_grow,1);
    buffer_seek(buff,buffer_seek_start,0);
    buffer_write(buff,buffer_u8,global.MOVE);
    buffer_write(buff,buffer_u16,type);  
    buffer_write(buff,buffer_u16,m_x);              //x
    buffer_write(buff,buffer_u16,m_y);   //y
    buffer_write(buff,buffer_u16,t_x);   //tx
    buffer_write(buff,buffer_u16,t_y);   //ty
    for(i=0;i<ds_list_size(global.clients);i++){
            client=ds_list_find_value(global.clients, i);
            player_socket=ds_map_find_value(client,'player_socket');
            network_send_packet(player_socket,buff,buffer_tell(buff));
    }
    scr_next_player();
}
