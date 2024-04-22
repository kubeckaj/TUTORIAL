rm abc*.gjf abc*.log abc*.cluster abc*.xyz 2>/dev/null
cd calc-LM
rm *.gjf *.cluster 2>/dev/null
for i in `ls *.xyz`
do
  mv $i 1slab3w-31_1_$i 
done
cd ..
