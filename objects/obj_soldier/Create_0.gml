guninst = instance_create_depth(x+4,y-17,depth-1,obj_soldier_gun);
guninst.image_alpha = 0;

jumpCD = 30;
canJump = 1;

weakspotInst = instance_create_depth(x+7,y-13,depth-1,obj_soldier_weakspot);
weakspotInst.image_alpha = 0;

collisionmaskWidth = 16

leftOrRight = irandom_range(0,1);

confuseTime = 32;
confused = 0;
confusedOnce = 0;

jumpHeight = -9;

createParticle = 0;

seekCone = 0;
startChargeDist = 128;

outOfLOS = 0
outOfLOSTime = 30;

idleTime_MAX = 180;
idleTime_MIN = 30;

//alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);

walkTime_MAX = 300;
walkTime_MIN = 60;

seekRad = 256;

seekwidth = 512;
seekheight = 128;

turnaroundTime = 15;

walksp = 1;

DIE = 0;
firstshotTime = 5;

lastAngleToPlayer = 0;
angleToPlayer = 0;

jumpseekheighttop = 96;
jumpseekheightbot = 32;
jumpseekdist = 128;

barrelX = guninst.x + lengthdir_x(38,guninst.image_angle);
barrelY = guninst.y + lengthdir_y(38,guninst.image_angle);

vsp = 0;
hsp = 0;
vmove = 0;
hmove = 0;

grv = .8;
 
runhmove = 0;
runsp = 8.5;

//0 - idle; 1 - spinning/sighted; 2 - aiming; 3 - shooting; 4 - charging; 5 - sliding; 6 - confused
MainState = 0;
alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);