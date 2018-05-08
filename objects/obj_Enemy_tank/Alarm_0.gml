/// @description Idle Timer
switch(leftOrRight)
{
	case 0:
		MainState = 1;
		leftOrRight = 1;
		break
	case 1:
		MainState = 2;
		leftOrRight = 0;
		break
}