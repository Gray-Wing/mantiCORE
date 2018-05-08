draw_self();

draw_set_halign(fa_left);
draw_set_font(fnt_Display);
textAlpha = clamp(textAlpha + (textFade * 0.1),0,1);
alpha = clamp(alpha + (fade * 0.1),0,.8);
draw_text_ext_color(pageStartX,pageStartY,str_current,LineSpacing,LineLength,c_white,c_white,c_white,c_white,textAlpha);
draw_set_alpha(1);
