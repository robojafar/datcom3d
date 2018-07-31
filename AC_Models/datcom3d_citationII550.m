%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation II 550 - datcom3d v1.2                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
clf

%%% VISUALIZATION and RESOLUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wframe = 1;       %0 = Shaded model
                  %1 = Wireframe model
                
fusres = 20;      %Fuselage resolution
wgres  = 20;      %Wing,HT,VT resolution

%%% (DO NOT CHANGE VALUES IN THIS BOX) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
XW=0;ZW=0;ALIW=0;XH=0;ZH=0;ALIH=0;XV=0;ZV=0;YV=0;numVT=1;VERTUP=1;    %%
NX=0;X=zeros(20);S=zeros(20);R=zeros(20);ZU=zeros(20);ZL=zeros(20);   %%
CHRDR_WG=0;CHRDBP_WG=0;CHRDTP_WG=0;SSPN_WG=0;SSPNOP_WG=0;SAVSI_WG=0;  %%
SAVSO_WG=0;CHSTAT_WG=0;DHDADI_WG=0;DHDADO_WG=0;TC_WG=.12;             %%
CHRDR_HT=0;CHRDBP_HT=0;CHRDTP_HT=0;SSPN_HT=0;SSPNOP_HT=0;SAVSI_HT=0;  %%
SAVSO_HT=0;CHSTAT_HT=0;DHDADI_HT=0;DHDADO_HT=0;TC_HT=.12;             %%
CHRDR_VT=0;CHRDBP_VT=0;CHRDTP_VT=0;SSPN_VT=0;SSPNOP_VT=0;SAVSI_VT=0;  %%
SAVSO_VT=0;CHSTAT_VT=0;TC_VT=.12;                                     %%
SPANFI_F=0;SPANFO_F=0;CHRDFI_F=0;CHRDFO_F=0;DELTA_F=0;                %%
SPANFI_A=0;SPANFO_A=0;CHRDFI_A=0;CHRDFO_A=0;DELTAL_A=0;DELTAR_A=0;    %%
SPANFI_E=0;SPANFO_E=0;CHRDFI_E=0;CHRDFO_E=0;DELTA_E=0;                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% INPUT PARAMETERS BELOW %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SYNTHS parameters
 XW=19.1;                                                                                                                                                                                      
 ZW=3.125;                                                                                                                                                                                      
 ALIW=2.5;                                                                                                                                                                                      
 XH=39.2;                                                                                                                                                                                       
 ZH=7.75; 
 ALIH=0.0;                                                                                                                                                                                      
 XV=32.1; 
 ZV=5.5; % Note: ZV is missing in input file
 XVF=-45.0; 
% BODY parameters
 NX=8.0;                                                                                                                                                                                          
 X=[0.0,1.0,2.7,6.0,8.8,28.5,39.4,44.8];                                                                                                                                                         
 R=[0.0,1.25,2.1,2.7,2.76,2.7,1.25,0.0];                                                                                                                                                         
 ZU=[3.5,4.3,4.8,5.5,7.4,7.4,6.5,5.7];                                                                                                                                                           
 ZL=[3.5,2.5,2.25,2.1,2.0,2.2,4.3,5.7];  
% WING parameters
 CHRDTP_WG=3.01;                                                                                                                                                                                   
 SSPNE_WG=23.46;                                                                                                                                                                                   
 SSPN_WG=25.85;                                                                                                                                                                                    
 CHRDR_WG=9.4;                                                                                                                                                                                     
 SAVSI_WG=1.3;                                                                                                                                                                                     
 CHSTAT_WG=0.25;                                                                                                                                                                                   
 TWISTA_WG=-3.0;                                                                                                                                                                                   
 DHDADI_WG=3.6;   
% HORIZONTAL TAIL parameters
 CHRDTP_HT=2.48;                                                                                                                                                                                   
 SSPNE_HT=9.21;                                                                                                                                                                                    
 SSPN_HT=9.42;                                                                                                                                                                                     
 CHRDR_HT=4.99;                                                                                                                                                                                    
 SAVSI_HT=5.32;                                                                                                                                                                                    
 CHSTAT_HT=0.25;                                                                                                                                                                                   
 TWISTA_HT=0.0;		                                                                                                                                                                                  
 DHDADI_HT=9.2;
% VERTICAL TAIL parameters
 SSPNE_VT=8.85;                                                                                                                                                                                    
 SSPN_VT=9.42;                                                                                                                                                                                     
 CHRDR_VT=8.3;                                                                                                                                                                                     
 SAVSI_VT=32.3;                                                                                                                                                                                    
 CHSTAT_VT=0.25;  
 CHRDTP_VT=3.63;
% FLAPS
CHRDFI_F=2.0;                                                                                                                                                                                    
CHRDFO_F=1.6;                                                                                                                                                                                    
SPANFI_F=5.78;                                                                                                                                                                                   
SPANFO_F=15.3;   
% AILERONS
SPANFI_A=15.2;                                                                                                                                                                                   
SPANFO_A=24.0;                                                                                                                                                                                                                                                                                                                                                               
CHRDFI_A=1.87;                                                                                                                                                                                   
CHRDFO_A=1.2; 
% ELEVATOR
CHRDFI_E=1.94;                                                                                                                                                                              
CHRDFO_E=1.03;                                                                                                                                                                               
SPANFI_E=0.7;                                                                                                                                                                                 
SPANFO_E=9.21;

%%% PLOTTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
warning off MATLAB:divideByZero
hold on

plotFuselage(NX,X,S,R,ZU,ZL,fusres)
plotWing(XW,ZW,ALIW,CHRDR_WG,CHRDBP_WG,CHRDTP_WG,SSPN_WG,SSPNOP_WG,SAVSI_WG,SAVSO_WG,CHSTAT_WG,DHDADI_WG,DHDADO_WG,...
         SPANFI_F,SPANFO_F,CHRDFI_F,CHRDFO_F,DELTA_F,SPANFI_A,SPANFO_A,CHRDFI_A,CHRDFO_A,DELTAL_A,DELTAR_A,TC_WG,wgres)
plotHT(XH,ZH,ALIH,CHRDR_HT,CHRDBP_HT,CHRDTP_HT,SSPN_HT,SSPNOP_HT,SAVSI_HT,SAVSO_HT,CHSTAT_HT,DHDADI_HT,DHDADO_HT,...
       SPANFI_E,SPANFO_E,CHRDFI_E,CHRDFO_E,DELTA_E,TC_HT,wgres)
   plotVT(XV,YV,ZV,CHRDR_VT,CHRDBP_VT,CHRDTP_VT,SSPN_VT,SSPNOP_VT,SAVSI_VT,SAVSO_VT,CHSTAT_VT,VERTUP,TC_VT,wgres)
if numVT > 1
    plotVT(XV,-YV,ZV,CHRDR_VT,CHRDBP_VT,CHRDTP_VT,SSPN_VT,SSPNOP_VT,SAVSI_VT,SAVSO_VT,CHSTAT_VT,VERTUP,TC_VT,wgres)
end
%%% VIEWPORT/FIGURE PROPERTIES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if wframe == 0
    %colormap([1 .7 .1])      %Set a/c to gold
    colormap([0 0 1])         %Set a/c to blue
    shading interp            %Interpolated shading
    lighting gouraud          %Smooth airplane mesh
    %camlight right           %Apply a light source  
    
    %Custom Lighting Options, Note:[X Y Z]
    light('Position',[1 -2 1],'Style','infinite');
    light('Position',[1 2 1],'Style','infinite');
    light('Position',[0 0 -6],'Style','infinite');
else
    colormap([1 1 1])         %Set a/c to white
end    

axis off                      %Turn off axis
axis equal                    %Correct aspect ratio
camva(4.5)                   %Zoom in a/c to fit figure
view(3)                       %Apply initial viewport rotation
%camproj('perspective')       %Perspective viewing (not R2006a compatible)
rotate3d  on                  %Rotate icon enabled at start up

set(gcf,'NumberTitle','off','Name','Aircraft Plot','Color',[1 1 1]);