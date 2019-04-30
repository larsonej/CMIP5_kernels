;good_step.pro
;EJL 11/1/16
; This program calculates the variable timeseries given a step change
;time series, f0, and forcing timeseries using the good et
;al. (2011,2012) step response model.

pro good_step, forcing, f0, step_response, var,y
; forcing = given forcing times series
; step_response = variable time series from step response experiment
; f0 = constant forcing in step change experiment
; var = variable time series calculated from forcing and step response
; totvar = the whole matrix used to calculate the variable time series

  
  nt = min([n_elements(forcing), n_elements(step_response)])
  y=dblarr(nt,nt)

;  df = deriv(reform(forcing))
  df=reform(forcing)-[0.d,reform(forcing)]
  for i=0,nt-1 do begin
     for j=0,i do begin
        y[i,j]=step_response[j]*df[i-j]/f0
     endfor
  endfor
  var=total(y,2)
  
END
