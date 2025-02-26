    (define (problem dairy-supply-chain-problem)
    (:domain dairy_supply_chain)
    (:objects
        f1 f2 f3 f4 cd1 - company
        t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 - truck
    )

    (:init
        (= (truck_driving t10 ) 0)
        (= (truck_driving t11 ) 0)
        (= (truck_driving t12 ) 0)
        (= (truck_driving t13 ) 0)
        (= (truck_driving t14 ) 0)
        (= (truck_driving t15 ) 0)
        (= (truck_driving t16 ) 0)
        (= (truck_driving t17 ) 0)
        (= (truck_driving t18 ) 0)
        (= (truck_driving t19 ) 0)
        (= (truck_driving t20 ) 0)
        (= (truck_driving t21 ) 0)
        (= (truck_driving t22 ) 0)
        (= (truck_driving t23 ) 0)
        (= (truck_driving t24 ) 0)
        (= (truck_driving t25 ) 0)
        (= (truck_driving t26 ) 0)
        (= (truck_driving t27 ) 0)
        (= (truck_driving t28 ) 0)
        (= (truck_driving t29 ) 0)
        (= (truck_driving t30 ) 0)
        (= (truck_driving t31 ) 0)
        (= (truck_driving t32 ) 0)
        (= (truck_driving t33 ) 0)
        (= (truck_driving t34 ) 0)
        (= (truck_driving t35 ) 0)
        (= (truck_driving t36 ) 0)
        (= (truck_driving t37 ) 0)
        (= (truck_driving t38 ) 0)
        (= (truck_driving t39 ) 0)
        (= (truck_driving t40 ) 0)
        (= (truck_driving t41 ) 0)
        (= (truck_driving t42 ) 0)
        (= (truck_driving t43 ) 0)
        (= (truck_driving t44 ) 0)
        (= (truck_driving t45 ) 0)
        (= (truck_driving t46 ) 0)
        (= (truck_driving t47 ) 0)
        (= (truck_driving t48 ) 0)
        (= (truck_driving t49 ) 0)

        ; distance in days
        (= (distance_company f1 cd1) 2)
        (= (distance_company cd1 f1) 2)

        (= (distance_company f3 cd1) 2)
        (= (distance_company cd1 f3) 2)

        (= (distance_company f1 f3) 1)
        (= (distance_company f3 f1) 1)

        (= (distance_company f2 cd1) 2)
        (= (distance_company cd1 f2) 2)

        (= (distance_company f4 cd1) 1)
        (= (distance_company cd1 f4) 1)

        (= (distance_company f1 f4) 2)
        (= (distance_company f4 f1) 2)

        ; distance in km
        (= (distance_km f1 cd1) 396)
        (= (distance_km cd1 f1) 396)

        (= (distance_km f3 cd1) 307)
        (= (distance_km cd1 f3) 307)

        (= (distance_km f1 f3) 95)
        (= (distance_km f3 f1) 95)

        (= (distance_km f2 cd1) 502)
        (= (distance_km cd1 f2) 502)

        (= (distance_km f4 cd1) 0)
        (= (distance_km cd1 f4) 0)

        (= (distance_km f1 f4) 396)
        (= (distance_km f4 f1) 396)

        ; ===== queijo peça =====
        (= (demand_p1 cd1) 480)

        (= (producing_p1 f1) 0)
        (= (producing_p1 f3) 0)

        ; which producers share p1 with each other
        (producers_share_p1 f1 f3)
        (producers_share_p1 f3 f1)

        ; stock of p1
        (= (stock_p1 cd1) 0)
        (= (stock_p1 f1) 0)
        (= (stock_p1 f3) 0)
        (= (stock_p1_available cd1) 80)
        (= (stock_p1_available f1) 80)
        (= (stock_p1_available f3) 80)

        ; quarentine time
        (= (quarentine_time_p1) 20)

        ; who produces p1
        (producer_p1 f1)
        (producer_p1 f3)

        ; capacity of p1 for each producer
        (= (capacity_p1 f1) 80)
        (= (capacity_p1 f3) 80)

        ; which truck can send p1 to cd
        (truck_available_p1 t10 f1 cd1)
        (truck_available_p1 t11 f1 cd1)
        (truck_available_p1 t12 f1 cd1)
        (truck_available_p1 t13 f1 cd1)
        (truck_available_p1 t14 f1 cd1)
        (truck_available_p1 t30 f3 cd1)
        (truck_available_p1 t31 f3 cd1)
        (truck_available_p1 t32 f3 cd1)
        (truck_available_p1 t33 f3 cd1)
        (truck_available_p1 t34 f3 cd1)

        ; which truck can send p1 to other producers
        (truck_available_p1 t10 f1 f3)
        (truck_available_p1 t10 f3 f1)
        (truck_available_p1 t11 f1 f3)
        (truck_available_p1 t11 f3 f1)
        (truck_available_p1 t12 f1 f3)
        (truck_available_p1 t12 f3 f1)
        (truck_available_p1 t13 f1 f3)
        (truck_available_p1 t13 f3 f1)
        (truck_available_p1 t14 f1 f3)
        (truck_available_p1 t14 f3 f1)
        (truck_available_p1 t30 f3 f1)
        (truck_available_p1 t30 f1 f3)
        (truck_available_p1 t31 f3 f1)
        (truck_available_p1 t31 f1 f3)
        (truck_available_p1 t32 f3 f1)
        (truck_available_p1 t32 f1 f3)
        (truck_available_p1 t33 f3 f1)
        (truck_available_p1 t33 f1 f3)
        (truck_available_p1 t34 f3 f1)
        (truck_available_p1 t34 f1 f3)

        ; truck capacity
        (= (truck_capacity_p1 t10) 21.168)
        (= (truck_capacity_p1 t11) 21.168)
        (= (truck_capacity_p1 t12) 21.168)
        (= (truck_capacity_p1 t13) 12.096)
        (= (truck_capacity_p1 t14) 12.096)
        (= (truck_capacity_p1 t30) 21.168)
        (= (truck_capacity_p1 t31) 21.168)
        (= (truck_capacity_p1 t32) 21.168)
        (= (truck_capacity_p1 t33) 12.096)
        (= (truck_capacity_p1 t34) 12.096)

        ; ===== queijo fatiado =====
        (= (demand_p2 cd1) 200)

        (= (producing_p2 f1) 0)
        (= (producing_p2 f3) 0)

        ; stock of p2
        (= (stock_p2 cd1) 21.42)
        (= (stock_p2 f1) 21.42)
        (= (stock_p2 f3) 21.42)
     
        ; who produces p2
        (producer_p2 f1)
        (producer_p2 f3)

        ; capacity of p2 for each producer
        (= (capacity_p2 f1) 21.42)
        (= (capacity_p2 f3) 21.42)

        ; which truck can send p2 to cd
        (truck_available_p2 t10 f1 cd1)
        (truck_available_p2 t11 f1 cd1)
        (truck_available_p2 t12 f1 cd1)
        (truck_available_p2 t13 f1 cd1)
        (truck_available_p2 t14 f1 cd1)
        (truck_available_p2 t30 f3 cd1)
        (truck_available_p2 t31 f3 cd1)
        (truck_available_p2 t32 f3 cd1)
        (truck_available_p2 t33 f3 cd1)
        (truck_available_p2 t34 f3 cd1)

        ; truck capacity
        (= (truck_capacity_p2 t10) 22.680)
        (= (truck_capacity_p2 t11) 22.680)
        (= (truck_capacity_p2 t12) 22.680)
        (= (truck_capacity_p2 t13) 12.960)
        (= (truck_capacity_p2 t14) 12.960)
        (= (truck_capacity_p2 t30) 22.680)
        (= (truck_capacity_p2 t31) 22.680)
        (= (truck_capacity_p2 t32) 22.680)
        (= (truck_capacity_p2 t33) 12.960)
        (= (truck_capacity_p2 t34) 12.960)

        ; ===== requeijão =====
        (= (demand_p5 cd1) 130)

        (= (producing_p5 f2) 0)

        ; stock of p5
        (= (stock_p5 cd1) 0)
        (= (stock_p5 f2) 0)
        (= (stock_p5_available cd1) 16)
        (= (stock_p5_available f2) 16)

        ; quarentine time
        (= (quarentine_time_p5) 5)

        ; who produces p5
        (producer_p5 f2)

        ; capacity of p5 for each producer
        (= (capacity_p5 f2) 16)

        ; which truck can send p5 to cd
        (truck_available_p5 t20 f2 cd1)
        (truck_available_p5 t21 f2 cd1)
        (truck_available_p5 t22 f2 cd1)
        (truck_available_p5 t23 f2 cd1)
        (truck_available_p5 t24 f2 cd1)

        ; truck capacity
        (= (truck_capacity_p5 t20) 17.2032)
        (= (truck_capacity_p5 t21) 17.2032)
        (= (truck_capacity_p5 t22) 17.2032)
        (= (truck_capacity_p5 t23) 9.8304)
        (= (truck_capacity_p5 t24) 9.8304)

        ; ===== manteiga =====
        (= (demand_p6 cd1) 380)

        (= (producing_p6 f4) 0)

        ;; stock of p6
        (= (stock_p6 cd1) 0)
        (= (stock_p6 f4) 0)
        (= (stock_p6_available cd1) 20)
        (= (stock_p6_available f4) 20)

        ;; quarentine time
        (= (quarentine_time_p6) 2)

        ;; who produces p6
        (producer_p6 f4)

        ;; capacity of p6 for each producer
        (= (capacity_p6 f4) 20)

        ;; which truck can send p6 to cd
        (truck_available_p6 t40 f4 cd1)
        (truck_available_p6 t41 f4 cd1)

        ;; truck capacity
        (= (truck_capacity_p6 t40) 50)
        (= (truck_capacity_p6 t41) 50)
        (= (truck_capacity_p6 t42) 50)
        (= (truck_capacity_p6 t43) 50)

        ; ===== leite em pó interno bag - p3 =====
        (= (demand_p3 cd1) 300)

        (= (producing_p3 f1) 0)
        (= (producing_p3 f4) 0)

        ; stock of p3
        (= (stock_p3 cd1) 0)
        (= (stock_p3 f1) 0)
        (= (stock_p3 f4) 0)
        (= (stock_p3_available cd1) 50)
        (= (stock_p3_available f1) 50)
        (= (stock_p3_available f4) 50)

        ; quarentine time
        (= (quarentine_time_p3) 3)

        ; which producers share p3 with each other
        (producers_share_p3 f1 f4)
        ;(producers_share_p3 f4 f1)

        ; who produces p3
        (producer_p3 f1)
        (producer_p3 f4)

        ; capacity of p3 for each producer
        (= (capacity_p3 f1) 50)
        (= (capacity_p3 f4) 50)

        ; which truck can send p3 to cd
        (truck_available_p3 t15 f1 cd1)
        (truck_available_p3 t16 f1 cd1)
        (truck_available_p3 t17 f1 cd1)
        (truck_available_p3 t18 f1 cd1)
        (truck_available_p3 t19 f1 cd1)
        (truck_available_p3 t40 f4 cd1)
        (truck_available_p3 t41 f4 cd1)
        (truck_available_p3 t42 f4 cd1)
        (truck_available_p3 t43 f4 cd1)

        ; which truck can send p3 to other producers
        (truck_available_p3 t15 f1 f4)
        ;(truck_available_p3 t15 f4 f1)
        (truck_available_p3 t16 f1 f4)
        ;(truck_available_p3 t16 f4 f1)
        (truck_available_p3 t17 f1 f4)
        ;(truck_available_p3 t17 f4 f1)
        (truck_available_p3 t18 f1 f4)
        ;(truck_available_p3 t18 f4 f1)
        (truck_available_p3 t19 f1 f4)
        ;(truck_available_p3 t19 f4 f1)

        ; truck capacity
        (= (truck_capacity_p3 t15) 25)
        (= (truck_capacity_p3 t16) 25)
        (= (truck_capacity_p3 t17) 25)
        (= (truck_capacity_p3 t18) 25)
        (= (truck_capacity_p3 t19) 25)
        (= (truck_capacity_p3 t40) 50)
        (= (truck_capacity_p3 t41) 50)
        (= (truck_capacity_p3 t42) 50)
        (= (truck_capacity_p3 t43) 50)

        ; ===== leite em pó exportação bag - LPEB =====
        ;(= (demand_lpeb cd1) 200)

        ;(= (producing_lpeb f1) 0)
        ;(= (producing_lpeb f4) 0)

        ;; stock of lpeb
        ;(= (stock_lpeb cd1) 0)
        ;(= (stock_lpeb f1) 0)
        ;(= (stock_lpeb f4) 0)
        ;(= (stock_lpeb_available cd1) 48)
        ;(= (stock_lpeb_available f1) 48)
        ;(= (stock_lpeb_available f4) 48)

        ;; quarentine time
        ;(= (quarentine_time_lpeb) 7)

        ;; which producers share lpeb with each other
        ;(producers_share_lpeb f1 f4)
        ;(producers_share_lpeb f4 f1)

        ;; who produces lpeb
        ;(producer_lpeb f1)
        ;(producer_lpeb f4)

        ;; capacity of lpeb for each producer
        ;(= (capacity_lpeb f1) 48)
        ;(= (capacity_lpeb f4) 48)

        ;; which truck can send lpeb to cd
        ;(truck_available_lpeb t15 f1 cd1)
        ;(truck_available_lpeb t16 f1 cd1)
        ;(truck_available_lpeb t17 f1 cd1)
        ;(truck_available_lpeb t18 f1 cd1)
        ;(truck_available_lpeb t19 f1 cd1)
        ;(truck_available_lpeb t40 f4 cd1)
        ;(truck_available_lpeb t41 f4 cd1)

        ;; which truck can send lpeb to other producers
        ;(truck_available_lpeb t15 f1 f4)
        ;(truck_available_lpeb t15 f4 f1)
        ;(truck_available_lpeb t16 f1 f4)
        ;(truck_available_lpeb t16 f4 f1)
        ;(truck_available_lpeb t17 f1 f4)
        ;(truck_available_lpeb t17 f4 f1)
        ;(truck_available_lpeb t18 f1 f4)
        ;(truck_available_lpeb t18 f4 f1)
        ;(truck_available_lpeb t19 f1 f4)
        ;(truck_available_lpeb t19 f4 f1)

        ;; truck capacity
        ;(= (truck_capacity_lpeb t15) 25)
        ;(= (truck_capacity_lpeb t16) 25)
        ;(= (truck_capacity_lpeb t17) 25)
        ;(= (truck_capacity_lpeb t18) 25)
        ;(= (truck_capacity_lpeb t19) 25)
        ;(= (truck_capacity_lpeb t40) 100)
        ;(= (truck_capacity_lpeb t41) 100)

        ; ===== leite em pó interno fracionado - p4 =====
        (= (demand_p4 cd1) 200)

        (= (producing_p4 f4) 0)

        ; stock of p4
        (= (stock_p4 cd1) 40)
        (= (stock_p4 f4) 40)

        ; who produces p4
        (producer_p4 f4)

        ; capacity of p4 for each producer
        (= (capacity_p4 f4) 40)

        ; which truck can send p4 to cd
        (truck_available_p4 t40 f4 cd1)
        (truck_available_p4 t41 f4 cd1)

        ; truck capacity
        (= (truck_capacity_p4 t40) 50)
        (= (truck_capacity_p4 t41) 50)
        (= (truck_capacity_p4 t42) 50)
        (= (truck_capacity_p4 t43) 50)

        ; ===== leite em pó exportação fracionado - LPEF =====
        ;(= (demand_lpef cd1) 120)

        ;(= (producing_lpef f4) 0)

        ;; stock of lpef
        ;(= (stock_lpef cd1) 40)
        ;(= (stock_lpef f4) 40)

        ;; who produces lpef
        ;(producer_lpef f4)

        ;; capacity of lpef for each producer
        ;(= (capacity_lpef f4) 40)

        ;; which truck can send lpef to cd
        ;(truck_available_lpef t40 f4 cd1)
        ;(truck_available_lpef t41 f4 cd1)

        ;; truck capacity
        ;(= (truck_capacity_lpef t40) 100)
        ;(= (truck_capacity_lpef t41) 100)
    )

    (:goal (and 
           (>= (stock_p1_available cd1) (demand_p1 cd1))
           (>= (stock_p2 cd1) (demand_p2 cd1))
           (>= (stock_p5_available cd1) (demand_p5 cd1))
           (>= (stock_p3_available cd1) (demand_p3 cd1))
           (>= (stock_p4 cd1) (demand_p4 cd1))
           ;(>= (stock_lpeb_available cd1) (demand_lpeb cd1))
           ;(>= (stock_lpef cd1) (demand_lpef cd1))
           (>= (stock_p6_available cd1) (demand_p6 cd1))
    ))

    (:metric minimize
           (total_cost)
           ;(co2)
           ;(* (total_cost) 0.7)
           ;(* (co2) 0.3)
    )
)
