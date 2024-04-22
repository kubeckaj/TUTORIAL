rm abc*.gjf abc*.log abc*.cluster abc*.xyz 2>/dev/null
cd calc-LM
rm *.gjf *.cluster 2>/dev/null
for i in `ls *.xyz`
do
  mv $i 2A2SA-22_3_$i 
done
cd ..
cd calc-LM
source ~/.JKCSusersetup.txt
for i in *.xyz
do
  base=$(basename $i .xyz)
  test=`grep -c "Energy:" $i`
  if [ $test -gt 0 ]
  then
    energy=`grep "Energy:" $i | awk '{print $2}'`
  else
    energy=`head -n 2 $i | tail -n 1`
  fi
  echo "ABC" > ${base}.log
  echo "ABC energy: $energy" >> ${base}.log
done
program_JKQCpickle -folder ./ -collect xyz -noex  -cut rg 50 -out collectionABC.pkl
rm *.xyz *.log
cd ..
