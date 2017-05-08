//放入棋子、军营信息
global.YES=0;
for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
    
        if(global.county[i,j]==1){
            global.YES=1;
                instance_create(i*50, j*50,obj_county);
        }
    
        switch(global.pieces[i,j]%100){
                case global.CHE: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_che);break;
                case global.BING: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_bing);break;
                case global.JIANG: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_jiang);break;
                case global.MA: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_ma);break;
                case global.PAO: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_pao);break;
                case global.SHI: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_shi);break;
                case global.RENSHI: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_renshi);break;
                case global.SHUAI: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_shuai);break;
                case global.XIANG: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_xiang);break;
                case global.MUMU: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_mumu);break;
                case global.ZU: global.chess_player=(global.pieces[ i, j]-(global.pieces[ i, j]%100))/100;instance_create( i*50, j*50,obj_zu);break;
        }
            
            
        with(obj_ui_ready){
            instance_destroy();
        }
    }
}
