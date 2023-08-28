shader_type spatial;

uniform sampler2D sprite_texture : source_color, filter_nearest;

vec3 palette(float t){
	vec3 a = vec3(0.5,0.5,0.5);
	vec3 b = vec3(0.5,0.5,0.5);
	vec3 c = vec3(1.0,1.0,1.0);
	vec3 d = vec3(0.22, 0.3333,0.6666);
	
	return a + b * cos( 6.28318 * ( c * t * d )); 
}

void fragment() {
	
	vec4 color = vec4(1.0,1.0,1.0,1.0);
	vec2 uv = (UV * 2.0) - vec2(1.0,1.0);
	vec2 uv0 = uv;
	
	vec3 finalColor = vec3(0.0,0.0,0.0);
	
	for (float i = 0.0; i < 4.0; i++){
		
		uv = fract(uv * 1.5) - 0.5;
	
		float d = length(uv) * exp(-length(uv0));
		vec3 col = palette(length(uv0) + i*0.4 + TIME * 0.4);
	
		d = sin(d*2.0 + TIME)/8.0;
		d = abs(d);
		d = pow( 0.01 / d, 1.2 );
	
		finalColor += col * d;
	}

	ALBEDO = finalColor;
	
	}
