for seed in 7 42 69
do
  JKML -loc -qml -train testDFT.pkl testXTB.pkl -mon monsDFT.pkl monsXTB.pkl -test testDFT.pkl testXTB.pkl -size 41 -seed $seed
done
