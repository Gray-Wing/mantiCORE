seg1 = currentlength / 6;

seg2 = (2*currentlength) / 6;

seg3 = (3*currentlength) / 6;

seg4 = (4*currentlength) / 6;

seg5 = (5*currentlength) / 6;

draw_set_alpha(seg5alpha);
draw_line_width_color(x-1,y-16,x-1,y-currentlength,4,c_white,c_white)
draw_line_color(x-5,y-16,x-5,y-currentlength,c_white,c_white)
draw_line_color(x+4,y-16,x+4,y-currentlength,c_white,c_white)

if (1.2*currentlength <= maxlength)
{
	currentlength *= 1.2;
}

draw_set_alpha(1);