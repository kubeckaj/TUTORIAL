#PREPARE TRAINING DATABASE:
JKQC sa-w_DFT.pkl -except 4sa5w -out trainDFT.pkl
JKQC sa-w_XTB.pkl -except 4sa5w -out trainXTB.pkl
#PREPARE TESTING DATABASE: 
JKQC sa-w_DFT.pkl -extract 4sa5w -out testDFT.pkl 
JKQC sa-w_XTB.pkl -extract 4sa5w -out testXTB.pkl

echo ""
echo "JKML -loc -qml -train trainDFT.pkl trainXTB.pkl -test testDFT.pkl testXTB.pkl -monomers monsDFT.pkl monsXTB.pkl" 

