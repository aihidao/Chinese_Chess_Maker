if(0<=global.c_col&&global.c_col<global.COL&&0<=global.c_row&&global.c_row<global.ROW){
       global.c_col=((window_view_mouse_get_y(1)-25)-(window_view_mouse_get_y(1)-25)%50)/50;
       global.c_row=((window_view_mouse_get_x(1)-25)-(window_view_mouse_get_x(1)-25)%50)/50;
       if(global.c_col>=0&&global.c_col<global.COL-1&&global.c_row>=0&&global.c_row<global.ROW-1){
            map_value=global.game_map[global.c_row,global.c_col+1];
           if(map_value>=54){
                map_value-=54;
            }else if(map_value>=27){
                map_value-=27;
            }
            
            if(map_value>=18){
                map_value-=18;
            }else if(map_value>=9){
                map_value-=9;
            }
            if(map_value>=6){
                map_value-=6;
            }else if(map_value>=3){
                map_value-=3;
            }
            if(map_value>=2){
                 global.game_map[global.c_row,global.c_col+1]-=1;
            }else if(map_value>=1){
            
            }else if(map_value<=0){
                global.game_map[global.c_row,global.c_col+1]+=1;
            }
            
           map_value=global.game_map[global.c_row,global.c_col];
            if(map_value>=54){
                map_value-=54;
            }else if(map_value>=27){
                map_value-=27;
            }
            
            if(map_value>=18){
                map_value-=18;
            }else if(map_value>=9){
                map_value-=9;
            }
            if(map_value>=6){
                global.game_map[global.c_row,global.c_col]-=3;
            }else if(map_value>=3){
            
            }else if(map_value<=2){
                global.game_map[global.c_row,global.c_col]+=3;
            }
            
            map_value=global.game_map[global.c_row+1,global.c_col];
            if(map_value>=54){
                map_value-=54;
            }else if(map_value>=27){
                map_value-=27;
            }
            if(map_value>=18){
                global.game_map[global.c_row+1,global.c_col]-=9;
            }else if(map_value>=9){
            
            }else if(map_value<=8){
                global.game_map[global.c_row+1,global.c_col]+=9;
            }
            
            map_value=global.game_map[global.c_row+1,global.c_col+1];
            if(map_value>=54){
                global.game_map[global.c_row+1,global.c_col+1]-=27;
            }else if(map_value>=27){
            
            }else if(map_value<=26){
                global.game_map[global.c_row+1,global.c_col+1]+=27;
            }
       }
    }
