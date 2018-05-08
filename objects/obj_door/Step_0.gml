inputInst = instance_place(x,y, obj_Emitter);
switch (inputInst.wiring_SIGNAL)
{
	case 0:
		var wallInst = instance_create_layer(x,y,"lay_Walls", obj_doorWall);
		image_index = 0;
		break
	case 1:
		if (instance_place(x,y,obj_doorWall))
		{
			var wallInst = instance_place(x,y,obj_doorWall);
			instance_destroy(wallInst);
			
		}
		image_index = 3;
		break 
}
