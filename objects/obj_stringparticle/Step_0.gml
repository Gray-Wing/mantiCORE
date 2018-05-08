if (count == 0)
{
	direction = image_angle;
	speed = seg1;
}
if (count == 1)
{
	direction = image_angle+90;
	speed = LRSeg1Length;
	var TrailInst = instance_create_depth(x,y,depth,obj_TrailParticle);
	TrailInst.lastX = lastX;
	TrailInst.lastY = lastY;
	TrailInst.drawColor = drawColor;
	TrailInst.fade = fade;
}
if (count == 2)
{
	direction = image_angle;
	speed = seg2;
	var TrailInst = instance_create_depth(x,y,depth,obj_TrailParticle);
	TrailInst.lastX = lastX;
	TrailInst.lastY = lastY;
	TrailInst.drawColor = drawColor;
	TrailInst.fade = fade;
}
if (count == 3)
{
	direction = image_angle+90;
	speed = LRSeg2Length;
	var TrailInst = instance_create_depth(x,y,depth,obj_TrailParticle);
	TrailInst.lastX = lastX;
	TrailInst.lastY = lastY;
	TrailInst.drawColor = drawColor;
	TrailInst.fade = fade;
}
if (count == 4)
{
	direction = image_angle;
	speed = seg3;
	var TrailInst = instance_create_depth(x,y,depth,obj_TrailParticle);
	TrailInst.lastX = lastX;
	TrailInst.lastY = lastY;
	TrailInst.drawColor = drawColor;
	TrailInst.fade = fade;
}
if (count == 5)
{
	direction = image_angle+90;
	speed = LRSeg3Length;
	var TrailInst = instance_create_depth(x,y,depth,obj_TrailParticle);
	TrailInst.lastX = lastX;
	TrailInst.lastY = lastY;
	TrailInst.drawColor = drawColor;
	TrailInst.fade = fade;
}
if (count == 6)
{
	direction = image_angle;
	speed = seg4;
	var TrailInst = instance_create_depth(x,y,depth,obj_TrailParticle);
	TrailInst.lastX = lastX;
	TrailInst.lastY = lastY;
	TrailInst.drawColor = drawColor;
	TrailInst.fade = fade;
}
if (count == 7)
{
	direction = image_angle+90;
	speed = LRSeg4Length;
	var TrailInst = instance_create_depth(x,y,depth,obj_TrailParticle);
	TrailInst.lastX = lastX;
	TrailInst.lastY = lastY;
	TrailInst.drawColor = drawColor;
	TrailInst.fade = fade;
}
if(count == 8)
{
	//var TrailInst = instance_create_depth(x,y,depth,obj_TrailParticle);
	//TrailInst.lastX = lastX;
	//TrailInst.lastY = lastY;
	//TrailInst.drawColor = drawColor;	
	instance_destroy();
}

lastX = x;
lastY = y;
count++;