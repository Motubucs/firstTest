/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor



if position_meeting(mouse_x, mouse_y, ExitBTN) and click < 4{
	
	if mouse_check_button_pressed(mb_left){
		image_index = 2;
		image_speed = 1;
		
		click = 1;
		}
		
	if mouse_check_button_released(mb_left) and click == 1{
			image_index = 4;
			audio_pause_sound(TitleTheme);
			click = 4;
		}
	
	if !mouse_check_button_pressed(mb_left) and click == 0{
	image_index = 1;
	}
}


	
if click >= 3{

	image_speed = 1;

	}


if !position_meeting(mouse_x, mouse_y, ExitBTN) and click < 3 {
	image_index = 0;
	image_speed = 0;
	click = 0;
}

if image_index == 7{

image_index = 0;
image_speed = 0;
game_end(0);
}

if image_index == 3{
			image_speed =0;
		}



