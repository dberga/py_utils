(define (domain blocksworld)
  (:requirements :strips)
(:predicates (clear ?x)
             (on-table ?x)
             (arm-empty)
             (holding ?x)
             (on ?x ?y))

(:action pickup
  :parameters (?ob)
  :precondition (and (clear ?ob) (on-table ?ob) (arm-empty))
  :effect (and (holding ?ob) (not (clear ?ob)) (not (on-table ?ob)) 
               (not (arm-empty))))

(:action pickup2
  :parameters (?ob ?overob)
  :precondition (and (on ?overob ?ob) (clear ?overob) (on-table ?ob) (arm-empty))
  :effect (and (holding ?ob) (on-table ?overob) 
               (not (on ?overob ?ob)) (not (arm-empty)) (not (on-table ?ob))))

(:action putdown
  :parameters  (?ob)
  :precondition (holding ?ob)
  :effect (and (clear ?ob) (arm-empty) (on-table ?ob) 
               (not (holding ?ob))))

(:action stack
  :parameters  (?ob ?underob)
  :precondition (and (clear ?underob) (holding ?ob))
  :effect (and (arm-empty) (clear ?ob) (on ?ob ?underob)
               (not (clear ?underob)) (not (holding ?ob))))

(:action unstack
  :parameters  (?ob ?underob)
  :precondition (and (on ?ob ?underob) (clear ?ob) (arm-empty))
  :effect (and (holding ?ob) (clear ?underob)
               (not (on ?ob ?underob)) (not (clear ?ob)) (not (arm-empty))))

(:action unstack2
  :parameters (?ob ?overob ?underob)
  :precondition (and (on ?ob ?underob) (on ?overob ?ob) (clear ?overob) (arm-empty))
  :effect (and (holding ?ob) (on ?overob ?underob)
               (not (on ?ob ?underob)) (not (on ?overob ?ob)) (not (arm-empty)))))
