%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% datcom3d v1.2 Input File                                             %
% Airbus A380                                                          %
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
  XW=55.0;                                                                                                                                                                                       
  ZW=13.4;                                                                                                                                                                                       
  ALIW=2.5;                                                                                                                                                                                      
  XH=195.0;                                                                                                                                                                                      
  ZH=26.8;                                                                                                                                                                                       
  ALIH=0.0;	                                                                                                                                                                                     
  XV=170.0;  

% BODY parameters
  NX=16.0;                                                                                                                                                                                         
  X=  [0.0,  3.0,  6.0,  9.0, 12.0, 15.0,  18.0,  21.0,...                                                                                                                                          
             24.0, 27.0, 30.0, 33.0, 36.0, 42.0, 185.0, 238.0];                                                                                                                                          
  R=  [0.0,  3.8,  5.6,  6.9,  7.9,  9.0, 9.45, 10.0,...                                                                                                                                            
             10.4, 10.7, 11.0, 11.1, 11.5, 11.7, 11.7,  0.0];                                                                                                                                            
  ZU= [0.0, 3.0, 4.5, 5.5, 6.3, 7.2,  7.6, 8.0,...                                                                                                                                                  
              8.3, 8.6, 8.8, 8.9, 9.2, 9.4, 20.0, 0.0];        
  % Note: ZL in for005.dat did not have (-) signs
  ZL= [0.0, -1.4, -2.0, -2.5, -2.8, -3.2, -3.4, -3.6,...                                                                                                                                                   
              -3.7, -3.8, -4.0, -4.0, -4.12, -4.2, -4.0, 0.0]; 

% WING parameters (add suffix "_WG" to variables)
  CHRDTP_WG=15.0;                                                                                                                                                                                   
  SSPNE_WG=118.8;                                                                                                                                                                                   
  SSPN_WG=130.825;                                                                                                                                                                                  
  CHRDR_WG=67.0;                                                                                                                                                                                    
  SAVSI_WG=33.5;                                                                                                                                                                                    
  CHSTAT_WG=0.25;                                                                                                                                                                                   
  TWISTA_WG=-3.0;                                                                                                                                                                                   
  DHDADI_WG=7.0; 

% WING FLAPS (add suffix "_F" to variables)
  CHRDFI_F=10.2;                                                                                                                                                                                    
  CHRDFO_F=6.0;                                                                                                                                                                                    
  SPANFI_F=15.0;                                                                                                                                                                                   
  SPANFO_F=84.0; 
 
% WING AILERONS (add suffix "_A" to variables)
  SPANFI_A=94.0;                                                                                                                                                                                  
  SPANFO_A=125.6;                                                                                                                                                                                                                                                                                                                      
  CHRDFI_A=7.0;                                                                                                                                                                                    
  CHRDFO_A=5.0; 
 
% HORIZONTAL TAIL parameters (add suffix "_HT" to variables)
  CHRDTP_HT=15.0;                                                                                                                                                                                   
  SSPNE_HT=43.2;                                                                                                                                                                                    
  SSPN_HT=49.2;                                                                                                                                                                                     
  CHRDR_HT=30.0;                                                                                                                                                                                    
  SAVSI_HT=35.0;                                                                                                                                                                                    
  CHSTAT_HT=0.25;                                                                                                                                                                                   
  TWISTA_HT=0.0;		                                                                                                                                                                                  
  DHDADI_HT=2.0;
 
% ELEVATOR (add suffix "_E" to variables)
  CHRDFI_E=8.4;                                                                                                                                                                                    
  CHRDFO_E=4.0;                                                                                                                                                                                    
  SPANFI_E=12.5;                                                                                                                                                                                   
  SPANFO_E=44.0;  
 
% VERTICAL TAIL parameters (add suffix "_VT" to variables)
% For twin vertical tails, you need to define:
%   numVT - number of vertical tails (for twin VT, should be 2)
%      YV - distance from FRL to stb. VT vertex
  CHRDTP_VT=17.3;                                                                                                                                                                                   
  SSPNE_VT=47.0;                                                                                                                                                                                    
  SSPN_VT=66.0;                                                                                                                                                                                     
  CHRDR_VT=40.0;                                                                                                                                                                                    
  SAVSI_VT=38.0;                                                                                                                                                                                    
  CHSTAT_VT=0.25;   

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

%showplottool('plotbrowser')   %Enable the plot browser on startup
set(gcf,'NumberTitle','off','Name','Aircraft Plot','Color',[1 1 1]);