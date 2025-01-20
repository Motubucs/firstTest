/// @description Insert description here
// You can write your code in this editor
clicked = keyboard_check_pressed(vk_left);
released = keyboard_check_released(vk_left);


if clicked {
image_speed = 1;
image_index = 1;
press = 1;
}else{
	press = 0;
}

if released and press != 1{

image_index = 4;
image_speed = 1;

}

if image_index == 6 or image_index == 0{
	image_index = 0;
	image_speed = 0;
}

if image_index == 2{
	image_index = 2;
	image_speed = 0;
}
