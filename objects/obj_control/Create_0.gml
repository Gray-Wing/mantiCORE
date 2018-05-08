NumberOfLevels = 16
global.level_0_status = 1;
global.level_1_status = 0;
global.level_2_status = 0;
global.level_3_status = 0;
global.level_4_status = 0;
global.level_5_status = 0;
global.level_6_status = 0;
global.level_7_status = 0;
global.level_8_status = 0;
global.level_9_status = 0;
global.level_10_status = 0;
global.level_11_status = 0;
global.level_12_status = 0;
global.level_13_status = 0;
global.level_14_status = 0;
global.level_15_status = 0;
global.level_16_status = 0;
global.level_17_status = 0;

global.TEXT_OPEN = 0;

TotalNumberofPackets = 17;

global.PacketStatus = 0;
for (i = 0; i <= TotalNumberofPackets;i++)
{
	global.PacketStatus[i] = 0;	
}

global.NumberofPackets_Collected = 0;

randomize();

global.code1 = irandom(9);
global.code2 = irandom(9);
global.code3 = irandom(9);