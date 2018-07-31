%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% datcom3d Input File                                                  %
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
XW=0;ZW=0;ALIW=0;XH=0;ZH=0;ALIH=0;XV=0;YV=0;numVT=1;VERTUP=1;         %%
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
XW=2.18;
ZW=0.85;
XH=6.42;
ZH=0.42;
XV=4.96;
ZV=0.56;
ALIW=.55;
ALIH=-3.25;
% BODY parameters
NX=15;
X=[0.44,0.44,0.58,0.67,0.88,1.07,1.63,2.19,3.33,3.88,4.32,4.96,6.44,7.32,7.86];
R=[0,0.40,0.47,0.49,0.53,0.54,0.58,0.60,0.60,0.56,0.51,0.43,0.25,0.12,0.02];
ZU=[0,0.26,0.33,0.35,0.40,0.44,0.51,0.86,0.84,0.84,0.75,0.58,0.56,0.56,0.56];
ZL=[0,-0.05,-0.16,-0.32,-0.49,-0.53,-0.53,-0.53,-0.46,-0.39,-0.32,-0.21,0.04,0.19,0.35];
% WING parameters
CHRDTP_WG = 1.19;
CHRDR_WG  = 1.74;
SSPN_WG   = 5.40;
SSPNE_WG  = 4.81;
SAVSI_WG  = 0;
CHSTAT_WG = 0;
TWISTA_WG = 3;
DHDADI_WG = 1.5;
% HORIZONTAL TAIL parameters
CHRDTP_HT = 0.81;
CHRDR_HT  = 1.35;
SSPN_HT   = 2.00;
SSPNE_HT  = 1.88;
SAVSI_HT  = 7.00;
CHSTAT_HT = 0;
TWISTA_HT = 0;
DHDADI_HT = 0;
% VERTICAL TAIL parameters
CHRDTP_VT = 0.67;
CHRDR_VT  = 2.89;
SSPN_VT   = 1.49;
SSPNE_VT  = 1.49;
SAVSI_VT  = 79.01;
CHSTAT_VT = 0;
CHRDBP_VT = 1.16;
SSPNOP_VT = 1.12;
SAVSO_VT  = 42.63;
TC_VT     = 0.09;

% DELTA_F=30;
% CHRDFI_F=1.037*.3048,CHRDFO_F=0.863*.3048,SPANFI_F=1.955*.3048,SPANFO_F=11.512*.3048;
% 
% CHRDFI_A=1.6*.3048,CHRDFO_A=0.863*.3048,SPANFI_A=11.512*.3048,SPANFO_A=5.12;
% 
% DELTA_E=-15;
% CHRDFI_E=2.0*.3048,CHRDFO_E=1.12*.3048,SPANFI_E=.8*.3048,SPANFO_E=5.86*.3048;
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
    colormap([1 .6 .1])      %Set a/c to gold
    %colormap([0 0 1])         %Set a/c to blue
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