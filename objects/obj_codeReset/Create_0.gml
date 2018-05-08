image_xscale = 2;
image_yscale = 2;

digit1Inst = instance_create_depth(x-58,y+38,-101, obj_code_switch_digit);
digit2Inst = instance_create_depth(x,y+38,-101, obj_code_switch_digit);
digit3Inst = instance_create_depth(x+58,y+38,-101, obj_code_switch_digit);

digit1Inst.image_xscale = 2;
digit1Inst.image_yscale = 2;
digit2Inst.image_xscale = 2;
digit2Inst.image_yscale = 2;
digit3Inst.image_xscale = 2;
digit3Inst.image_yscale = 2;


digit1Inst.persistent = true;
digit2Inst.persistent = true;
digit3Inst.persistent = true;

global.code1 = irandom(9);
global.code2 = irandom(9);
global.code3 = irandom(9);

fade = 1;
alpha = 0;

alarm[0] = 60;