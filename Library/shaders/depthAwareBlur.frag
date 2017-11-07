#version 430 core

in vec2 texcoord;
in vec2 blurtexcoord[4];
out vec4 fragColor;
uniform sampler2D texSource;
uniform sampler2D texLinearDepth;

const float weights[4] = {0.0702702703, 0.3162162162, 0.3162162162, 0.0702702703};

void main()
{
    float depth = texture(texLinearDepth, texcoord).r;
	float weightSum = 0.2270270270;
	fragColor = vec4(0.0);
    fragColor += texture(texSource, texcoord) * 0.2270270270;
    
	for(int i=0; i<4; ++i)
	{
		//float sampleDepth = texture(texLinearDepth, blurtexcoord[i]).r;
		//if(sampleDepth >= depth-0.1)
		{
			fragColor += texture(texSource, blurtexcoord[i]) * weights[i];
			weightSum += weights[i];
		}
	}
	fragColor /= weightSum;
}