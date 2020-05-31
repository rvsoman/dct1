%%
clc; clear all; close all;
% I=imread('lena.jpg');
% rgb_I=rgb2gray(I);
% x=dct2((rgb_I));
% X=floor((x));
% F=real(fft(x));
% tf=isequal(X,F);
inp=[1 2 6 7; 3 5 8 13; 4 9 12 14; 10 11 15 16]; %input('enter initial array');
[row, cols]=size(inp);  %number of rows, cols of input
arr_zero=zeros(1,row*cols);
arr_zero(1)=inp(1,1);
flag=1;
for i=1:2*cols-1
    if i<=cols
        if mod(i,2)==0
            j=i;
            for k=1:i
                arr_zero(flag)=inp(k,j);
                flag=flag+1;j=j-1;    
        end
        else
            k=i;
            for j=1:i   
                arr_zero(flag)=inp(k,j);
                flag=flag+1;k=k-1; 
            end
        end
    else
        if mod(i,2)==0
            p=mod(i,cols); j=cols;
            for k=p+1:cols
                arr_zero(flag)=inp(k,j);
                flag=flag+1;j=j-1;    
        end
        else
            p=mod(i,cols);k=cols;
            for j=p+1:cols   
                arr_zero(flag)=inp(k,j);
                flag=flag+1;k=k-1; 
            end
        end
    end
end

disp(arr_zero); %final output 

%%

inp=[1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];
[row, cols]=size(inp);
Vect=zeros(1,row*cols);
Vect(1)=inp(1,1);
flag=1;


% Inverse zigzag scan of a matrix
% Arguments are: a 1-by-m*n array, 
% where m & n are vertical & horizontal sizes of an output matrix.
% Function returns a two-dimensional matrix of defined sizes,
% consisting of input array items gathered by a zigzag method.
%
% Alexey S. Sokolov a.k.a. nICKEL, Moscow, Russia
% June 2007
% alex.nickel@gmail.com
% function output = izigzag(in, vmax, hmax)
% initializing the variables
%----------------------------------
h = 1;
flag = 1;
vmin = 1;
hmin = 1;
output = zeros(vmax, hmax);
k = 1;
%----------------------------------
while ((flag <= vmax) & (h <= hmax))
    if (mod(h + flag, 2) == 0)                % going up
        if (flag == vmin)
            output(flag, h) = in(k);
            if (h == hmax)
	      flag = flag + 1;
	    else
              h = h + 1;
            end;
            k = k + 1;
        elseif ((h == hmax) & (flag < vmax))
            output(flag, h) = in(k);
            k;
            flag = flag + 1;
            k = k + 1;
        elseif ((flag > vmin) & (h < hmax))
            output(flag, h) = in(k);
            flag = flag - 1;
            h = h + 1;
            k = k + 1;
        end;
        
    else                                   % going down
       if ((flag == vmax) & (h <= hmax))
            output(flag, h) = in(k);
            h = h + 1;
            k = k + 1;
        
       elseif (h == hmin)
            output(flag, h) = in(k);
            if (flag == vmax)
	      h = h + 1;
	    else
              flag = flag + 1;
            end;
            k = k + 1;
       elseif ((flag < vmax) & (h > hmin))
            output(flag, h) = in(k);
            flag = flag + 1;
            h = h - 1;
            k = k + 1;
        end;
    end;
    if ((flag == vmax) & (h == hmax))
        output(flag, h) = in(k);
        break
    end;
end;