/// @description Insert description here
// You can write your code in this editor
if image_index == 1{
	room_goto(TitleScreen);
	audio_play_sound(Sound1, 4, false, 0.05);
	
	
}

if image_index == 12{
	HOPBOY.image_speed =0;
	HOPBOY.image_index =0;
}

if image_index == 29 {
	audio_play_sound(TitleTheme, 4, true, 0.1, 0.1);
}

if image_index == 34 or keyboard_check(vk_space){
	instance_deactivate_object(MainIntroAnimation);
	HOPBOY.image_index = 0;
	HOPBOY.image_speed = 1;
	
}

