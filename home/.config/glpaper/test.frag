#version 100
precision mediump float;

uniform float time;
uniform vec2 resolution;

void main() {
    // Normalize pixel coordinates (from 0 to 1)
    vec2 uv = gl_FragCoord.xy / resolution.xy;

    // Create a color shifting effect using time and screen position
    float r = uv.x;
    float g = uv.y;
    float b = 0.5 + 0.5 * sin(time);

    // Output the final color to the built-in gl_FragColor variable
    gl_FragColor = vec4(r*0.6, g*0.6, b*0.6, 0.6);
}               
