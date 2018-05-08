indInst.PacketNum = PacketNumber;
indInst.x = x;
indInst.y = y;

if (image_index >= 20) 
{
	instance_create_depth(x,y,depth-1,obj_white_fireParticle);
}
	