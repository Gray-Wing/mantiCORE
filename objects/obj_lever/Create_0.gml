emitterInst = instance_create_layer(x,y+19,"lay_Wiring", obj_Emitter);
interactInst = instance_create_depth(x,y-16,depth-1,obj_interact)
interactInst.fade = 1;

button_PRESSED = 0;
hasbeenpressed = 0;

leverSwitch = 0;

isOn = 0;