out vec4 fragColor;
  
in vec2 TexCoords;

uniform sampler2D scene;
uniform sampler2D bloomBlur;
uniform float exposure;

void main()
{             
    const float gamma = 2.2;
    vec3 Color = texture(scene, TexCoords).rgb;      
    vec3 bloomColor = texture(bloomBlur, TexCoords).rgb;
    Color += bloomColor;
    vec3 result = vec3(1.0) - exp(-Color * exposure);
    fragColor = vec4(result, 1.0);
}  
