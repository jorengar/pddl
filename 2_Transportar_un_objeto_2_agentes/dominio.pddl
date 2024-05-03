

;No se permite uso de tildes ni caracteres especiales. 

;Dominio de transportar un objeto desde un punto A a un punto C pasando por un punto B. 

(define (domain transport_domain)
    (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
    
    (:types locatable vehicle package- object
            lugar - locatable
            paquete - package
            vehiculo - vehicle
        
    )

    (:predicates
        (at ?v - vehiculo ?l - lugar) ;ubicacion del vehiculo
        (road ?l1 - lugar ?l2 - lugar) ; Conexion de carretera
        (in ?p - paquete ?v - vehiculo) ;Paquete en el vehiculo
        (puedo_ir ?v - vehiculo ?l - lugar) ; El vehiculo puede ir a la posicion 
    )

    ;Acciones para tomar, mover y dejar el paquete
    (:action recoger
        :parameters (?v - vehiculo ?l - lugar ?p - paquete)
        :precondition (and
            (at ?v ?l)
            (at ?p ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?v)
        )
    )

    (:action se_mueve
        :parameters (?v - vehiculo ?l1 ?l2 - lugar)
        :precondition (and
            (at ?v ?l1)
            (road ?l1 ?l2)
            (puedo_ir ?v ?l2)
        )
        :effect (and
            (not (at ?v ?l1))
            (at ?v ?l2)
        )
    )

    (:action dejar
        :parameters (?v - vehiculo ?l - lugar ?p - paquete)
        :precondition (and
            (at ?v ?l)
            (in ?p ?v)
        )
        :effect (and
            (not (in ?p ?v))
            (at ?p ?l)
        )
    )
)