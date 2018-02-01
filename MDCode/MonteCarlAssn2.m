% clear all
clearvars
clearvars -GLOBAL
close all
format shorte


set(0, 'DefaultFigureWindowStyle', 'docked')
global C
%global Vx Vy x y Fx Fy AtomSpacing
%global Phi nAtoms time Mass0 Mass1 Pty0in Pty1in
%global LJEpsilon LJSigma Phi0 AtomType
%global MinX MaxX MinY MaxY PhiTot KETot
%global nAtoms0 nAtoms1 T T0 T1 MarkerSize
%global doPlotImage PlotCount map im PlotSize ScaleV ScaleF

C.q_0 = 1.60217653e-19;             % electron charge
C.hb = 1.054571596e-34;             % Dirac constant
C.h = C.hb * 2 * pi;                    % Planck constant
C.m_0 = 9.10938215e-31;             % electron mass
C.kb = 1.3806504e-23;               % Boltzmann constant
C.eps_0 = 8.854187817e-12;          % vacuum permittivity
C.mu_0 = 1.2566370614e-6;           % vacuum permeability
C.c = 299792458;                    % speed of light
C.g = 9.80665; %metres (32.1740 ft) per s²
C.am = 1.66053892e-27;

effMass = 0.26 * C.m_0;

vTherm = sqrt((C.kb * 300) / effMass);

stdv = vTherm/(sqrt(2));

dt = 7.5 * 10 ^ -15;

wid = 200 * 10 ^ -9;
len = 200 * 10 ^ -9;

size = 1000;

xPos = rand(1, size) .* wid;
yPos = rand(1, size) .* len;

velx = randn(1, size) .* stdv;
vely = randn(1, size) .* stdv;
vrms = sqrt((velx .^ 2) + (vely .^ 2));

pscat = 1 - (exp((-1 * dt) / (0.2 * 10 ^ -12)));
tempr = 300;

for i = 1:1000
    
    is = pscat > rand(1,size);
%     if pscat > rand
    %velx(is) = randn(1,sum(is)).* stdv;
    velx(is) = randn .* stdv;
    %vely(is) = randn(1,sum(is)).* stdv;
    vely(is) = randn .* stdv;

    vrms = sqrt((velx .^ 2) + (vely .^ 2));
%     end
    
    
    
    
    xPos(xPos >= wid) = xPos(xPos >= wid) - wid;
    xPos(xPos <= 0) = xPos(xPos <= 0) + wid;
    
    ylg = (yPos >= len);
    ylg1 = (yPos <= 0);
    
    vely(ylg) = -vely(ylg);
    vely(ylg1) = -vely(ylg1);
    
    xPosPrev = xPos;
    yPosPrev = yPos;
    
    xPos = xPosPrev + (velx .* dt);
    yPos = yPosPrev + (vely .* dt);
    
    %vrms = sqrt((velx .^ 2) + (vely .^ 2));
    tempr = (sqrt(2)*(mean(vrms) ^ 2) * effMass) / C.kb;
    

    plot (xPos, yPos, '.');
    xlabel("x-Position");
    ylabel("y-Position");
    title(["Average Temperature = " num2str(tempr)]);
    xlim([0 wid]);
    ylim([0 len]);
    pause(0.01)
    hold on
end




