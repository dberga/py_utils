
    (define (domain xmen)
      (:requirements :strips :typing)
      (:types personaje gen variedad copia)
      ; Para especificar tipos se usa la sintaxis:
      ; ?a1 ?a2 ?a3 - a ?b1 ?b2 - b c
      ; que significa que las variables a1, a2 y a3 son de tipo a
      ; las variables b1 y b2 son de tipo b
      ; c es un objeto sin tipo

      (:constants c1 c2 - copia ; Las constantes y los objetos son equivalentes 
                  g1 g2 g3 g4 - gen)   ; los definidos aqui se pueden usar en este archivo
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
                              (engendrando ?p)
                              (tienegen ?p c1 g1)
                              (tienegen ?p c2 g1)
                              (tienegen ?p c1 g2)
                              (tienegen ?p c2 g2)
                              (tienegen ?p c1 g3)
                              (tienegen ?p c2 g3)
                              (tienegen ?p c1 g4)
                              (tienegen ?p c2 g4)           )
               :effect (and (mujer ?p) 
                            (not (engendrando ?p))
                            (noengendrando))
               )

      (:action alumbrar-hombre
               :parameters (?p - personaje)
               :precondition (and 
                              ; Notese que una vez engrendrado, no puede volverse a engendrar
                              (engendrando ?p)
                              (tienegen ?p c1 g1)
                              (tienegen ?p c2 g1)
                              (tienegen ?p c1 g2)
                              (tienegen ?p c2 g2)
                              (tienegen ?p c1 g3)
                              (tienegen ?p c2 g3)
                              (tienegen ?p c1 g4)
                              (tienegen ?p c2 g4)
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
                        (eshijo ?p2 ?h c2)
                        (faltagen ?h c1 g1)
                        (faltagen ?h c2 g1)
                        (faltagen ?h c1 g2)
                        (faltagen ?h c2 g2)
                        (faltagen ?h c1 g3)
                        (faltagen ?h c2 g3)
                        (faltagen ?h c1 g4)
                        (faltagen ?h c2 g4)
                        (not (noexiste ?h))
                        )
               )
      )

    
