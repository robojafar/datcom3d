%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Learjet - datcom3d v1.2                                              %
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
XW=583.6;ZW=0.0;ALIW=1.0;XCG=700.;ZCG=88.;
XH=1258.6;ZH=272.;XV=1068.;ZV=96.;
% BODY parameters
NX=12.;
       X=[0.0,28.0,164.0,244.0,328.0,460.0,584.0,656.0,772.0,...
            900.0,1156.0,1356.0];
       ZU=[0.0,24.0,68.0,124.0,132.0,136.0,140.0,140.0,140.0,...
             136.0,132.0,120.0];
       ZL=[0.0,-16.0,-24.0,-24.0,-24.0,-20.0,-20.0,-16.0,...
             -16.0,0.0,52.0,108.0];
       S=[0.0,1594.4,9534.3,17697.4,21141.2,21141.2,21683.3,...
         19897.6,17410.4,13010.0,4464.2,191.3];
% WING parameters
CHRDR_WG=274.;CHRDTP_WG=142.1;
         SSPN_WG=541.95;SSPNE_WG=456.8;CHSTAT_WG=0.25;TWISTA_WG=0.;
         SAVSI_WG=13.;DHDADI_WG=1.;
% HORIZONTAL TAIL parameters
CHRDR_HT=152.3;CHRDTP_HT=71.;
         SSPN_HT=223.5;SSPNE_HT=213.35;CHSTAT_HT=0.25;TWISTA_HT=0.;
         SAVSI_HT=25.;DHDADI_HT=0.;
% VERTICAL TAIL parameters
CHRDR_VT=296.;CHRDTP_VT=155.;SAVSI_VT=35.6;
         SSPN_VT=192.;SSPNE_VT=168.;CHSTAT_VT=.25;TWISTA_VT=0.;

% ALIERON parameters         
SPANFI_A=324.8;SPANFO_A=469.8;DELTAL_A=-10.;
DELTAR_A=10.;CHRDFI_A=43.;CHRDFO_A=33;    
         
% ELEVATOR parameters         
DELTA_E=10.;
CHRDFI_E=41.;CHRDFO_E=18.;SPANFI_E=10.;SPANFO_E=223.5;

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
camva(5.5)                   %Zoom in a/c to fit figure
view(3)                       %Apply initial viewport rotation
%camproj('perspective')       %Perspective viewing (not R2006a compatible)
rotate3d  on                  %Rotate icon enabled at start up

set(gcf,'NumberTitle','off','Name','Aircraft Plot','Color',[1 1 1]);