#version 100 
precision mediump float;

uniform float time;
uniform vec2 resolution;
float radius = 503330.0;
float r, g, b;
float border = 50.0;

// Returns a pseudo-random float between 0.0 and 1.0
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}
void main() {

float slowtime = time * 1.05;
	float rnd1 = random(vec2(gl_FragCoord.y, gl_FragCoord.x));

	float rnd2 = random(vec2(gl_FragCoord.y, slowtime));
	//vec2 p1 = vec2(resolution.x*rnd,resolution.y*rnd);
	
	vec2 p1 = vec2(abs(resolution.x*cos(slowtime)),abs(resolution.y*sin(slowtime)));

	vec2 p2 = vec2(abs(resolution.y*cos(slowtime)),abs(sin(slowtime)*resolution.x*sin(slowtime)));
    float thing1 = pow(pow(sin(slowtime)*gl_FragCoord.x-p1.x,3.0)+pow(gl_FragCoord.y-p1.y,3.0),(1.0/2.0));
    float diff1 = thing1 - pow(radius,1.0/2.0);

    float thing2 = pow(pow(gl_FragCoord.x-p1.x,3.0)+pow(gl_FragCoord.y-p1.y,3.0),(1.0/2.0));
    float diff2 = thing2 - pow(radius,1.0/2.0);
    g = ((diff2 * (diff1 * 0.1) * sin(slowtime))/500.0);
    r = ((diff1 * (diff2 * sin(slowtime)) * cos(slowtime))/800.0);
    b = (diff2 * sin(slowtime) * rnd1);
    gl_FragColor = vec4(r*0.2, g*0.4, b*0.4, 0.5);
}               
