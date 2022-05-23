(define (domain grid)
(:requirements :strips)
(:predicates (Vconn ?w ?s)
	     (Hconn ?a ?d)
	     (at ?k ?x ?y)
	     (car ?k)
             (place ?p)
	     (available ?p)
             (vertical ?k)
	     (horizontal ?k))




(:action HmoveForward
:parameters (?car ?curposfront ?curposback ?nextpos)
:precondition (and (place ?curposfront) (place ?curposback) (place ?nextpos) (car ?car) (at ?car ?curposfront ?curposback) (Hconn ?curposfront ?nextpos) (available ?nextpos) (horizontal ?car)   )
:effect (and (at ?car ?nextpos ?curposfront) (available ?curposback) (not (at ?car ?curposfront ?curposback)) (not(available ?nextpos)))
)

(:action HmoveBackward
:parameters (?car ?curposfront ?curposback ?nextpos)
:precondition (and (place ?curposfront) (place ?curposback) (place ?nextpos) (car ?car) (at ?car ?curposfront ?curposback) (Hconn ?curposback ?nextpos) (available ?nextpos) (horizontal ?car)   )
:effect (and (at ?car ?curposback ?nextpos) (available ?curposfront) (not (at ?car ?curposfront ?curposback)) (not (available ?nextpos)))
)

(:action VmoveForward
:parameters (?car ?curposfront ?curposback ?nextpos)
:precondition (and (place ?curposfront) (place ?curposback) (place ?nextpos) (car ?car) (at ?car ?curposfront ?curposback) (Vconn ?curposfront ?nextpos) (available ?nextpos) (vertical ?car)   )
:effect (and (at ?car ?nextpos ?curposfront) (available ?curposback) (not (at ?car ?curposfront ?curposback)) (not (available ?nextpos)))
)

(:action VmoveBackward
:parameters (?car ?curposfront ?curposback ?nextpos)
:precondition (and (place ?curposfront) (place ?curposback) (place ?nextpos) (car ?car) (at ?car ?curposfront ?curposback) (Vconn ?curposback ?nextpos) (available ?nextpos) (vertical ?car)   )
:effect (and (at ?car ?curposback ?nextpos) (available ?curposfront) (not (at ?car ?curposfront ?curposback)) (not (available ?nextpos)))
)



(:action Hspin_1or2
:parameters (?car ?curposfront ?curposback ?nextpos)
:precondition (and (place ?curposfront) (place ?curposback) (place ?nextpos) (car ?car) (at ?car ?curposfront ?curposback) (Vconn ?curposback ?nextpos) (available ?nextpos) (horizontal ?car)   )
:effect (and (at ?car ?curposback ?nextpos) (available ?curposfront) (vertical ?car) (not (at ?car ?curposfront ?curposback)) (not (horizontal ?car)) (not (available ?nextpos)))
)

(:action Hspin_3or4
:parameters (?car ?curposfront ?curposback ?nextpos)
:precondition (and (place ?curposfront) (place ?curposback) (place ?nextpos) (car ?car) (at ?car ?curposfront ?curposback) (Vconn ?curposfront ?nextpos) (available ?nextpos) (horizontal ?car)   )
:effect (and (at ?car ?curposfront ?nextpos) (available ?curposback) (vertical ?car) (not (at ?car ?curposfront ?curposback)) (not (horizontal ?car)) (not (available ?nextpos)))
)


(:action Vspin_1or2
:parameters (?car ?curposfront ?curposback ?nextpos)
:precondition (and (place ?curposfront) (place ?curposback) (place ?nextpos) (car ?car) (at ?car ?curposfront ?curposback) (Hconn ?curposback ?nextpos) (available ?nextpos) (vertical ?car)   )
:effect (and (at ?car ?curposback ?nextpos) (available ?curposfront) (horizontal ?car) (not (at ?car ?curposfront ?curposback)) (not (vertical ?car)) (not (available ?nextpos)))
)

(:action Vspin_3or4
:parameters (?car ?curposfront ?curposback ?nextpos)
:precondition (and (place ?curposfront) (place ?curposback) (place ?nextpos) (car ?car) (at ?car ?curposfront ?curposback) (Hconn ?curposfront ?nextpos) (available ?nextpos) (vertical ?car)   )
:effect (and (at ?car ?curposfront ?nextpos) (available ?curposback) (horizontal ?car) (not (at ?car ?curposfront ?curposback)) (not (vertical ?car)) (not (available ?nextpos)))
)

)






	
