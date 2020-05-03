Shader "Custom/lerpTex"
{
    Properties
    {
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_MainTex2("Albedo (RGB)", 2D) = "white" {}
		_LerpValue ("Lerp Value", Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard 

		sampler2D _MainTex;
		sampler2D _MainTex2;
		float _LerpValue;

        struct Input
        {
			float2 uv_MainTex;
			float2 uv_MainTex2;
        };

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) ;
			fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);
            o.Albedo = lerp(c.rgb, d.rgb, _LerpValue);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
