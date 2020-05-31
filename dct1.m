clc; clear all; close all;
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
