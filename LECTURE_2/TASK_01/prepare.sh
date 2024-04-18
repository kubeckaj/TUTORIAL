#PREPARE TRAINING DATABASE
JKQC 2sa2w_DFT_full.pkl -preshuffle -index 0:50 -out 2sa2w_DFT_train50.pkl
#PREPARE TEST DATABASE
JKQC 2sa2w_DFT_full.pkl -preshuffle -index 50:64 -out 2sa2w_DFT_test13.pkl
#TAKE ONLY STRUCTURES
JKQC 2sa2w_DFT_test13.pkl -drop log -out 2sa2w_STR_test13.pkl
