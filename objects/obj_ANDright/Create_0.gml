wiring_SIGNAL = 0;
topInputInst = instance_create_depth(x,y,depth-1, obj_ANDtopinput);
botInputInst = instance_create_depth(x,y,depth-1, obj_ANDbotinput);
outputInst = instance_create_depth(x,y,depth-1, obj_WireOut);

topInputInst.image_angle = image_angle;
botInputInst.image_angle = image_angle;
outputInst.image_angle = image_angle;

lastframesignal = wiring_SIGNAL;

alpha_min = .4;
alpha_max = 1;

maxalphatime = 30;

fade = 0;
fade_max = 60;

image_alpha = alpha_min;
outputInst.image_alpha = alpha_min;
