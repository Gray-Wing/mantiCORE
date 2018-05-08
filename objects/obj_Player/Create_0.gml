/// @description Variable declaration
blinkedthisstep = 0;
instance_create_layer(x,y,"lay_Particles", obj_Player_HUD_HP)
instance_create_layer(x,y,"lay_Particles", obj_Player_HUD_SPIKES)

instance_create_layer(x,y,"lay_Particles", obj_Player_HUD_BLINKS)

wasHit = 0;

tookdamage = 0;

drawInst = instance_create_layer(x,y,"lay_Player", obj_drawPlayer)

knockback = 0;
knockback_MAX = 25;
kbpush = 0;
kbpush_MAX = 10;
kbxdir = 0;
kbydir = 0;
kbup = 0;

lookdirection = 0;

global.gauge_PLAYER_HP = 3;
gauge_HP_MAX = 3;
global.gauge_PLAYER_SPIKES = 1;
gauge_SPIKES_MAX = 1;
global.gauge_PLAYER_BLINKS = 2;
gauge_BLINKS_MAX = 2;

global.player_TAKE_DAMAGE = 0;
global.player_INVINCIBLE = 0;
global.player_HAS_DIED = 0;

bleed = 0;

I_FRAMES = 120;

hasshot = 0;

shootlookdirection = 0;

blinkcd_MAX = 90;

spikecd = 0;
spikecd_MAX = 60;

hsp = 0;
vsp = 0;
grv = 0.8;
walksp = 1;
grvswitch = 0;
blinkdist = 17;
hasblinked = 0;
blinkhold = 0;
lasthmove = 0;
lastvmove = 0;
overgap = 0;
wasonfloor = 0;
hasreachedledge = 0;
canblink = 1;
hasswitched = 0;

shotright = 0;
shotpush = 10; 

shotleft = 0;
shotup = 0;
shotdown = 0;

hasslammed = 0;
hasdived = 0;
hangtime = 0;

cantjump = 0;
canshoot = 1;

canswitch = 1;

old_angle = 0;


global.spikedirection = 0;

prevX = x;
prevY = y;

vAccel = 0;
leftAccel = 0;
rightAccel = 0;
upAccel = 0;
downAccel = 0;
AccelIncrement = 0.5;

Accel_MAX = 4;