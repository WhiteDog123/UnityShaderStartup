Shader "Custom/tex"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
		_UVFlowSpeed("Flow Speed", float) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard


        sampler2D _MainTex;
	float _UVFlowSpeed;

        struct Input
        {
            float2 uv_MainTex;
        };

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x, IN.uv_MainTex.y + _Time.y * _UVFlowSpeed));
			//o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y, 0);
			//o.Emission = IN.uv_MainTex.y;
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
