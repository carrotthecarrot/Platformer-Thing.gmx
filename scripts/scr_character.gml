//Input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check(vk_up);

//Moving
move = key_left + key_right;
hspd = move * movespeed;


//Horizontal
if (place_meeting(x + hspd, y, obj_ground)) {
    while (!place_meeting(x + sign(hspd), y, obj_ground)) {
        x += sign(hspd); 
    }
    hspd = 0;
}

x += hspd;


//Jumping
if (vsp < 10) vsp += grav;
if (place_meeting(x, y + 1, obj_ground)) {
    vsp = key_jump * -jumpspeed;
}


//Vertical
if (place_meeting(x, y + vsp, obj_ground))
{
   while (!place_meeting(x, y + sign(vsp), obj_ground))
   {
    y += sign(vsp);
   }
   vsp = 0;
}

y += vsp;



//Stay on Screen
x = clamp(x, sprite_width/2  , room_width - (sprite_width/2));
y = clamp(y, sprite_height/2 ,room_height - (sprite_height/2));
