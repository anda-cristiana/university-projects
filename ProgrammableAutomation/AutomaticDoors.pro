CoDeSys+   �                    @        @   2.3.9.62�    @   ConfigExtension�          CommConfigEx7             CommConfigExEnd   ME�                  IB                    % QB                    %   ME_End   CM�      CM_End   CT�   ��������   CT_End   ConfigExtensionEnd/    @                             H2K` +    @      ��������             p/J`        �   @                 PLC_PRG           INIT                           _INIT                           STEP2                            _STEP2                            STEP4                            _STEP4                            STEP3                            _STEP3                            STEP5                            _STEP5                            STEP6                            _STEP6                            STEP7                            _STEP7                            STEP9                            _STEP9                            STEP8                            _STEP8                            STEP10                            _STEP10                                             /K`  @    ����           SIMULARE_USI                             =)K`  @    ����            
 �    
   ( K      K   Y     K   g     K   u     K   �                 �         +     ��localhost ����� � N�]w�\E N�]w            @       H� ܯ�   �    @         �\E     p� O�� �� L�   ӳ� pɉ�              �\E     �  x� T� ��� t�� 	   k��       �\E pɉ8i��� 8� L� 08� ������ ��                  �� 8i���     ,   ,                                                        K        @   p/J`�         ��������                     CoDeSys 1-2.2   ����  ��������                                �      
   �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �          �          �          �         �          �          �          �          �         �      �   �       P  �          �         �       �  �                    ~          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �       @  �       @  �       @  �       @  �       @  �       @  �         �         �          �       �  M         N          O          P          `         a          t          y          z          b         c          X          d         e         _          Q          \         R          K          U         X         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          ^          f         g          h          i          j          k         F          H         J         L          N         P         R          U         S          T          V          W          �          �          l          o          p          q          r          s         u          �          v         �          �      ����|         ~         �         x          z      (   �          �         %         �          �          �         @         �          �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �          �                            I         J         K          	          L         M          �                             �          P         Q          S          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        ����������������  ��������              Standard Parameter OD                        ����    ���                  ����    ���                                Choose entry type.      
      BOOL   8-bit-Integer   16-bit-Integer   32-bit-Integer   byte   word   double word   real   string   long real (64-bit)                          low   middle   high                       	   read only
   write only
   read-write                             Standard Variable OD                        ����    ���                  ����    ���                          low   middle   high                       	   read only
   write only
   read-write                                                 �  	   	   Name                 ����
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write       Variable    	             ����
   Value                Variable       Min                Variable       Max                Variable          5  
   	   Name                 ����
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write    	   Type          ~         INT   UINT   DINT   UDINT   LINT   ULINT   SINT   USINT   BYTE   WORD   DWORD   REAL   LREAL   STRING    
   Value                Type       Default                Type       Min                Type       Max                Type          5  
   	   Name                 ����
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write    	   Type          ~         INT   UINT   DINT   UDINT   LINT   ULINT   SINT   USINT   BYTE   WORD   DWORD   REAL   LREAL   STRING    
   Value                Type       Default                Type       Min                Type       Max                Type          d        Member    	             ����   Index-Offset                 ��         SubIndex-Offset                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write       Min                Member       Max                Member          �  	   	   Name                 ����   Member    	             ����
   Value                Member    
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write       Min                Member       Max                Member          �  	   	   Name                 ����
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write       Variable    	             ����
   Value                Variable       Min                Variable       Max                Variable                         ����  ��������               �   _Dummy@    @   @@    @   @             ��@             ��@@   @     �v@@   ; @+   ����  ��������                                  �v@      4@   �             �v@      D@   �                       �       @                           �f@      4@     �f@                �v@     �f@     @u@     �f@        ���           __not_found__-1__not_found__    __not_found__     IB          % QB          % MB          %    p/J`	�*K`     ��������           VAR_GLOBAL
END_VAR
                                                                                  "   , � Q �;             NewTask2         
PLC_PRG();����                NewTask         simulare_usi();����               �*K`                 $����  ��������               ��������           Standard p/J`	p/J`      ��������                         	�*K`     ��������           VAR_CONFIG
END_VAR
                                                                                   '              ,   n           Global_Variables q/J`	�*K`     ��������        �   VAR_GLOBAL
	M1_deschidere: BOOL;
	M1_inchidere: BOOL;
	M2_deschidere: BOOL;
	M2_inchidere: BOOL;
	l1_deschis: BOOL;
	l1_inchis: BOOL;
	l2_deschis: BOOL;
	l2_inchis: BOOL;
	prezenta: BOOL;
	timp: TIME;
	pas1: INT;
	pas2: INT;
END_VAR
                                                                                               '           	     ��������           Variable_Configuration q/J`	q/J`	     ��������           VAR_CONFIG
END_VAR
                                                                                                 ~   |0|0 @t    @R   Arial @       HH':'mm':'ss @       dd'-'MM'-'yyyy   dd'-'MM'-'yyyy HH':'mm':'ss�����                               ,     �   ���  �3 ���   � ���     
    @��  ���     @      DEFAULT             System      ~   |0|0 @t    @R   Arial @       HH':'mm':'ss @       dd'-'MM'-'yyyy   dd'-'MM'-'yyyy HH':'mm':'ss�����                      )   HH':'mm':'ss @                             dd'-'MM'-'yyyy @       '     
   ,     >�           PLC_PRG  1K`	/K`      ��������           PROGRAM PLC_PRG
VAR
END_VAR       Init      ��������           Action Init  1K`Z   M1_deschidere:= FALSE;
M1_inchidere:=FALSE;
M2_deschidere:= FALSE;
M2_inchidere:=FALSE;       prezenta           Step2        ��������           Action Step2 - Entry  1K`   M1_deschidere:=TRUE;  
   l1_deschis         Step4        ��������           Action Step4 - Entry  1K`   M1_deschidere:=FALSE;          Step3        ��������           Action Step3 - Entry  1K`   M2_deschidere:=TRUE;  
   l2_deschis         Step5        ��������           Action Step5 - Entry  1K`   M2_deschidere:=FALSE;         NOT prezenta         Step6        ��������           Action Step6 - Entry  1K`   timp:=TIME();       prezenta   %   NOT prezenta AND TIME() - timp > t#2s           Step7        ��������           Action Step7 - Entry  1K`   M1_inchidere:=TRUE;     l1_inchis OR prezenta         Step9        ��������           Action Step9 - Entry  1K`   M1_inchidere:=FALSE;          Step8        ��������           Action Step8 - Entry  1K`   M2_inchidere:=TRUE;     l2_inchis OR prezenta         Step10        ��������           Action Step10 - Entry  1K`   M2_inchidere:=FALSE;         TRUE     Init   Step6d                     , f�� ��           simulare_usi *K`	=)K`      ��������        "   PROGRAM simulare_usi
VAR
END_VAR$  IF M1_deschidere THEN
	pas1:=pas1+3;
END_IF;

IF M1_inchidere THEN
	pas1:=pas1-3;
END_IF;

l1_inchis:=(pas1=0);
l1_deschis:=(pas1>100);

IF M2_deschidere THEN
	pas2:=pas2+3;
END_IF;

IF M2_inchidere THEN
	pas2:=pas2-3;
END_IF;

l2_inchis:=(pas2=0);
l2_deschis:=(pas2>100);                   , ~ ����           simulare_usi �*K`
    @�����1K`   d                                                                                                          
    @        � d � 7� �   ��� �   ��                                              @         .-pas1                 ���        @	                       @                                                                                                           
    @        � d A7�   ��� �   ��                                              @         .pas2                ���        @	                       @                                                                                                          
    @        � < � Q � F   �        �                                  	   .prezenta        @                          ���        @	 	   .prezenta                 @             �   ��   �   ��   � � � ���     �   ��   �   ��   � � � ���                  ����  ��������                            ��������           2 �  �           ����������������  
             ����  ��������        ����  ��������                      POUs                PLC_PRG  
                   simulare_usi     ����          
   Data types  ����              Visualizations                simulare_usi     ����              Global Variables                Global_Variables                     Variable_Configuration  	   ����                                         ��������             p/J`                         	   localhost            P      	   localhost            P      	   localhost            P     u/J`    Lb��