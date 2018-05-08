vsp = 0;
hsp = 0;

idleTime = 60;

stunparticlefreq = 6;

//0 = left, 1 = right
leftOrRight = irandom_range(0,1);

MainState = 6;

walksp = 2;

hmove = 0;
lasthmove = 0;
grv = 0.9;
CBOX_WIDTH = 36;
STUN_TIME = 180;
PAUSE_TIME = 30;
STUN_RESIST_TIME = 60;
stopmoving = 0;
alarm[0] = PAUSE_TIME;	

leftMod = obj_Enemy_tank_drills;

rightMod = obj_Enemy_tank_drills;


leftModx = x-17;
leftMody = y-2;

rightModx = x+17;
rightMody = y-2;

shieldInst = instance_create_layer(x,y,"lay_Enemies",obj_Enemy_tank_shield)
weakspotInst = instance_create_depth(x,y,depth+1,obj_Enemy_tank_weakspot)
weakspotInst.sprite_index = spr_Empty;

hasbeenstunned = 0;
moveright = 0;
moveleft = 0;
movingright = 0;
movingleft = 0;

MOVE_DIST = 32;

canbestunned = 1;
hasbeenkilled = 0;

maxpush = 8;

pushRight = 0;
pushLeft = 0;

DIE_ALREADY = 0;