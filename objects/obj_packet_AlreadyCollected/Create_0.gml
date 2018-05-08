PacketNumber = 0;
Collected = 0;
image_alpha = .6;

indInst = instance_create_depth(x,y,depth-1,obj_packet_indicator)
indInst.PacketNum = PacketNumber;
indInst.image_alpha = image_alpha;

str_AlreadyCollected = "Already Collected"

alarm[0] = 1;