#version 100 
precision mediump float;

uniform float time;
uniform vec2 resolution;
float radius = 500.0;
float r, g, b;
float border = 5.0;

void main() {
	float thing = pow(pow(gl_FragCoord.x-900.0,2.0)+pow(gl_FragCoord.y-500.0,2.0),(1.0/2.0));
	float diff = thing - pow(radius,1.0/2.0);
    if (diff <= border) {
        r = 1.0;
        g = 1.0;
    }
    else {
    	r = 0.0;
     	g = 0.0;
    }
    float b = 0.0;
    gl_FragColor = vec4(r, g, b, 1.0);
}               
