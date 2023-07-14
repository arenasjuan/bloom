uniform vec3 uLight, uLight2, uColor;

in vec3 vNormal;
in vec3 vPosition;

layout (location = 0) out vec4 fragColor;
layout (location = 1) out vec4 BrightColor;

void main() {
  vec3 tolight = normalize(uLight - vPosition);
  vec3 tolight2 = normalize(uLight2 - vPosition);
  vec3 normal = normalize(vNormal);

  float diffuse = max(0.0, dot(normal, tolight));
  diffuse += max(0.0, dot(normal, tolight2));
  vec3 intensity = uColor * diffuse;

  fragColor = vec4(intensity, 1.0);
  float brightness = dot(intensity, vec3(0.2126, 0.7152, 0.0722));
  if(brightness > 1.0){
      BrightColor = vec4(intensity, 1.0);
    }
  else{
      BrightColor = vec4(0.0, 0.0, 0.0, 1.0);
    }
}


//vec3(fragColor.x, fragColor.y, fragColor.z)