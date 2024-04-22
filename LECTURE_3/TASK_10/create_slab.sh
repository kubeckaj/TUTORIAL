
mX=6
mY=6
mZ=2
dist=2.8
echo -e "`echo $mX*$mY*$mZ | bc`\nslab" > .slab.xyz
for x in `seq 1 $mX`; do for y in `seq 1 $mY`; do for z in `seq 1 $mZ`; do
      if [ $((($x+$y+$z)%2)) -eq 0 ]; then element="Cl"; else element="Na"; fi
      echo "$element `echo $dist*$x | bc -l` `echo $dist*$y | bc -l` `echo $dist*$z | bc -l`" >> .slab.xyz
done;done;done
cat .slab.xyz | column -t > slab.xyz
rm .slab.xyz
JKrecenter slab.xyz
