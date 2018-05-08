draw_set_alpha(alpha);
draw_line_width_color(x,y,lastX,lastY,1,drawColor,drawColor)
alpha -= fade;
if (alpha <= 0) {instance_destroy();}

draw_set_alpha(1);