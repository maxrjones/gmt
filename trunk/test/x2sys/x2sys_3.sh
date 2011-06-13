#!/bin/bash
# $Id: x2sys_3.sh,v 1.1 2011-06-13 04:07:26 guru Exp $
#
# This is original Figure 3 script from
# Wessel, P. (2010), Tools for analyzing intersecting tracks: the x2sys package,
# Computers & Geosciences, 36, 348–354.
# Here used as a test for the x2sys suite.

. ../functions.sh
header "Test x2sys to reproduce Wessel (2010) Comp. & Geosci., Figure 3"

ps=Wessel_x2sys_Fig_3.ps

R=181/185/0/3
makecpt -Crainbow -T-80/80/10 -Z > faa.cpt
# Grid the data
cat bad/*.xyg | blockmean -R$R -I1m | surface -R$R -I1m -Gss_gridded_bad.nc -T0.25
grdgradient ss_gridded_bad.nc -Ne0.75 -A65 -fg -Gss_gridded_bad_int.nc
grdimage ss_gridded_bad.nc -Iss_gridded_bad_int.nc -Ei -JM5.5i -P -K -X1.75i -Y1.25i -Cfaa.cpt -B1WSne --MAP_FRAME_WIDTH=3p --FORMAT_GEO_MAP=dddF >> $ps
psxy -R -J -O -T >> $ps
rm -f faa.cpt ss_gridded_bad_int.nc ss_gridded_bad.nc

pscmp
