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

dt = 0.2 * 10 ^ -12;

wid = 200 * 10 ^ -9;
len = 200 * 10 ^ -9;

size = 10;

xPos = rand(1, 10) .* wid;
yPos = rand(1, 10) .* len;

angs = rand(1, 10) .* 2 .* pi;

velx = cos(angs) .* vTherm;
vely = sin(angs) .* vTherm;

for i = 1:15
    xPosPrev = xPos;
    yPosPrev = yPos;
    
    
    
    xPos = xPosPrev + velx .* i;
    yPos = yPosPrev + vely .* i;
    
    
    
    plot (xPos, yPos, '.');
    pause(1)
    hold on
end




