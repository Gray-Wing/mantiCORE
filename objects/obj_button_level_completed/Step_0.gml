alpha = clamp(alpha + (fade * 0.1), 0,1);
image_alpha = alpha;

if (obj_button_Start.isOpen == 1)
{
	fade = 1;
}
else
{
	fade = -1;
}