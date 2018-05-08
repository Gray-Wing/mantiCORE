emitterInst = instance_create_layer(x+44,y+32,"lay_Wiring_out", obj_Emitter);

digit1Inst = instance_create_layer(x-29,y+15,"lay_Digits", obj_code_switch_digit);
digit2Inst = instance_create_layer(x,y+15,"lay_Digits", obj_code_switch_digit);
digit3Inst = instance_create_layer(x+29,y+15,"lay_Digits", obj_code_switch_digit);

button1Inst = instance_create_layer(x-36,y+32,"lay_Interactables", obj_switch_player);
button2Inst = instance_create_layer(x,y+32,"lay_Interactables", obj_switch_player);
button3Inst = instance_create_layer(x+36,y+32,"lay_Interactables", obj_switch_player);
buttonconfirmInst = instance_create_layer(x+68,y+32,"lay_Interactables", obj_switch_pressure);

hasbeensolved = 0;

digit1 = irandom(9);
digit2 = irandom(9);
digit3 = irandom(9);