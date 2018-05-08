textAlpha = clamp(textAlpha + (textFade * 0.1),0,1);
alpha = clamp(alpha + (fade * 0.1),0,.8);

draw_self();

draw_set_font(fnt_Display);
draw_set_halign(fa_center);

draw_text_ext_color(textStartX,textStartY,str_PacketCollected,LineSpacing,LineLength,c_white,c_white,c_white,c_white,textAlpha);