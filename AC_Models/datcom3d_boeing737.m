%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Boeing 737 - datcom3d v1.2                                           %
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
  XW=28.3;
  ZW=-1.4;
  ALIW=1.0;
  XH=76.6;
  ZH=6.2;
  XV=71.1;
  ZV=7.6;
% BODY parameters
 NX=14.; 
  X=[0.,1.38,4.83,6.90,8.97,13.8,27.6,55.2,...
   65.6,69.0,75.9,82.8,89.7,90.4];
  ZU=[.69,2.07,3.45,4.38,5.87,5.90,8.28,... 
   8.28,8.28,8.28,7.94,7.59,7.50,6.9]; 
  ZL=[-.35,-1.73,-3.45,-3.80,-4.14,-4.49,-4.83,... 
   -4.83,-3.45,-2.76,-0.81,1.04,4.14,6.21];
  R=[.34,1.38,2.76,3.45,4.14,5.18,6.21,6.21,... 
   5.87,5.52,4.14,2.76,.69,0.0]; 
  S=[.55,8.23,28.89,44.31,65.06,92.63,127.81,... 
   127.81,108.11,95.68,56.88,28.39,3.64,0.11]; 
% WING parameters
  CHRDR_WG=23.8;CHRDTP_WG=4.8;CHRDBP_WG=12.4; 
  SSPN_WG=46.9;SSPNOP_WG=31.1;SSPNE_WG=40.0;CHSTAT_WG=.25;
  SAVSI_WG=29.;SAVSO_WG=26.0;DHDADI_WG=0.;DHDADO_WG=4.; TC_WG=.18;
% HORIZONTAL TAIL parameters
  CHRDR_HT=12.4;CHRDTP_HT=4.1;
  SSPN_HT=17.6;SSPNE_HT=15.87;CHSTAT_HT=.25;TWISTA_HT=0.; 
  SAVSI_HT=31.;DHDADI_HT=9.;
% VERTICAL TAIL parameters
  CHRDR_VT=15.9;CHRDTP_VT=4.8;SAVSI_VT=33.; 
  SSPN_VT=27.6;SSPNOP_VT=0.;SSPNE_VT=20.7;CHSTAT_VT=.25;TWISTA_VT=0.;

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