laserEndx = x+(laserlength*image_xscale);
laserEndy = y-laserheight;

if(collision_line(x+(laserfwd*image_xscale),y-laserheight,laserEndx,laserEndy,obj_Wall,false,false))
{
	wallInst = collision_line(x+(laserfwd*image_xscale),y-laserheight,laserEndx,laserEndy,obj_Wall,false,false);	
	laserEndx = wallInst.x;
}
