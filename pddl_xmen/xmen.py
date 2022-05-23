#! /usr/bin/env python
# -*- coding: utf-8 -*-

#  Copyright (C) 2013 Universitat Pompeu Fabra
#
#  Permission is hereby granted to distribute this software for
#  non-commercial research purposes, provided that this copyright
#  notice is included with any such distribution.
#
#  THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
#  EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#  PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
#  SOFTWARE IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU
#  ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
#
# Elaborated by Hector Palacios, hector.palacios@upf.edu

import sys
import os
import subprocess

import configFile
import saveFile

def usage():
    print """
    uso: %s <config-file>
    genera archivos <config-file>-pddl/domain.pddl
    y <config-file>-pddl/problem.pddl

    Cuidado, la carpeta <config-file>-pddl es borrada
    antes de crear los archivos

    Ver el archivo config-ejemplo
    para ver el formato de esos archivos
    """ % (sys.argv[0])
    sys.exit(1)

if len(sys.argv) <> 2:
    usage()

#print 'Leyendo archivo de configuracion'

config_nf = sys.argv[1]
max_personajes_extra, ngens, generacion_inicial, personajes_requeridos = configFile.carga(config_nf)

if len(personajes_requeridos) > max_personajes_extra:
    print 'Error: se piden lograr personajes que no alcanzan con los extra'
    print personajes_requeridos, max_personajes_extra
    sys.exit(1)

if False:
    print 'generacion inicial'
    print generacion_inicial
    print 'Personajes_requeridos'
    print personajes_requeridos

variedades_iniciales = configFile.obtenerVariedades(ngens,generacion_inicial)
variedades_finales = configFile.obtenerVariedades(ngens,personajes_requeridos)
if True:
    print 'Variedades genéticas observadas en configuración'
    gi = 0
    for vs in variedades_iniciales:
        gi += 1
        print 'Gen',gi,': ',
        for v in vs:
            print v,
        print
if False:
    print 'variedades fin',variedades_finales
for i in range(0,len(variedades_iniciales)):
    if not variedades_finales[i].issubset(variedades_finales[i]):
        print 'Genes mencionados en personajes requeridos no aparecen en padres'
        print variedades_finales[i], variedades_finales[i]
        sys.exit(1)

dir_name = config_nf+'-pddl'
domain_nf, problem_nf = saveFile.save(dir_name,max_personajes_extra, ngens,generacion_inicial, personajes_requeridos, variedades_iniciales)

#print 'problema generado'
#print 'llamando al planner'
print 'Resolviendo el problema'

result_nf = dir_name+'/result.txt'
cmd=['./seq-sat-probe/probe','-d',domain_nf,'-i',problem_nf,'-o',result_nf] 
probe=subprocess.Popen(cmd,bufsize=1000, stdout=subprocess.PIPE)
log = file(dir_name+'/probe.log','w')
for l in probe.stdout.readlines(): # Salida estandar de Probe
    print >> log,l,
    if 'Time:' in l:
        tiempo = l.split(':')[1].strip()
        print '(Tiempo en encontrar una solución',tiempo,'seg. )'
res = probe.wait() # Esperando a que termine Probe

print
print
print '****   TRAMA ENCONTRADA   ****'
print
# Analizando la solucion
gens_info = ''
actual = ''

# Suponiendo que en el plan se hace una transferencia genética a la vez
for l in file(result_nf+'.1'):
    l = l.strip()[1:-1] # quitando los parentesis
    if 'FECUNDAR' in l:
        [p,m,h] = l.split()[1:]
        print h,'es hijo de',m,'y',p,
        actual = h
        genes_info = ['' for i in range(0,ngens+1) ]
    elif 'ALUMBRAR' in l:
        assert( actual in l )
        if 'MUJER' in l:
            print 'Es una niña'
        else:
            print 'Es un niño'
        print 'Sus genes son:',
        for g in genes_info:
            print g.strip()
        print
        actual = ''
        genes_info = ''
    else:
        assert( actual in l )
        for i in range(1,ngens+1):
            if ' G'+str(i)+' ' in l:
                gen = l.split()[-1]
                if ' C1 ' in l:
                    genes_info[i] = gen + ' ' + genes_info[i]
                else:
                    genes_info[i] = genes_info[i] + ' ' + gen
                    






