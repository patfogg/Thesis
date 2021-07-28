# Move data files from each folder and rename

cp Roger-Schexnayder/profile.data .
mv profile.data profile-RS.data

cp Evan-Schexnayder/profile.data .
mv profile.data profile-ES.data

cp Stanford/profile.data .
mv profile.data profile-S.data

cp Princeton/profile.data .
mv profile.data profile-P.data

# plot each species against eachother

gnuplot plot-profiles.gplot
