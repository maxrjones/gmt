#!/usr/bin/env bash
# Testing gmt subplot 12 cm circles and framepen scaling via +as
# PNG_TEST
gmt begin circles png
  gmt subplot begin 2x1 -Fs12c+as -Baf -Rg -M0 -Y1.25c
    gmt basemap -JG0/10/? -c
    gmt basemap -JG0/-10/? -c
  gmt subplot end
gmt end show
