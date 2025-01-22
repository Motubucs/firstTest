/// @description Insert description here
// You can write your code in this editor



if position_meeting(mouse_x, mouse_y, obj_buttonToPlaform) and click < 4{
	
	if mouse_check_button_pressed(mb_left){
		image_index = 2;
		click = 1;
		}
		
	if mouse_check_button_released(mb_left) and click == 1{
			image_index = 3;
			audio_pause_all();
			click = 4;
		}
	
	if !mouse_check_button_pressed(mb_left) and click == 0{
	image_index = 1;
	}
}


	
if click >= 3{

	image_speed = 1;

	}


if !position_meeting(mouse_x, mouse_y, obj_buttonToPlaform) and click < 3 {
	image_index = 0;
	image_speed = 0;
	click = 0;
}

if image_index == 11{
instance_activate_object(introHopScreen);

}



if image_index == 14{

	room_goto(Platformer);
}