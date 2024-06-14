#THESE TWO MUST BE SORTED IN THE SAME WAY
JKQC 2sa2w_DFT_full.pkl -sort b -out 2sa2w_DFT_full_sorted.pkl
JKQC 2sa2w_XTB_full.pkl -sort b -out 2sa2w_XTB_full_sorted.pkl
#PREPARE TRAINING DATABASE
JKQC 2sa2w_DFT_full_sorted.pkl -preshuffle -index 0:50 -out 2sa2w_DFT_train50.pkl
JKQC 2sa2w_XTB_full_sorted.pkl -preshuffle -index 0:50 -out 2sa2w_XTB_train50.pkl
#PREPARE TEST DATABASE
JKQC 2sa2w_DFT_full_sorted.pkl -preshuffle -index 50:64 -out 2sa2w_DFT_test13.pkl
JKQC 2sa2w_XTB_full_sorted.pkl -preshuffle -index 50:64 -out 2sa2w_XTB_test13.pkl

echo ""
grep COMMAND ../TASK_01/output
