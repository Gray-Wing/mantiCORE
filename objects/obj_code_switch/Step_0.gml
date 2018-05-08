digit1Inst.image_index = digit1;
digit2Inst.image_index = digit2;
digit3Inst.image_index = digit3;

if (digit1 == global.code1 && digit2 == global.code2 && digit3 == global.code3 && buttonconfirmInst.lockedon == 1)
{
	hasbeensolved = 1;
	emitterInst.wiring_SIGNAL = 1;
	image_index = 1;
}
//else 
//{
//	emitterInst.wiring_SIGNAL = 0;
//	image_index = 0;
//}
if ((digit1 != global.code1 || digit2 != global.code2 || digit3 != global.code3) && buttonconfirmInst.lockedon == 1)
{
	buttonconfirmInst.lockedon = 0;
	buttonconfirmInst.lockedoff = 1;
	buttonconfirmInst.timepressed = 0;
	buttonconfirmInst.alarm[0] = buttonconfirmInst.COOLDOWN_TIME;
	
	if(global.player_INVINCIBLE = 0)
	{
		global.player_TAKE_DAMAGE = 1;
	}
	
	digit1 = random_range(0,9);
	digit2 = random_range(0,9);
	digit3 = random_range(0,9);
}


with (button1Inst)
{
	if(other.hasbeensolved == 0)
	{
		if (button_PRESSED == 1 && hasbeenpressed == 0)
		{
			if (other.digit1 < 9){other.digit1++;}
			else {other.digit1 = 0;}
			hasbeenpressed = 1;	
		}
		if (button_PRESSED == 0 && hasbeenpressed == 1)
		{
			hasbeenpressed = 0;
		}
	}
}

with (button2Inst)
{
	if(other.hasbeensolved == 0)
	{
		if (button_PRESSED == 1 && hasbeenpressed == 0)
		{
			if (other.digit2 < 9){other.digit2++;}
			else {other.digit2 = 0;}
			hasbeenpressed = 1;	
		}
		if (button_PRESSED == 0 && hasbeenpressed == 1)
		{
			hasbeenpressed = 0;
		}
	}
}

with (button3Inst)
{
	if(other.hasbeensolved == 0)
	{
		if (button_PRESSED == 1 && hasbeenpressed == 0)
		{
			if (other.digit3 < 9){other.digit3++;}
			else {other.digit3 = 0;}
			hasbeenpressed = 1;	
		}
		if (button_PRESSED == 0 && hasbeenpressed == 1)
		{
			hasbeenpressed = 0;
		}
	}
}