// Level Control
if (instance_exists(level0exit) && level0exit.levelComplete == 1) {global.level_0_status = 2;}

if (global.level_0_status == 2) 
{
	global.level_1_status = 1;
	if (instance_exists(level0button)) 
	{
		level0button.statusVar = 2;
		level1button.statusVar = 1;
	}
}
if (global.level_1_status == 2) {global.level_2_status = 1;}
if (global.level_2_status == 2) {global.level_3_status = 1;}
if (global.level_3_status == 2) {global.level_4_status = 1;}
if (global.level_4_status == 2) {global.level_5_status = 1;}
if (global.level_5_status == 2) {global.level_6_status = 1;}
if (global.level_6_status == 2) {global.level_7_status = 1;}
if (global.level_7_status == 2) {global.level_8_status = 1;}
if (global.level_8_status == 2) {global.level_9_status = 1;}
if (global.level_9_status == 2) {global.level_10_status = 1;}
if (global.level_10_status == 2) {global.level_11_status = 1;}
if (global.level_11_status == 2) {global.level_12_status = 1;}
if (global.level_12_status == 2) {global.level_13_status = 1;}
if (global.level_13_status == 2) {global.level_14_status = 1;}
if (global.level_14_status == 2) {global.level_15_status = 1;}
if (global.level_15_status == 2) {global.level_16_status = 1;}
if (global.level_16_status == 2) {global.level_17_status = 1;}

//Packet Control
//if(instance_exists(Packet4))
//{ 
//	if (Packet4.Collected == 1) {global.PacketStatus[4] = 1;}
//}



