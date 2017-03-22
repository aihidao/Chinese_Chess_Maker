var buffer = argument[0];// 1, 100, 120

player_num = buffer_read(buffer, buffer_u8);
global.player_status[player_num]=1;
scr_ready_room();
