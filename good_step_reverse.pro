;good_step_reverse.pro
;EJL 5/1/17
; This program calculates the forcing time series given a step change
;experiment, f0, and variable timeseries using the inverted good et
;al. (2011,2012) step response model described in Larson and Portmann 2015.

pro good_step_reverse, step_T, f0, temp,forc
; step_T = variable time series from step response experiment
; f0 = constant forcing in step change experiment
; temp = variable time series from which you want to calculate F
; forc = calculated forcing times series

  
  nt = min([n_elements(step_T), n_elements(temp)])
  kern=dblarr(nt,nt)
;  del_x=deriv(step_t)
  del_x=step_t-[0.d,step_t]
  
  for i=0,nt-1 do begin
     for j=0,i do begin
        kern[i,j]=del_x[i-j]
     endfor
  endfor
  fk=invert(kern)#temp

  forc=fk*f0
 
END
