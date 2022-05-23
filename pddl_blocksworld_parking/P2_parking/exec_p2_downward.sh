#!/bin/sh



echo 'copying files'
cp domain_p2.pddl ../Planner_downward/src
cp problem_p2_1.pddl ../Planner_downward/src
cp problem_p2_2.pddl ../Planner_downward/src
cp problem_p2_3.pddl ../Planner_downward/src
cp problem_p2_4.pddl ../Planner_downward/src
cp problem_p2_5.pddl ../Planner_downward/src
cp problem_p2_6.pddl ../Planner_downward/src
cp problem_p2_7.pddl ../Planner_downward/src
cp problem_p2_8.pddl ../Planner_downward/src
cp problem_p2_9.pddl ../Planner_downward/src
cp problem_p2_10.pddl ../Planner_downward/src
cp problem_p2_11.pddl ../Planner_downward/src
cd ..
cd Planner_downward/src

echo 'planning problem_p2_1'
translate/translate.py domain_p2.pddl problem_p2_1.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_1.log
mv sas_plan sas_plan_p2_1.txt
mv sas_plan_p2_1.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_1.log ../../P2_parking/logsDOWNWARD

echo 'planning problem_p2_2'
translate/translate.py domain_p2.pddl problem_p2_2.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_2.log
mv sas_plan sas_plan_p2_2.txt
mv sas_plan_p2_2.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_2.log ../../P2_parking/logsDOWNWARD

echo 'planning problem_p2_3'
translate/translate.py domain_p2.pddl problem_p2_3.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_3.log
mv sas_plan sas_plan_p2_3.txt
mv sas_plan_p2_3.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_3.log ../../P2_parking/logsDOWNWARD


echo 'planning problem_p2_4'
translate/translate.py domain_p2.pddl problem_p2_4.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_4.log
mv sas_plan sas_plan_p2_4.txt
mv sas_plan_p2_4.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_4.log ../../P2_parking/logsDOWNWARD

echo 'planning problem_p2_5'
translate/translate.py domain_p2.pddl problem_p2_5.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_5.log
mv sas_plan sas_plan_p2_5.txt
mv sas_plan_p2_5.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_5.log ../../P2_parking/logsDOWNWARD


echo 'planning problem_p2_6'
translate/translate.py domain_p2.pddl problem_p2_6.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_6.log
mv sas_plan sas_plan_p2_6.txt
mv sas_plan_p2_6.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_6.log ../../P2_parking/logsDOWNWARD

echo 'planning problem_p2_7'
translate/translate.py domain_p2.pddl problem_p2_7.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_7.log
mv sas_plan sas_plan_p2_7.txt
mv sas_plan_p2_7.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_7.log ../../P2_parking/logsDOWNWARD


echo 'planning problem_p2_7'
translate/translate.py domain_p2.pddl problem_p2_7.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_7.log
mv sas_plan sas_plan_p2_7.txt
mv sas_plan_p2_7.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_7.log ../../P2_parking/logsDOWNWARD


echo 'planning problem_p2_8'
translate/translate.py domain_p2.pddl problem_p2_8.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_8.log
mv sas_plan sas_plan_p2_8.txt
mv sas_plan_p2_8.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_8.log ../../P2_parking/logsDOWNWARD


echo 'planning problem_p2_9'
translate/translate.py domain_p2.pddl problem_p2_9.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_9.log
mv sas_plan sas_plan_p2_9.txt
mv sas_plan_p2_9.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_9.log ../../P2_parking/logsDOWNWARD


echo 'planning problem_p2_10'
translate/translate.py domain_p2.pddl problem_p2_10.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_10.log
mv sas_plan sas_plan_p2_10.txt
mv sas_plan_p2_10.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_10.log ../../P2_parking/logsDOWNWARD


echo 'planning problem_p2_11'
translate/translate.py domain_p2.pddl problem_p2_11.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p2_11.log
mv sas_plan sas_plan_p2_11.txt
mv sas_plan_p2_11.txt ../../P2_parking/resultsDOWNWARD
mv salida_p2_11.log ../../P2_parking/logsDOWNWARD


echo 'DONE!'


