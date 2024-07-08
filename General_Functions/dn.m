%
% [Dy,Erreur]=dn(time,x,n)
%
% This function computes the fractional derivate of the data x
% to the order n, with n complex vector ; time is the sampling period or the time vector.
%
% With a column vector x, if the order is a scalar, Dy is a column vector ;
% if order is a row vector, Dy is a matirx and has the same number of columns as order,
% and each column is the derivate of x with the associated order.
%
% With a matrix x, if the order is a scalar, Dy is a matrix vector with the same size ;
% if order is a row vector (with the same number of column !),
% each column of Dy is the derivate of x with the associated order.
%
% Argument in :
%	time : vector time of the vector x (scalar vector) or sample time (scalar)
%	x : data (complex matrix)
%	n : order of the derivate (complex vector)
%
% Argument out :
%	Dy : data (complex matrix)
%	Erreur : error (string)
%
%Global variable
%	none
%
%   Copyright © CRONE - Dancla	04/1999
% Last revision : 07/02/2001
%
% [Dy,Erreur]=dn(time,x,n)
%