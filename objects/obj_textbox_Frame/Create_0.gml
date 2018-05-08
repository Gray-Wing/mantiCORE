iconInst = instance_create_depth(x,y,depth,obj_textbox_icon)
iconInst.image_alpha = 0;
nameInst = instance_create_depth(x,y,depth,obj_textbox_name)
nameInst.image_alpha = 0;
advanceInst = instance_create_depth(x,y,depth,obj_textbox_advance)
advanceInst.image_alpha = 0;

fade = 1;
textFade = 1;

textAlpha = 0;
alpha = 0;

LineLength = 177;
LineSpacing = 12;

pageStartX = x-68;
pageStartY = y-54;


image_alpha = 0;

frameAlpha = 0;

iconAlpha = 0;

nameAlpha = 0;

advanceAlpha = 0;

textAlpha = 0;

str_Name = ""; //15 Characters max
nameInst.str_Name = str_Name;
toPage2 = 0;
toPage3 = 0;

image = 0;

str_page1 = ""
str_page2 = "";
str_page3 = "";

global.TEXT_OPEN = 1;

str_current = str_page1;

alarm[0] = 1;