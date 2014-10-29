pro good_map
; Prompted by a question on the Astronomers Facebook page, 
; how to make map w/ good RA labels
  
; code by: James R. A. Davenport (2014)

  ; set some things to make plots look nice
  device,decomposed = 0
  device, retain = 2
  device, true_color = 24
  !p.thick=2
  !x.thick=2
  !y.thick=2
  !p.charthick=2.5
  !p.font=0
  
  ; open the plot device to write to
  set_plot,'ps'
  device,filename='good_map.eps',/encap,/color
  
  ; set up the map
  ; (note you could get more fancy w/ the LIMITS keyword)
  map_set, /aitoff, /horizon, /noborder, 0, 65

  ; give us something to look at
  map_continents, /fill_continents, color = 150

  ; explicitly state the longitudes to label
  lons = findgen(13)*30.-180.

  ; but modify what the labels actually are, with string array
  ; (note, could be anything, including words)
  labs = string( ((lons+360) mod 360),f='(I)')
  
  ; now put a grid down, with correct labels
  map_grid, /label, lons = lons, latlab = 120,lats = 45,$
            lonnames = labs, charsize=1.1

  ; close plot device
  device,/close
  set_plot,'X'
  return
end
