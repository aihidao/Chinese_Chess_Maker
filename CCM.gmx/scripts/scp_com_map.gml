//----------------------------------------淹没判定(入り)
for(i=0;i<global.ROW;++i){
    for(j=0;j<global.COL;++j){
            //top right
            global.i=i;
            global.j=j;
            if(i==0&&j==0){
                if(global.board[i+1,j+1]==0||global.board[i+1,j]==0||global.board[i,j+1]==0){
                    global.board[i,j]=0;
                }
            }else if((i==(global.ROW-1))&&(j==global.COL-1)){
                if(global.board[i-1,j-1]==0||global.board[i-1,j]==0||global.board[i,j-1]==0){
                    global.board[i,j]=0;
                }
            }else if(i==global.ROW-1&&j==0){
                if(global.board[i-1,j+1]==0||global.board[i-1,j]==0||global.board[i,j+1]==0){
                    global.board[i,j]=0;
                }
            }else if(i==0&&(j==global.COL-1)){
                if(global.board[i+1,j-1]==0||global.board[i+1,j]==0||global.board[i,j-1]==0){
                    global.board[i,j]=0;
                }
            }else if(global.board[i,j]==1||global.board[i,j]==2){
                if(i==0){
                    if((global.board[i,j+1]==0&&global.board[i,j-1]==0)||global.board[i+1,j]==0){
                        global.board[i,j]=0;
                    }
                }else if(i==global.ROW-1){
                    if(global.board[i,j+1]==0&&global.board[i,j-1]==0||global.board[i-1,j]==0){
                        global.board[i,j]=0;
                    }
                }else if(j==0){
                    if(global.board[i+1,j]==0&&global.board[i-1,j]==0||global.board[i,j+1]==0){
                        global.board[i,j]=0;
                    }
                }else if(j==global.COL-1){
                    if(global.board[i+1,j]==0&&global.board[i-1,j]==0||global.board[i,j-1]==0){
                        global.board[i,j]=0;
                    }
                }else if((global.board[i+1,j]==0&&global.board[i-1,j]==0)||(global.board[i,j+1]==0&&global.board[i,j-1]==0)){
                    global.board[i,j]=0;
                }
            }  
    }
}

//地图初始化
room_tile_clear(global.gameroom);
for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        temp=0;
        //i illegal
        if(i>=global.ROW-1){                                                      //i>ROW
            if(j<=0){
                if(global.board[i-1,j+1]==1){
                    temp+=9;
                }else if(global.board[i-1,j+1]==2){
                    temp+=18;
                }
            }else if(j>=global.COL-1){
                if(global.board[i-1,j-1]==1){
                    temp+=27;    
                }else if(global.board[i-1,j-1]==2){
                    temp+=54;
                }
            }else {
                if(global.board[i-1,j+1]==1){
                    temp+=9;
                }else if(global.board[i-1,j+1]==2){
                    temp+=18;
                }
                if(global.board[i-1,j-1]==1){
                    temp+=27;    
                }else if(global.board[i-1,j-1]==2){
                    temp+=54;
                }
            }
        }else if(i<=0){                                            //i<0
            if(j<=0){
                if(global.board[i+1,j+1]==1){
                    temp+=3;
                }else if(global.board[i+1,j+1]==2){
                    temp+=6;
                }
            }else if(j>=global.COL-1){
                if(global.board[i+1,j-1]==1){
                    temp+=1;
                }else if(global.board[i+1,j-1]==2){
                    temp+=2;
                }
            }else{
                if(global.board[i+1,j+1]==1){
                    temp+=3;
                }else if(global.board[i+1,j+1]==2){
                    temp+=6;
                }
                
                if(global.board[i+1,j-1]==1){
                    temp+=1;
                }else if(global.board[i+1,j-1]==2){
                    temp+=2;
                }
                
            }
        }else if(j<=0){                                          //j<0
             if(global.board[i-1,j+1]==1){
                temp+=9;
            }else if(global.board[i-1,j+1]==2){
                temp+=18;
            }
            
            if(global.board[i+1,j+1]==1){
                temp+=3;
            }else if(global.board[i+1,j+1]==2){
                temp+=6;
            }
        }else if(j>=global.COL-1){                         //j>COL
            if(global.board[i-1,j-1]==1){
                temp+=27;    
            }else if(global.board[i-1,j-1]==2){
                temp+=54;
            }
            
            if(global.board[i+1,j-1]==1){
                temp+=1;
            }else if(global.board[i+1,j-1]==2){
                temp+=2;
            }
        }else{                                                  //i and j in cell's inner
            if(global.board[i-1,j-1]==1){
                temp+=27;    
            }else if(global.board[i-1,j-1]==2){
                temp+=54;
            }
            
            if(global.board[i+1,j-1]==1){
                temp+=1;
            }else if(global.board[i+1,j-1]==2){
                temp+=2;
            }
            
            if(global.board[i-1,j+1]==1){
                temp+=9;
            }else if(global.board[i-1,j+1]==2){
                temp+=18;
            }
            
            if(global.board[i+1,j+1]==1){
                temp+=3;
            }else if(global.board[i+1,j+1]==2){
                temp+=6;
            }
        }
        
        if(temp*global.board[i,j]>80){
            temp=80;
        }else{
          temp*=global.board[i,j];
        }
        global.game_map[i,j]=temp;
        if(global.game_map[i,j]==0){
            global.board[i,j]=0;
        }
    }
}
//----------------------------------------地图修补----------------------------------------------------

for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
            //top right
            if(i==0&&j==0){
                if(global.board[1,1]==2&&global.board[0,0]==2){
                    global.game_map[0,0]=6;
                }
            }else if((i==(global.ROW-1))&&(j==global.COL-1)){
                if(global.board[global.ROW-1,global.COL-1]==2&&global.board[global.ROW-2,global.COL-2]==2){
                    global.game_map[global.ROW-1,global.COL-1]=54;
                }
            }else if(i==global.ROW-1&&j==0){
                if(global.board[global.ROW-1,0]==2&&global.board[global.ROW-2,1]==2){
                    global.game_map[global.ROW-1,0]=18;
                }
            }else if(i==0&&(j==global.COL-1)){
                if(global.board[0,global.COL-1]==2&&global.board[1,global.COL-2]==2){
                    global.game_map[0,global.COL-1]=2;
                }
            }else if(global.board[i,j]==2){                             //修补宫殿
                if(i==0&&(global.board[i+1,j+1]==2||global.board[i+1,j-1]==2)){ //修补边界宫殿与宫殿
                    global.game_map[i,j]=8;
                }else if(i==global.ROW-1&&(global.board[i-1,j+1]==2||global.board[i-1,j-1]==2)){
                    global.game_map[i,j]=72;
                }
                if(j==0&&(global.board[i+1,j+1]==2||global.board[i-1,j+1]==2)){
                    global.game_map[i,j]=24;
                }else if(j==global.COL-1&&(global.board[i-1,j-1]==2||global.board[i+1,j-1]==2)){
                    global.game_map[i,j]=56;
                }
                
                //修补宫殿与水域
                temp2=0;
                if(global.board[i+1,j-1]==0){
                    temp2+=1;   
                }
                if(global.board[i+1,j]==0){
                    temp2+=2;   
                }
                if(global.board[i+1,j+1]==0){
                    temp2+=4;   
                }
                if(global.board[i,j+1]==0){
                    temp2+=8;   
                }
                if(global.board[i-1,j+1]==0){
                    temp2+=16;   
                }
                if(global.board[i-1,j]==0){
                    temp2+=32;   
                }
                if(global.board[i-1,j-1]==0){
                    temp2+=64;   
                }
                if(global.board[i,j-1]==0){
                    temp2+=128;   
                }
            }         
    }
}

//--------------------------------------------------------生成地图------------------------------------------------

for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        room_tile_add(global.gameroom,bg_main, (global.game_map[i,j]%9)*50, int64( (global.game_map[i,j]/9))*50, 50, 50, i*50, j*50, 200);
    }
}
