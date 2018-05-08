lookdirection_last = 0;
detectRadius = 8*32;
BlinkUp = 1;
blink_cd = 60;


tryCount = 0;

teleX = 0;
teleY = 0;
lastX = 0;
lastY = 0;

undetect_radius = 12*32;
dodge_radius = 64;

playerDetected = 0;

DIE = 0;

walksp = 1;
hmove = 0;
vmove = 0;

vsp = 0;
hsp = 0;

MainState = 0;

confused = 0;
confuseTime = 30;

indInst = instance_create_depth(x,y,depth,obj_crawler_indicator);
//colInst = instance_create_depth(x,y,depth,obj_crawler_collision);

lasthspeed = 0;
lastvspeed = 0;