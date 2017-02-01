if(0<=global.c_col&&global.c_col<global.COL&&0<=global.c_row&&global.c_row<global.ROW){
       if(global.board[global.c_row,global.c_col]==1){
            flag=0;
            for(i=0;i<instance_number(obj_county);++i){
                temp=instance_find(obj_county, i);
                if(temp.x==(global.c_row*50)&&temp.y==(global.c_col*50)){
                    flag=1;
                }
            }
            if(flag==0){
                instance_create(global.c_row*50, global.c_col*50,obj_county);
            }
            }
}
