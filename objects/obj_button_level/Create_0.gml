isOpen = 0;

isCompleted = 0;

isLocked = 0;

levelNum = 1;

startLevel = 0;

statusVar = 0;

fade = 0;

alpha = 0;

completeInst = instance_create_layer(x,y,"lay_start",obj_button_level_completed);
completeStatus = 0;
// 0 = locked, 1 = available, 2 = complete

levelNumInst = instance_create_depth(x,y,depth-1,obj_button_level_number);


levelNumInst.levelNum = levelNum;

level = room_Demo;