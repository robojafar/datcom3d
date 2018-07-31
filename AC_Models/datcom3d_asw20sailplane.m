%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% datcom3d v1.2 Input File                                             %
% ASW-20 SAILPLANE                                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
clf

%%% VISUALIZATION and RESOLUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wframe = 1;       %0 = Shaded model
                  %1 = Wireframe model (default)
                
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
  XW=7.236;ZW=.958;XH=21.494;ZH=4.256;
  ZV=0.0;XV=20.324;ALIW=0.;ALIH=0.;
  
% BODY parameters
  NX=20.0; 
  X=[0.,0.638,1.383,2.075,2.788,3.458,4.150,4.895,5.533,6.278,6.917,... 
   7.661,8.406,9.790,11.173,11.918,12.556,13.993,14.684,22.400]; 
  R=[0.053,.292,.532,.718,.824,.931,1.010,1.064,1.090,1.090,1.064,... 
   .984,.904,.771,.665,.631,.596,.562,.528,.186];
  ZU=[.085,.479,.798,1.100,1.330,1.543,1.702,1.808,1.883,1.926,... 
   1.883,1.862,1.755,1.543,1.321,1.219,1.102,.957,.883,.160]; 
  ZL=[-.021,-.319,-.532,-.691,-.809,-.904,-.957,-1.01,-1.01,-.957,... 
   -.872,-.745,-.638,-.479,-.340,-.287,-.234,-.160,-.16,-.212]; 

% WING parameters (add suffix "_WG" to variables)
  CHRDR_WG=2.897;CHRDTP_WG=1.249;CHRDBP_WG=2.247;SSPN_WG=24.67;SSPNOP_WG=9.089; 
  DHDADI_WG=3.;DHDADO_WG=3.;CHSTAT_WG=.25;TWISTA_WG=0.;SSPNDD_WG=9.089;
  SSPNE_WG=23.67;SAVSI_WG=0.;SAVSO_WG=0.0;

% WING FLAPS (add suffix "_F" to variables)
  SPANFI_F=.0;SPANFO_F=9.089;CHRDFI_F=.532;CHRDFO_F=.372;

% WING AILERONS (add suffix "_A" to variables)

% HORIZONTAL TAIL parameters (add suffix "_HT" to variables)
  CHRDR_HT=1.809;CHRDTP_HT=1.171;SSPN_HT=3.618;SAVSI_HT=4.; 
  SSPNE_HT=3.400;CHSTAT_HT=.25;
  DHDADI_HT=0.;DHDADO_HT=0.;

% ELEVATOR (add suffix "_E" to variables)

% VERTICAL TAIL parameters (add suffix "_VT" to variables)
% For twin vertical tails, you need to define:
%   numVT - number of vertical tails (for twin VT, should be 2)
%      YV - distance from FRL to stb. VT vertex
  CHRDR_VT=3.322;CHRDTP_VT=2.039;SAVSI_VT=14.;SSPN_VT=4.243;SSPNOP_VT=0.;
  SSPNE_VT=4.1;CHRDBP_VT=0.;SAVSO_VT=0.;CHSTAT_VT=.25;

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
camva(3.5)                   %Zoom in a/c to fit figure
view(3)                       %Apply initial viewport rotation
%camproj('perspective')       %Perspective viewing (not R2006a compatible)
rotate3d  on                  %Rotate icon enabled at start up

%showplottool('plotbrowser')   %Enable the plot browser on startup
set(gcf,'NumberTitle','off','Name','Aircraft Plot','Color',[1 1 1]);