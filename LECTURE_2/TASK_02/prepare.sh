#PREPARE TRAINING DATABASE:
JKQC sa-w_DFT.pkl -except 4sa5w -out train.pkl
#PREPARE TESTING DATABASE: 
JKQC sa-w_DFT.pkl -extract 4sa5w -out test.pkl 

