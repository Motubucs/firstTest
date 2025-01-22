keyright = keyboard_check(vk_right);
keyleft = keyboard_check(vk_left);
keyup = keyboard_check_pressed(vk_up);
nokeyup = keyboard_check_released(vk_up);
keydown = keyboard_check(vk_down);
reset = keyboard_check(vk_space);
dash = keyboard_check_pressed(vk_lshift);
nexrum = keyboard_check(vk_lalt);

if nexrum {
	room_goto_next();
}

if keyboard_check(vk_escape) {
	room_goto(TitleScreen);
	audio_pause_all();
	audio_play_sound(TitleTheme, 4, true, 0.1, 0.1);
}



if true yspd += .3;

if reset{
x = 120;
y = 0;
xspd = 0;
yspd = 0;
}

if xspd > 0{
	xspd -= 0.01;}
if xspd < 0{
	xspd += 0.01;}

if keyright and keyleft{
	if xspd > 0{
	xspd -= 0.02;}
if xspd < 0{
	xspd += 0.02;}

}
			
if keydown and keyup{
	
	if yspd > 0{
		
		yspd -= 0.10}
	else if yspd < 0{
			
			yspd +=0.10}	
			}		

if keyright and xspd <=2{
	xspd += 0.10;
	}
	if xspd > 2{ xspd -= 0.10}
if !keyright and xspd > 0{
	xspd -= 0.10;
	}

if keyleft and xspd >= -2{
	xspd -= 0.10;	
}
	if xspd < -2{xspd += 0.10}
if !keyleft and xspd < 0{
	xspd += 0.10;
	
}

if keydown and yspd <=2
	yspd += 0.20;
	if yspd > 2.5{ yspd -= 0.10}
if !keydown and yspd > 0
	yspd -= 0.10;
	
if keyup and dbljmp == 2 {
	image_index = 0;
	yspd -= 4.0;
	
}
if nokeyup{
	dbljmp -=1;
}

if keyup and dbljmp == 1{
	yspd = -4.5;
	
}


if !keyup and yspd <= 0 {
    yspd += 0.10;
}

if dash and keyleft and xspd >= -2 {
		xspd -= 2;
}
if dash and keyright and xspd <= 2 {
		xspd += 2;
}


// Horizontal collision
/*if place_meeting(x + xspd, y, obj_floor) {
    while (!place_meeting(x + sign(xspd), y, obj_floor)) {
        x += sign(xspd);
    }
    xspd = 0;
	
}

// Vertical collision
if place_meeting(x, y + yspd, obj_floor) {
    while (!place_meeting(x, y + sign(yspd), obj_floor)) {
        y += sign(yspd);
    }
    if (yspd > 0) {
        dbljmp = 2;
    }
    yspd = 0;
}
*/
//horizontal collision
if place_meeting(x + xspd, y, obj_wall) {

    xspd = 0;
	if keyleft and yspd > 1{
		
		yspd -= .15;
		
		}
		
	if keyright and yspd > 1{
		
		yspd -= .15;
	
		}
	
	if keyup and xspd == 0 and dbljmp <= 0 and walljmp > 0{
		yspd = -5;
		if keyleft{
		xspd += 3;}
		if keyright{
		xspd -= 3;}
		
		walljmp -= 1;
		}
	
}

// Vertical collision
if place_meeting(x, y + yspd, obj_wall) {
	
    while (!place_meeting(x, y + sign(yspd), obj_wall)) {
        y += sign(yspd);
    }
    if (yspd > 0) {
        dbljmp = 2;
		walljmp = 4;
    }
	if keyup{
        dbljmp = 1;
    }
	
	if keyright and keydown and roll > 0{
		roll = 2;
		xspd += 2;
		if xspd >= 0 and roll < 3 and roll >= 0{
			xspd -= 0.30
		}
	}
	
    yspd = 0;
}


//old-collision
/*if place_meeting(x + xspd, y, obj_floor) == true or place_meeting(x , y + yspd, obj_floor) == true{
	

	
	
	
	
	
	if yspd > 0{
		dbljmp = 2;
		yspd = 0;
	}
	if yspd < 0{
		yspd = 0;
	}
}

if place_meeting(x + xspd, y, obj_wall) == true or place_meeting(x , y + yspd, obj_wall) == true{


if xspd > 0 or xspd < 0{
	xspd = 0;
}



}
*/


y += yspd * mspd;
x += xspd * mspd;

//sprite 



if xspd >= 0.5 and xspd < 1.9{
	face = RIGHTS
}
if xspd <= 2 and xspd >= 1.9{
	face = RIGHT
}
if xspd < -0.5 and xspd > -1.9{
	face = LEFTS
}
if xspd >= -2 and xspd <= -1.9{
	face = LEFT
}
if xspd < 0 and xspd > -.5{
	face = IDLEL
}
if xspd > 0 and xspd < .5{
	face = IDLER
}
if xspd == 0{
	face = IDLEF
}
if xspd > 0 and yspd!=0 and dbljmp > 0{
	
	face = JUMPR
	
}
if xspd < 0 and yspd != 0 and dbljmp > 0{
	
	face = JUMPL
	
}
if xspd < 0 and dbljmp <= 0{
	face = DBLJMPL
}
if xspd > 0 and dbljmp <= 0{
	face = DBLJMPR
}
if xspd > 2{
	face = DASHR
}
if xspd < -2{
	face = DASHL
}

if keyleft{
		if face = IDLEF{
		face = SLIPL;
		}
		
}

if keyright{
		if face = IDLEF{
		face = SLIPR;}
}

mask_index = idlefront;
sprite_index = sprt[face];

