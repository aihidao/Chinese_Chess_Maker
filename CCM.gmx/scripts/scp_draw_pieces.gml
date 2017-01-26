/*
if(global.c_row>=0&&global.c_row<global.ROW&&global.c_col>=0&&global.c_col<global.COL){
    with (obj_che){
        instance_destroy();
    }
    if(global.pieces[global.c_row,global.c_col]==0){
        global.pieces[global.c_row,global.c_col]=global.draw_type;
    }
    for(i=0;i<global.ROW;++i){
        for(j=0;j<global.COL;++j){
            if(global.pieces[i,j]>=100){
                switch(global.pieces[i,j]%100){
                    case 1:global.chess_player=(global.pieces[i,j]-(global.pieces[i,j]%100))/100;instance_create(i*50,j*50,obj_che);break;
                }
            }
        }
    }
    //global.chess_player=2
    //room_restart();
}
*/
if(global.c_row>=0&&global.c_row<global.ROW&&global.c_col>=0&&global.c_col<global.COL){
    if(global.pieces[global.c_row,global.c_col]==0){
            global.pieces[global.c_row,global.c_col]=global.draw_type;
            switch(global.pieces[global.c_row,global.c_col]%100){
                case global.CHE:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_che);break;
                case global.BING:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_bing);break;
                case global.JIANG:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_jiang);break;
                case global.MA:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_ma);break;
                case global.PAO:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_pao);break;
                case global.SHI:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_shi);break;
                case global.RENSHI:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_renshi);break;
                case global.SHUAI:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_shuai);break;
                case global.XIANG:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_xiang);break;
                case global.MUMU:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_mumu);break;
                case global.ZU:global.chess_player=(global.pieces[global.c_row,global.c_col]-(global.pieces[global.c_row,global.c_col]%100))/100;instance_create(global.c_row*50,global.c_col*50,obj_zu);break;
            }
    }
}


