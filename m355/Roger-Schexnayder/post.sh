#! /bin/bash
# post.sh
e4shared --job=lehr --post --tindx-plot=all --vtk-xml --add-vars="mach" --output-file="profile.data" --slice-list="16,:,0,0"

cp ~/Dropbox/University/Thesis/sphere-lehr/tinaroo-job-files/m355/Evan-Schexnayder/config/lehr-residuals.txt .
gnuplot plot-profiles.gplot

