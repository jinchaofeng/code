clc
clear
close all
warning('off','all')
% addpath(genpath('current dir'));
%---------------------------------------------------------------------------------------
%load SP3 system matrix of multiple wavelengths,
%note that the weights wi need to be assebmed before this
load('A620.mat');
load('A700.mat');
%---------------------------------------------------------------------------------------
% load boundary measurements of multiple wavelengths
load('vmeas620');
load('vmeas700');
%---------------------------------------------------------------------------------------
% assemble the data
[M,N]=size(vmeas620);
vmeas = [vmeas620;vmeas700];
vmeas2 = add_noise(vmeas,5);% add 5\% noise
y1 = vmeas2(1:M);
y2 = vmeas2(M+1:end);
%---------------------------------------------------------------------------------------
% parameters
a = 1000;
b = 1;
thr = 1e-8;

AA{1} = A620;
AA{2} = A700;
yy{1} = y1;
yy{2} = y2;
%---------------------------------------------------------------------------------------
% multispectral BLT reconstruction
time0 = cputime;

weights = BLT_bcs_reconstruction(AA,yy,a,b,thr);

time = cputime - time0;