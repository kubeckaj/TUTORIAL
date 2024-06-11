sbatch -J 'TASK_08' -p qtest --time 5:00 -N 1 --mem-per-cpu 4000mb --cpus-per-task 1 --ntasks-per-node=1 -n 1 JKsend  sh H.cmd
