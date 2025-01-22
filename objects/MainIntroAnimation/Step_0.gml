/// @description Insert description here
// You can write your code in this editor
if image_index == 1{
	room_goto(TitleScreen);
}

if image_index == 29 {
	audio_play_sound(TitleTheme, 4, true, 0.1, 0.1);
}

if image_index == 34 or keyboard_check(vk_space){
	instance_deactivate_object(MainIntroAnimation);
	
}

