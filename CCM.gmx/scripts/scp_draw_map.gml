for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        draw_sprite_part(spr_bg,-1,(global.game_map[i,j]%9)*50, int64( (global.game_map[i,j]/9))*50, 50, 50,i*50,j*50);
        if(global.game_map[i,j]==0){
            global.board[i,j]=0;
        }else{
            map_value=global.game_map[i,j];
            if(map_value%3==2){
                global.board[i,j]=2;
                global.board[i+1,j-1]=2;
                global.board[i+1,j]=2;
                global.board[i,j-1]=2;
            }
            map_value=(map_value-(map_value%3))/3;
            
            if(map_value%3==2){
                global.board[i,j]=2;
                global.board[i+1,j+1]=2;
                global.board[i+1,j]=2;
                global.board[i,j+1]=2;
            }
            map_value=(map_value-(map_value%3))/3;
            
            if(map_value%3==2){
                global.board[i,j]=2;
                global.board[i,j+1]=2;
                global.board[i-1,j+1]=2;
                global.board[i-1,j]=2;
            }
            map_value=(map_value-(map_value%3))/3;
            
            if(map_value%3==2){
                global.board[i,j]=2;
                global.board[i-1,j-1]=2;
                global.board[i,j-1]=2;
                global.board[i-1,j]=2;
            }
            
            if(global.board[i,j]!=2&&global.board[i,j]!=0){
                global.board[i,j]=1;
            } 
        }
        
    }
}
//---

