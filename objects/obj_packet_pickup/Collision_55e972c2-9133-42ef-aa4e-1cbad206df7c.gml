Collected = 1;
instance_destroy();

global.PacketStatus[PacketNumber] = 1;

global.NumberofPackets_Collected++;

CollectParticleInst = instance_create_depth(x,y,depth,obj_packet_CollectParticle);
CollectParticleInst.str_PacketCollected = "Collected Packet No." + string(PacketNumber) + "\n[" + string(global.NumberofPackets_Collected) + " / 16]";