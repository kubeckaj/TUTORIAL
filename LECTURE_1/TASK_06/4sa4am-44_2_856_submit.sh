sbatch -J 'RECALC' -p q64 --time 3:00:00 -N 1 --mem-per-cpu 4000mb --cpus-per-task 1 --ntasks-per-node=1 -n 1 JKsend  sh 4sa4am-44_2_856.cmd
