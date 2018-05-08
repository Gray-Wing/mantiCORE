if (place_meeting(x,y,obj_drawPlayer))
{
	interactInst.fade = 1;
	if (instance_exists(obj_Player))
	{
		//if player interacts with node
		if(obj_Player.KEY_ENTER)&&(global.TEXT_OPEN = 0)
		{
			var textboxInst = instance_create_layer(x+32,y-96,"lay_Particles",obj_textbox_Frame);
			textboxInst.str_Name = str_name;
			textboxInst.str_page1 = str_page1;
			textboxInst.str_page2 = str_page2;
			textboxInst.image = image;
			
			
			wasRead = 1;
		}
	}
}
else
{
	interactInst.fade = -1;
}


if (wasRead == 1) {image_index = 0;}