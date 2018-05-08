

image_alpha = alpha
if(textAlpha == 1)
{
	iconInst.fade = 1;
	nameInst.fade = 1;
}

if (instance_exists(obj_Player))
{
	if(obj_Player.KEY_ENTER)
	{
		if(str_current == str_page1)&&(str_page2 != "")
		{textFade = -1; toPage2 = 1;}
		else
		{
			iconInst.fade = -1;
			nameInst.fade = -1;	
			fade = -1
			textFade = -1;
			global.TEXT_OPEN = 0;
		}
	}
	if(obj_Player.tookdamage == 1)
	{
		iconInst.fade = -1;
		nameInst.fade = -1;	
		fade = -1
		textFade = -1;
		global.TEXT_OPEN = 0;
	}
}
else
{
	iconInst.fade = -1;
	nameInst.fade = -1;	
	fade = -1
	textFade = -1;
	global.TEXT_OPEN = 0;
}

if(textAlpha == 0 && toPage2 == 1)
{
	str_current = str_page2;
	textFade = 1;
	toPage2 = 0;
}

if((textAlpha == 0)&&(iconInst.image_alpha==0)&&(nameInst.textAlpha==0))
{
	instance_destroy();
}