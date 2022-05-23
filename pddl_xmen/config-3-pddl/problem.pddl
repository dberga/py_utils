
    (define (problem xmen-climax)
      (:domain xmen)
      (:objects
                rogue
                wolverine
                mystique
                cyclope
 p1 p2 p3 p4 p5 - personaje

                fuerza-normal 
                super-fuerza 
                piel-mortal 
                piel-camaleon 
                piel-normal 
                piel-resistente 
                autocuracion 
                carne-debil 
                mirada-normal 
                mirada-fuego - variedad
       )
      (:init 
       (noengendrando)
       (noexiste p1)
       (noexiste p2)
       (noexiste p3)
       (noexiste p4)
       (noexiste p5)
       (mujer rogue)
       (cargagen rogue c1 g1 fuerza-normal)
       (cargagen rogue c2 g1 super-fuerza)
       (cargagen rogue c1 g2 piel-mortal)
       (cargagen rogue c2 g2 piel-mortal)
       (cargagen rogue c1 g3 carne-debil)
       (cargagen rogue c2 g3 carne-debil)
       (cargagen rogue c1 g4 mirada-normal)
       (cargagen rogue c2 g4 mirada-normal)

       (hombre wolverine)
       (cargagen wolverine c1 g1 super-fuerza)
       (cargagen wolverine c2 g1 super-fuerza)
       (cargagen wolverine c1 g2 piel-normal)
       (cargagen wolverine c2 g2 piel-resistente)
       (cargagen wolverine c1 g3 autocuracion)
       (cargagen wolverine c2 g3 autocuracion)
       (cargagen wolverine c1 g4 mirada-normal)
       (cargagen wolverine c2 g4 mirada-normal)

       (mujer mystique)
       (cargagen mystique c1 g1 super-fuerza)
       (cargagen mystique c2 g1 super-fuerza)
       (cargagen mystique c1 g2 piel-camaleon)
       (cargagen mystique c2 g2 piel-camaleon)
       (cargagen mystique c1 g3 carne-debil)
       (cargagen mystique c2 g3 autocuracion)
       (cargagen mystique c1 g4 mirada-fuego)
       (cargagen mystique c2 g4 mirada-normal)

       (hombre cyclope)
       (cargagen cyclope c1 g1 super-fuerza)
       (cargagen cyclope c2 g1 fuerza-normal)
       (cargagen cyclope c1 g2 piel-normal)
       (cargagen cyclope c2 g2 piel-resistente)
       (cargagen cyclope c1 g3 carne-debil)
       (cargagen cyclope c2 g3 carne-debil)
       (cargagen cyclope c1 g4 mirada-fuego)
       (cargagen cyclope c2 g4 mirada-fuego)

       )
      (:goal (and
       (mujer p1)
       (cargagen p1 c1 g1 super-fuerza)
       (cargagen p1 c2 g1 super-fuerza)
       (cargagen p1 c1 g2 piel-resistente)
       (cargagen p1 c2 g2 piel-resistente)
       (cargagen p1 c1 g3 autocuracion)
       (cargagen p1 c2 g3 autocuracion)
       (cargagen p1 c1 g4 mirada-fuego)
       (cargagen p1 c2 g4 mirada-fuego)

       ))
    )
    
