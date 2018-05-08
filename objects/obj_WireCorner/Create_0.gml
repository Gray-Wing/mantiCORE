wiring_SIGNAL = 0;
outputInst = instance_create_depth(x,y,depth-1, obj_WireOut);
if(!instance_place(x,y, obj_Emitter)){show_debug_message("WARNING: no wiring input somewhere")}

lastframesignal = wiring_SIGNAL;

alpha_min = .4;
alpha_max = 1;

maxalphatime = 30;

fade = 0;
fade_max = 60;

image_alpha = alpha_min;
outputInst.image_alpha = alpha_min;