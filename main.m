% ******************************************************     
%          _________________________________________________
%          |                                                                                                |
%          |      ECG De-Noising Using Extended Kernel                    |
%          |  Recursive Least Squares Adaptive Filtering                   |
%          |________________________________________________| 
%            
%   (C) Copyright Anand Krish 2015
%
%   Introduction :       The Objective of this project is the Implementation of 
%   Extended Kernel Recursive Least Squares Adaptive Filtering Algorithm 
%   for the filtering of five different noises that occur in ECG signals during 
%   Data acquisition.
%   Dependencies -

%  
% LICENSE AGREEMENT-
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3.0 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
% For further information regarding the license agreement : https://opensource.org/licenses/GPL-3.0
%  
% ******************************************************

%%
clc;
clear all;
close all;
warning off;

cd('A:\Project work\ECG Denoising\ECG_EKRLS');
addpath('A:\Project work\ECG Denoising\ECG_EKRLS\Lib','-end')
Declare_flags();

ECG_RLS();

% End of Main Program ..............................