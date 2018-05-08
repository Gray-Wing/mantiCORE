/// @description Idle Timer

switch(leftOrRight)
{
	//left
	case 0:
		MainState = 2;
		leftOrRight = irandom_range(0,1);
		break
	//right
	case 1:
		MainState = 1;
		leftOrRight = irandom_range(0,1);
		break
}
leftOrRight = irandom_range(0,1);

alarm[1] =  irandom_range(walkTime_MIN,walkTime_MAX);