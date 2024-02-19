;No se permite uso de tildes ni caracteres especiales. 

(define (problem transport_problem)
    (:domain transport_domain)
    (:objects
        carro - vehiculo
        localidad_A localidad_B localidad_C - lugar
        objeto_A - paquete
    )
    (:init
        ;Donde se encuentra el carro
        (at carro localidad_A)

        ;Como estan unidas las carreteras A <-> B <-> C
        (road localidad_A localidad_B)
        (road localidad_B localidad_C)
        (road localidad_C localidad_B)
        (road localidad_B localidad_A)

        ;Donde se encuentra el objeto o paquete 
        (at objeto_A localidad_A)
    )
    (:goal (and
        
        ;Que el carro este en la localidad A y el paquete en la 
        ;localidad C.
        (at objeto_A localidad_C)
        (at carro localidad_A)
    ))
)