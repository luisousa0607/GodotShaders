shader_type spatial;

void vertex() {
	
	VERTEX.y *= sin(TIME * 1.0 * VERTEX.x ) * 0.06;
}

void fragment() {
	ALBEDO = vec3(0.4,0.9,0.5);
}
