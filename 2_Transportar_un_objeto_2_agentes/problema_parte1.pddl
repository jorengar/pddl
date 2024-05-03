;No se permite uso de tildes ni caracteres especiales. 

(define (problem transport_problem)
    (:domain transport_domain)
    (:objects
        carro carro2 - vehiculo
        localidad_A localidad_B localidad_C localidad_D localidad_E - lugar
        objeto_A - paquete
    )
    
    (:init
        ;Donde se encuentra el carro
        (at carro localidad_A)
        (at carro2 localidad_E)

        ;Como estan unidas las carreteras A <-> B -> C -> A
        (road localidad_A localidad_B)
        (road localidad_B localidad_C)
        (road localidad_C localidad_A)
        (road localidad_B localidad_A)
        (road localidad_D localidad_C)
        (road localidad_E localidad_D)
        (road localidad_D localidad_E)
        (road localidad_C localidad_E)

        (puedo_ir carro localidad_A)
        (puedo_ir carro localidad_B)
        (puedo_ir carro localidad_C)
        (puedo_ir carro2 localidad_C)
        (puedo_ir carro2 localidad_D)
        (puedo_ir carro2 localidad_E)


        ;Donde se encuentra el objeto o paquete 
        (at objeto_A localidad_A)
    )
    (:goal (and
        
        ;Que el carro este en la localidad A y el paquete en la 
        ;localidad C.
        (at objeto_A localidad_D)
        (at carro2 localidad_E)
    ))
)