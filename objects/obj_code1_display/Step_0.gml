digitInst.image_index = global.code1;


inputInst = instance_place(x,y, obj_Emitter);
switch (inputInst.wiring_SIGNAL)
{
	case 0:
		digitInst.image_alpha = 0;
		image_index = 0;
		break
	case 1:
		digitInst.image_alpha = 1;
		image_index = 1;
		break
}
