import os
import sys

def save(dir_name,max_personajes_extra, ngens,generacion_inicial, personajes_requeridos, variedades_iniciales):
    os.system("/bin/rm -rf ./"+dir_name)
    os.makedirs(dir_name)
    problem_nf = dir_name + "/problem.pddl"
    problem = file(problem_nf, "w")
    domain_nf = dir_name + "/domain.pddl"
    domain  = file(domain_nf, "w")

    # Primero escribiremos todo en el string domain_text
    domain_t = """
    (define (domain xmen)
      (:requirements :strips :typing)
      (:types personaje gen variedad copia)
      ; Para especificar tipos se usa la sintaxis:
      ; ?a1 ?a2 ?a3 - a ?b1 ?b2 - b c
      ; que significa que las variables a1, a2 y a3 son de tipo a
      ; las variables b1 y b2 son de tipo b
      ; c es un objeto sin tipo

      (:constants c1 c2 - copia ; Las constantes y los objetos son equivalentes 
                 """
    # Una constante por gen
    for g in range(1,ngens+1):
        domain_t += " g%d" % g

    domain_t += """ - gen)   ; los definidos aqui se pueden usar en este archivo
      (:predicates 
       (noexiste ?p - personaje)
       (hombre ?p - personaje)
       (mujer ?p - personaje)
       (tienegen ?p - personaje ?c - copia ?g - gen)
       (faltagen ?p - personaje ?c - copia ?g - gen)
       (eshijo ?p ?h - personaje ?c - copia)
       (cargagen ?p - personaje ?c - copia ?g - gen ?v - variedad)
       (engendrando ?p - personaje)
       (noengendrando)
       )

      (:action alumbrar-mujer
               :parameters (?p - personaje)
               :precondition (and 
                              ; Engendrando garantiza que ahora el planner solo
                              ; puede aplicar acciones para terminar de alumbrar ?p
                              (engendrando ?p)"""

    # tienegen, por cada gen
    tiene_gen_txt = ''
    for g in range(1,ngens+1):
        tiene_gen_txt += """
                              (tienegen ?p c1 g%d)
                              (tienegen ?p c2 g%d)""" % (g,g)

    domain_t += tiene_gen_txt

    domain_t +="""           )
               :effect (and (mujer ?p) 
                            (not (engendrando ?p))
                            (noengendrando))
               )

      (:action alumbrar-hombre
               :parameters (?p - personaje)
               :precondition (and 
                              ; Notese que una vez engrendrado, no puede volverse a engendrar
                              (engendrando ?p)"""

    # Repetimos la precondicion tienegen
    domain_t += tiene_gen_txt

    domain_t +="""
                              )
               :effect (and (hombre ?p) 
                            (not (engendrando ?p))
                            (noengendrando))
               )

      (:action pasargen
               :parameters (?p - personaje ?cp - copia
                               ?h - personaje ?ch - copia
                               ?g - gen ?v - variedad)
               :precondition (and 
                              (engendrando ?h)
                              (faltagen ?h ?ch ?g)
                              (eshijo ?p ?h ?ch)
                              (cargagen ?p ?cp ?g ?v)
                              )
               :effect (and
                        (cargagen ?h ?ch ?g ?v)
                        (tienegen ?h ?ch ?g)
                        (not (faltagen ?h ?ch ?g))
                        )
               )



      (:action fecundar
               :parameters (?p1 ?p2 ?h - personaje)
               :precondition (and
                              (noengendrando)
                              (mujer ?p1)
                              ; Esto es solo una solucion incompleta al problema
                              ; del incesto. Solo evita padres con hijos.
                              (not (eshijo ?p1 ?p2 c1))
                              (not (eshijo ?p1 ?p2 c2))
                              (not (eshijo ?p2 ?p1 c1))
                              (not (eshijo ?p2 ?p1 c2))
                              ; Es posible que una mejor solucion pase por crear predicado (descendiente ?p ?h)
                              ; Pero verificarlo bien no es trivial. Otra solucion es agregar una nocion de tiempo.
                              ; Esto, por cierto, es un ejemplo de precondiciones negativas.

                              (hombre ?p2) 
                              (noexiste ?h)
                              )
               :effect (and 
                        (engendrando ?h)
                        (not (noengendrando))
                        (eshijo ?p1 ?h c1)
                        (eshijo ?p2 ?h c2)"""

    for g in range(1,ngens+1):
        domain_t += """
                        (faltagen ?h c1 g%d)
                        (faltagen ?h c2 g%d)""" % (g,g)

    domain_t +="""
                        (not (noexiste ?h))
                        )
               )
      )

    """ 

    # Ahora domain_t esta listo.
    print >> domain, domain_t 

    problem_t = """
    (define (problem xmen-climax)
      (:domain xmen)
      (:objects""" 

    for (nombre,sexo,genes) in generacion_inicial:
        problem_t += """
                %s""" % nombre
    problem_t += "\n"
    for i in range(0,max_personajes_extra):
        problem_t += ' p' + str(i+1)
    problem_t += " - personaje\n"
    for s in variedades_iniciales:
        for v in s:
            problem_t += """
                %s """ % v
    problem_t += """- variedad
       )
      (:init 
       (noengendrando)"""

    for i in range(0,max_personajes_extra):
        problem_t += """
       (noexiste p%d)""" % (i+1)

    for (nombre,sexo,genes) in generacion_inicial:
        problem_t += """
       (%s %s)""" % (sexo, nombre)
        gi = 0
        for lg in genes:
            gi += 1
            assert(len(lg) == 2)
            [v1,v2] = lg
            problem_t += """
       (cargagen %s c1 g%d %s)""" % (nombre, gi, v1)
            problem_t += """
       (cargagen %s c2 g%d %s)""" % (nombre, gi, v2)
        problem_t += "\n"

    problem_t += """
       )
      (:goal (and"""

    pi = 0
    for (nombre,sexo,genes) in personajes_requeridos:
        pi += 1
        problem_t += """
       (%s p%s)""" % (sexo, pi)
        gi = 0
        for lg in genes:
            gi += 1 
            assert(len(lg) == 2)
            [v1,v2] = lg
            problem_t += """
       (cargagen p%d c1 g%d %s)""" % (pi, gi, v1)
            problem_t += """
       (cargagen p%d c2 g%d %s)""" % (pi, gi, v2)
        problem_t += "\n"

    problem_t +="""
       ))
    )
    """ 

    print >> problem, problem_t 
    return domain_nf, problem_nf
