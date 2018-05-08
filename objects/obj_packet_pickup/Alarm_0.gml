if (global.PacketStatus[PacketNumber] == 1) 
{
	instance_destroy();
	AlrdyInst = instance_create_depth(x,y,depth,obj_packet_AlreadyCollected);
	AlrdyInst.PacketNumber = PacketNumber;
}