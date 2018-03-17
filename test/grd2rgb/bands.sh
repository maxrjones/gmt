#!/bin/bash
#
#       $Id$

ps=bands.ps

gmt grd2rgb "${src:-.}"/Uluru.ras -Gband_%c.nc 
gmt psimage "${src:-.}"/Uluru.ras -Dx0/0+w5i -X0.4i -Y4i -F+pthicker+c0 -K > $ps
gmt makecpt -Cblack,red -T0,255 -N -Z > t.cpt
gmt grdimage band_r.nc -Ct.cpt -JX5i/0 -O -K -X5.2i -B0 >> $ps
gmt makecpt -Cblack,green -T0,255 -N -Z > t.cpt
gmt grdimage band_g.nc -Ct.cpt -J -O -K -X-5.2i -Y-3.3i -B0 >> $ps
gmt makecpt -Cblack,blue -T0,255 -N -Z > t.cpt
gmt grdimage band_b.nc -Ct.cpt -J -O -X5.2i -B0 >> $ps
