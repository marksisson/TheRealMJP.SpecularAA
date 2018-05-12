// ================================================================================================
//
//  Specular AA Sample
//  by MJP
//  http://mynameismjp.wordpress.com/
//
//  All code and content licensed under Microsoft Public License (Ms-PL)
//
// ================================================================================================

// ================================================================================================
// Constant buffers
// ================================================================================================
cbuffer VSConstants : register(cb0)
{
    float4x4 World;
	float4x4 View;
    float4x4 WorldViewProjection;
}

// ================================================================================================
// Input/Output structs
// ================================================================================================
struct VSInput
{
    float4 PositionOS 		: POSITION;
};

struct VSOutput
{
    float4 PositionCS 		: SV_Position;
};

// ================================================================================================
// Vertex Shader
// ================================================================================================
VSOutput VS(in VSInput input)
{
    VSOutput output;

    // Calc the clip-space position
    output.PositionCS = mul(input.PositionOS, WorldViewProjection);

    return output;
}

// ================================================================================================
// Pixel Shader
// ================================================================================================
float4 PS() : SV_Target
{
    return float4(0.0f, 0.0f, 0.0f, 1.0f);
}