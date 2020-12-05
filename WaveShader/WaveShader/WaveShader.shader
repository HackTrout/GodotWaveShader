shader_type canvas_item;


uniform float wave_speed : hint_range(0.0, 1.0, 0.01) = 0.5; //How Much TIME is Multiplied By
uniform float wave_amplitude : hint_range(0.0, 64.0, 0.1) = 2.4; //How Many Pixels High Should The Amplitude of the Wave Be
uniform float wave_frequency : hint_range(0.0, 10.0, 0.01) = 1.0; //Adjust the Frequency of the Sin Curve
uniform int wave_number = 2; //How Many Waves Should Be Created (Original Wave Included)
uniform float wave_distance : hint_range(0.0, 12.0, 0.1) = 8.0; //How Far in Pixels the Wave Should Travel Up And Down
uniform float wave_offset : hint_range(0.0, 256.0, 0.1) = 0.0; //How Far in Pixels Sub Waves Are Moved to the Right

void fragment() {
	vec2 displaced_uv = UV;
	
	//Vary the Y Position by a Sin Curve
	displaced_uv.y += sin((UV.x * wave_frequency) + (TIME * wave_speed)) * (TEXTURE_PIXEL_SIZE.y * wave_amplitude); 
	
	//Move the Y Position Up and Down
	displaced_uv.y += sin(TIME * wave_speed * 0.5) * (TEXTURE_PIXEL_SIZE.y * wave_distance); 
	
	//Get Color at Desplaced Position
	vec4 color = texture(TEXTURE, displaced_uv);
	
	//Repeat Process for the Number of Sub Waves
	for (int i; i < wave_number - 1; i ++) {
		//Only Work With Pixels Which Are Transparent
		if (color.a == 0.0) {
			displaced_uv = UV;
			
			//Move the Sub Wave to the Right
			displaced_uv.x += TEXTURE_PIXEL_SIZE.x * (wave_offset * float(i + 1));
			
			//Vary the Y Position by a Sin Curve
			displaced_uv.y += sin((displaced_uv.x * wave_frequency) + (TIME * wave_speed)) * (TEXTURE_PIXEL_SIZE.y * wave_amplitude); 
			
			//Move the Y Position Up and Down
			displaced_uv.y += sin((TIME * wave_speed * 0.5) + (1.0 + float(i))) * (TEXTURE_PIXEL_SIZE.y * (wave_distance + (wave_distance * float(i)))); 
			
			//Get Color at Desplaced Position
			color = texture(TEXTURE, displaced_uv);
		}
	}
	
	//Assign Color
	COLOR = vec4(color.rgb, color.a);
}