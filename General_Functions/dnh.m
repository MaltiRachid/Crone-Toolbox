%
% [Dy,Erreur]=dnh(time,x,n,level)
%
% This function computes the derivate of order n, with n complex vector,
% of the data x ; time is the sampling period or the time vector.
%
% With a column vector x, if the order is a scalar, Dy is a column vector ;
% if order is a row vector, Dy is a matirx and has the same number of columns as order, 
% and each column is the derivate of x with the associated order.
%
% With a matrix x, if the order is a scalar, Dy is a matrix vector with the same size ;
% if order is a row vector (with the same number of column !), 
% each column of Dy is the derivate of x with the associated order.
%
% The variable 'level' is the approximation of the derivative ; 
% the error is about h, h^2, etc ... according to level. [Levron2000]
%
% [Dy,Erreur]=dnh(time,x,n)
% By default, level is 1.
%
% Argument in :
%	time 	: time vector (scalar vector) or sampling period (scalar)
%	x 		: signal (complex matrix)
%	level : level of approximation (integer scalar - 1<=level<=5) (1 Dy default)
%
% Argument out :
%	Dy : derivative signal (complex matrix)
%	Erreur : error (string)
%
% Global variable
%	none
%
%   Copyright © CRONE - Dancla	14/04/2000
% Last revision : 07/02/2001
%
% [Dy,Erreur]=dnh(time,x,n,level)
%