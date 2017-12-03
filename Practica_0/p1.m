#!/usr/bin/octave -qf
load dat.tgz
[nrows,ncols]=size(data01)
error=0;
acert=0;
for i=1:1:nrows
 
  if(data01(i,1)+data01(i,2)-1.6>= 0 != data01(i,3))
    error=error+1;
  else
    acert=acert+1;
  endif
endfor

err=error/nrows;
iconfsup=err+1.96*(sqrt(err*(1-err)/nrows))    
iconfinf=err-1.96*(sqrt(err*(1-err)/nrows))    