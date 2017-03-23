global.chane_view_temp=1;
switch(global.LOC_SIDE){
    case global.SOUNTH:scr_view_sounth();break;
    case global.NORTH:scr_view_north();break;
    case global.EAST:scr_view_east();break;
    case global.WEST:view_angle[1]=270;scr_view_west();break;
}
