#!/bin/sh



echo 'copying files'
cp domain_p1.pddl ../Planner_downward/src
cp problem_p1_1.pddl ../Planner_downward/src
cp problem_p1_2.pddl ../Planner_downward/src
cp problem_p1_3.pddl ../Planner_downward/src
cp problem_p1_4.pddl ../Planner_downward/src
cp problem_p1_5.pddl ../Planner_downward/src
cd ..
cd Planner_downward/src

echo 'planning problem_p1_1'
translate/translate.py domain_p1.pddl problem_p1_1.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p1_1.log
mv sas_plan sas_plan_p1_1.txt
mv sas_plan_p1_1.txt ../../P1_blocksworld/resultsDOWNWARD
mv salida_p1_1.log ../../P1_blocksworld/logsDOWNWARD

echo 'planning problem_p1_2'
translate/translate.py domain_p1.pddl problem_p1_2.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p1_2.log
mv sas_plan sas_plan_p1_2.txt
mv sas_plan_p1_2.txt ../../P1_blocksworld/resultsDOWNWARD
mv salida_p1_2.log ../../P1_blocksworld/logsDOWNWARD

echo 'planning problem_p1_3'
translate/translate.py domain_p1.pddl problem_p1_3.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p1_3.log
mv sas_plan sas_plan_p1_3.txt
mv sas_plan_p1_3.txt ../../P1_blocksworld/resultsDOWNWARD
mv salida_p1_3.log ../../P1_blocksworld/logsDOWNWARD


echo 'planning problem_p1_4'
translate/translate.py domain_p1.pddl problem_p1_4.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p1_4.log
mv sas_plan sas_plan_p1_4.txt
mv sas_plan_p1_4.txt ../../P1_blocksworld/resultsDOWNWARD
mv salida_p1_4.log ../../P1_blocksworld/logsDOWNWARD

echo 'planning problem_p1_5'
translate/translate.py domain_p1.pddl problem_p1_5.pddl
preprocess/preprocess < output.sas
search/downward --search "astar(lmcut())" < output > salida_p1_5.log
mv sas_plan sas_plan_p1_5.txt
mv sas_plan_p1_5.txt ../../P1_blocksworld/resultsDOWNWARD
mv salida_p1_5.log ../../P1_blocksworld/logsDOWNWARD

echo 'DONE!'


