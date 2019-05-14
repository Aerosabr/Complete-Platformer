if (hascontrol)
{
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);

	var move = key_right - key_left;
	//calculate movement

	hsp = move * walksp;
	vsp = vsp + grv;
	if(place_meeting(x,y+1,obj_wall)) && (key_jump)
	{
		vsp = -9;
	}
	//horizontal movement

	if (place_meeting(x+hsp,y,obj_wall))
	{
		while (!place_meeting(x+sign(hsp),y,obj_wall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}
x = x + hsp;

//vertical movement

if (place_meeting(x,y+vsp,obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//animation
if(!place_meeting(x,y+1,obj_wall))
{
	sprite_index = spr_jump
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if(hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_run;
	}
}

if (hsp != 0) image_xscale = sign(hsp);