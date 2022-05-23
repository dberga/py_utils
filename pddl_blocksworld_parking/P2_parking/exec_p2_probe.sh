#!/bin/sh


cd ..
cd Planner_probe
cp probe ../P2_parking
cd ..
cd P2_parking
echo 'Planning problem_p2_1'
./probe -d domain_p2.pddl -i problem_p2_1.pddl -o result_p2_1.txt > salida_p2_1.log
echo 'Planning problem_p2_2'
./probe -d domain_p2.pddl -i problem_p2_2.pddl -o result_p2_2.txt > salida_p2_2.log
echo 'Planning problem_p2_3'
./probe -d domain_p2.pddl -i problem_p2_3.pddl -o result_p2_3.txt > salida_p2_3.log
echo 'Planning problem_p2_4'
./probe -d domain_p2.pddl -i problem_p2_4.pddl -o result_p2_4.txt > salida_p2_4.log
echo 'Planning problem_p2_5'
./probe -d domain_p2.pddl -i problem_p2_5.pddl -o result_p2_5.txt > salida_p2_5.log
echo 'Planning problem_p2_6'
./probe -d domain_p2.pddl -i problem_p2_6.pddl -o result_p2_6.txt > salida_p2_6.log
echo 'Planning problem_p2_7'
./probe -d domain_p2.pddl -i problem_p2_7.pddl -o result_p2_7.txt > salida_p2_7.log
echo 'Planning problem_p2_8'
./probe -d domain_p2.pddl -i problem_p2_8.pddl -o result_p2_8.txt > salida_p2_8.log
echo 'Planning problem_p2_9'
./probe -d domain_p2.pddl -i problem_p2_9.pddl -o result_p2_9.txt > salida_p2_9.log
echo 'Planning problem_p2_10'
./probe -d domain_p2.pddl -i problem_p2_10.pddl -o result_p2_10.txt > salida_p2_10.log
echo 'Planning problem_p2_11'
./probe -d domain_p2.pddl -i problem_p2_11.pddl -o result_p2_11.txt > salida_p2_11.log
echo 'DONE planning, moving files to "resultsPROBE" and "logsPROBE" folder '
mv result_p2_1.txt.1 "resultsPROBE"/
mv result_p2_2.txt.1 "resultsPROBE"/
mv result_p2_3.txt.1 "resultsPROBE"/
mv result_p2_4.txt.1 "resultsPROBE"/
mv result_p2_5.txt.1 "resultsPROBE"/
mv result_p2_6.txt.1 "resultsPROBE"/
mv result_p2_7.txt.1 "resultsPROBE"/
mv result_p2_8.txt.1 "resultsPROBE"/
mv result_p2_9.txt.1 "resultsPROBE"/
mv result_p2_10.txt.1 "resultsPROBE"/

mv -f salida_p2_1.log "logsPROBE"/
mv -f salida_p2_2.log "logsPROBE"/
mv -f salida_p2_3.log "logsPROBE"/
mv -f salida_p2_4.log "logsPROBE"/
mv -f salida_p2_5.log "logsPROBE"/
mv -f salida_p2_6.log "logsPROBE"/
mv salida_p2_7.log "logsPROBE"/
mv salida_p2_8.log "logsPROBE"/
mv salida_p2_9.log "logsPROBE"/
mv salida_p2_10.log "logsPROBE"/
mv salida_p2_11.log "logsPROBE"/
echo 'DONE!'


