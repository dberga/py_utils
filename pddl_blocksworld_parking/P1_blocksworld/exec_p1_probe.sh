#!/bin/sh


cd ..
cd Planner_probe
cp probe ../P1_blocksworld
cd ..
cd P1_blocksworld
echo 'Planning problem_p1_1'
./probe -d domain_p1.pddl -i problem_p1_1.pddl -o result_p1_1.txt > salida_p1_1.log
echo 'Planning problem_p1_2'
./probe -d domain_p1.pddl -i problem_p1_2.pddl -o result_p1_2.txt > salida_p1_2.log
echo 'Planning problem_p1_3'
./probe -d domain_p1.pddl -i problem_p1_3.pddl -o result_p1_3.txt > salida_p1_3.log
echo 'Planning problem_p1_4'
./probe -d domain_p1.pddl -i problem_p1_4.pddl -o result_p1_4.txt > salida_p1_4.log
echo 'Planning problem_p1_5'

echo 'DONE planning, moving files to "resultsPROBE" and "logsPROBE" folder '
mv result_p1_1.txt.1 "resultsPROBE"/
mv result_p1_2.txt.1 "resultsPROBE"/
mv result_p1_3.txt.1 "resultsPROBE"/
mv result_p1_4.txt.1 "resultsPROBE"/
mv result_p1_5.txt.1 "resultsPROBE"/


mv -f salida_p1_1.log "logsPROBE"/
mv -f salida_p1_2.log "logsPROBE"/
mv -f salida_p1_3.log "logsPROBE"/
mv -f salida_p1_4.log "logsPROBE"/
mv -f salida_p1_5.log "logsPROBE"/

echo 'DONE!'


