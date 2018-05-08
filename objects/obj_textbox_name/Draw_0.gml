draw_self();


draw_set_halign(fa_left);
draw_set_font(fnt_Display);

alpha = clamp(alpha + (fade * 0.1),0,.8);
textAlpha = clamp(textAlpha + (fade * 0.1),0,1);

draw_text_ext_color(nameStartX,nameStartY,str_Name,0,900,c_white,c_white,c_white,c_white,textAlpha);

draw_set_alpha(1);