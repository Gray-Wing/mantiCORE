alpha = clamp(alpha + (fade * 0.1), 0,1);

digit1Inst.image_index = irandom(9);
digit2Inst.image_index = irandom(9);
digit3Inst.image_index = irandom(9);

digit1Inst.image_alpha = alpha;
digit2Inst.image_alpha = alpha;
digit3Inst.image_alpha = alpha;

image_alpha = alpha;

if (fade == -1 && image_alpha == 0)
{
	instance_destroy(digit1Inst);
	instance_destroy(digit2Inst);
	instance_destroy(digit3Inst);
	instance_destroy();
}
