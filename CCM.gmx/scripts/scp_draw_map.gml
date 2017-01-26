for(i=0;i<global.ROW;i++){
    for(j=0;j<global.COL;j++){
        draw_sprite_part(spr_bg,-1,(global.game_map[i,j]%9)*50, int64( (global.game_map[i,j]/9))*50, 50, 50,i*50,j*50);
    }
}
