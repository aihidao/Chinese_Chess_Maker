//记录新玩家数据
var buffer = argument[0];
global.mine=0;
global.player_status[global.mine]=1;
(instance_find(obj_ui_status,global.mine)).player_name=global.username;
