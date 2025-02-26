(define (domain dairy_supply_chain)
    (:requirements :strips :typing :durative-actions :fluents :duration-inequalities :negative-preconditions)
    
    (:types company truck)

    (:predicates 
        ; ==== queijo peça =====
        (producer_p1 ?c - company)
        (truck_available_p1 ?t - truck ?c1 - company ?c2 - company)
        (producers_share_p1 ?c1 - company ?c2 - company)

        ; ==== queijo fatiado =====
        (producer_p2 ?c - company)
        (truck_available_p2 ?t - truck ?c1 - company ?c2 - company)

        ; ==== requeijão =====
        (producer_p5 ?c - company)
        (truck_available_p5 ?t - truck ?c1 - company ?c2 - company)

        ; ==== manteiga =====
        (producer_p6 ?c - company)
        (truck_available_p6 ?t - truck ?c1 - company ?c2 - company)

        ; ==== p3 =====
        (producer_p3 ?c - company)
        (truck_available_p3 ?t - truck ?c1 - company ?c2 - company)
        (producers_share_p3 ?c1 - company ?c2 - company)

        ; ==== p4 =====
        (producer_p4 ?c - company)
        (truck_available_p4 ?t - truck ?c1 - company ?c2 - company)
    )

    (:functions
        (total_cost)
        (co2)
        (distance_company ?c1 - company ?c2 - company)
        (distance_km ?c1 - company ?c2 - company)
        (truck_driving ?t - truck)

        ; ===== queijo peça =====
        (quarentine_time_p1)
        (demand_p1 ?c - company)
        (producing_p1 ?c - company)
        (truck_capacity_p1 ?t - truck)
        (capacity_p1 ?c - company)
        (stock_p1 ?c - company)
        (stock_p1_available ?c - company)

        ; ===== queijo fatiado =====
        (demand_p2 ?c - company)
        (producing_p2 ?c - company)
        (truck_capacity_p2 ?t - truck)
        (capacity_p2 ?c - company)
        (stock_p2 ?c - company)

        ; ===== requeijão =====
        (quarentine_time_p5)
        (demand_p5 ?c - company)
        (producing_p5 ?c - company)
        (truck_capacity_p5 ?t - truck)
        (capacity_p5 ?c - company)
        (stock_p5 ?c - company)
        (stock_p5_available ?c - company)

        ; ===== manteiga =====
        (quarentine_time_p6)
        (demand_p6 ?c - company)
        (producing_p6 ?c - company)
        (truck_capacity_p6 ?t - truck)
        (capacity_p6 ?c - company)
        (stock_p6 ?c - company)
        (stock_p6_available ?c - company)

        ; ===== leite em pó interno bag - p3 =====
        (quarentine_time_p3)
        (demand_p3 ?c - company)
        (producing_p3 ?c - company)
        (truck_capacity_p3 ?t - truck)
        (capacity_p3 ?c - company)
        (stock_p3 ?c - company)
        (stock_p3_available ?c - company)

        ; ===== leite em pó interno fracionado - p4 =====
        (demand_p4 ?c - company)
        (producing_p4 ?c - company)
        (truck_capacity_p4 ?t - truck)
        (capacity_p4 ?c - company)
        (stock_p4 ?c - company)

    )

    ; ===== queijo peça =====
    (:durative-action produce_p1
        :parameters (?p - company)
        :duration (= ?duration 1)
        :condition (and 
                   (over all (producer_p1 ?p))
                   (over all (> (capacity_p1 ?p) 0))
                   (at start (= (producing_p1 ?p) 0))
        )
        :effect (and
                (at start (assign (producing_p1 ?p) 1))
                (at end (increase (stock_p1 ?p) (capacity_p1 ?p)))
                (at end (increase (total_cost) ?duration))
                (at end (assign (producing_p1 ?p) 0))
        )
    )

    (:durative-action stock_p1_quarentine
        :parameters (?p - company)
        :duration (= ?duration (quarentine_time_p1))
        :condition (and 
                   (over all (producer_p1 ?p))
                   (at start (> (stock_p1 ?p) 0))
        )
        :effect (and
                (at end (increase (stock_p1_available ?p) (stock_p1 ?p)))
                (at end (decrease (stock_p1 ?p) (stock_p1 ?p)))
                (at end (increase (total_cost) ?duration))
        )
    )

    (:durative-action send_p1
        :parameters (?t - truck ?p - company ?cd - company)
        :duration (= ?duration (distance_company ?p ?cd))
        :condition (and
                   (over all (truck_available_p1 ?t ?p ?cd))
                   (at start (>= (stock_p1_available ?p) (truck_capacity_p1 ?t)))
                   (at start (= (truck_driving ?t) 0))
        )
        :effect (and
                (at start (assign (truck_driving ?t) 1))
                (at start (decrease (stock_p1_available ?p) (truck_capacity_p1 ?t)))
                (at end (increase (stock_p1_available ?cd) (truck_capacity_p1 ?t)))
                (at end (increase (total_cost) (distance_company ?p ?cd)))
                (at end (assign (truck_driving ?t) 0))
                (at end (increase (co2) (* (* (distance_km ?p ?cd) (capacity_p1 ?p)) 0.8621611)))
        )
    )

    (:durative-action share_p1
        :parameters (?p1 - company ?p2 - company ?t - truck)
        :duration (= ?duration (distance_company ?p1 ?p2))
        :condition (and 
                   (over all (truck_available_p1 ?t ?p1 ?p2))
                   (over all (producers_share_p1 ?p1 ?p2))
                   (over all (>= (stock_p1_available ?p1) (truck_capacity_p1 ?t)))
                   (at start (= (truck_driving ?t) 0))
        )
        :effect (and
                (at start (assign (truck_driving ?t) 1))
                (at end (decrease (stock_p1_available ?p1) (truck_capacity_p1 ?t)))
                (at end (increase (stock_p1_available ?p2) (truck_capacity_p1 ?t)))
                (at end (increase (total_cost) (distance_company ?p1 ?p2)))
                (at end (assign (truck_driving ?t) 0))
        )
    )

    ; ===== queijo fatiado =====
    (:durative-action produce_p2
        :parameters (?p - company ?cd - company)
        :duration (= ?duration 1)
        :condition (and 
                   (over all (producer_p2 ?p))
                   (over all (> (capacity_p2 ?p) 0))
                   (at start (= (producing_p2 ?p) 0))
                   (at start (>= (stock_p1_available ?p) (capacity_p2 ?p)))
        )
        :effect (and
                (at start (assign (producing_p2 ?p) 1))
                (at end (increase (stock_p2 ?p) (capacity_p2 ?p)))
                (at end (decrease (stock_p1_available ?p) (capacity_p2 ?p)))
                (at end (increase (total_cost) ?duration))
                (at end (assign (producing_p2 ?p) 0))
        )
    )

    (:durative-action send_p2
        :parameters (?t - truck ?p - company ?cd - company)
        :duration (= ?duration (distance_company ?p ?cd))
        :condition (and
                   (over all (truck_available_p2 ?t ?p ?cd))
                   (at start (>= (stock_p2 ?p) (truck_capacity_p2 ?t)))
                   (at start (= (truck_driving ?t) 0))
        )
        :effect (and
                (at start (assign (truck_driving ?t) 1))
                (at start (decrease (stock_p2 ?p) (truck_capacity_p2 ?t)))
                (at end (increase (stock_p2 ?cd) (truck_capacity_p2 ?t)))
                (at end (increase (total_cost) (distance_company ?p ?cd)))
                (at end (assign (truck_driving ?t) 0))
                (at end (increase (co2) (* (* (distance_km ?p ?cd) (capacity_p2 ?p)) 0.8621611)))
        )
    )

    ; ===== requeijão =====
    (:durative-action produce_p5
        :parameters (?p - company ?cd - company)
        :duration (= ?duration 1)
        :condition (and 
                   (over all (producer_p5 ?p))
                   (over all (> (capacity_p5 ?p) 0))
                   (at start (= (producing_p5 ?p) 0))
        )
        :effect (and
                (at start (assign (producing_p5 ?p) 1))
                (at end (increase (stock_p5 ?p) (capacity_p5 ?p)))
                (at end (increase (total_cost) ?duration))
                (at end (assign (producing_p5 ?p) 0))
        )
    )

    (:durative-action stock_p5_quarentine
        :parameters (?p - company ?cd - company)
        :duration (= ?duration (quarentine_time_p5))
        :condition (and 
                   (over all (producer_p5 ?p))
                   (at start (> (stock_p5 ?p) 0))
        )
        :effect (and
                (at end (increase (stock_p5_available ?p) (stock_p5 ?p)))
                (at end (decrease (stock_p5 ?p) (stock_p5 ?p)))
                (at end (increase (total_cost) ?duration))
        )
    )

    (:durative-action send_p5
        :parameters (?t - truck ?p - company ?cd - company)
        :duration (= ?duration (distance_company ?p ?cd))
        :condition (and
                   (over all (truck_available_p5 ?t ?p ?cd))
                   (at start (>= (stock_p5_available ?p) (truck_capacity_p5 ?t)))
                   (at start (= (truck_driving ?t) 0))
        )
        :effect (and
                (at start (assign (truck_driving ?t) 1))
                (at start (decrease (stock_p5_available ?p) (truck_capacity_p5 ?t)))
                (at end (increase (stock_p5_available ?cd) (truck_capacity_p5 ?t)))
                (at end (increase (total_cost) (distance_company ?p ?cd)))
                (at end (assign (truck_driving ?t) 0))
                (at end (increase (co2) (* (* (distance_km ?p ?cd) (capacity_p5 ?p)) 0.8621611)))
        )
    )

    ; ===== manteiga =====
    (:durative-action produce_p6
        :parameters (?p - company ?cd - company)
        :duration (= ?duration 1)
        :condition (and 
                   (over all (producer_p6 ?p))
                   (over all (> (capacity_p6 ?p) 0))
                   (at start (= (producing_p6 ?p) 0))
        )
        :effect (and
                (at start (assign (producing_p6 ?p) 1))
                (at end (increase (stock_p6 ?p) (capacity_p6 ?p)))
                (at end (increase (total_cost) ?duration))
                (at end (assign (producing_p6 ?p) 0))
        )
    )

    (:durative-action stock_p6_quarentine
        :parameters (?p - company ?cd - company)
        :duration (= ?duration (quarentine_time_p6))
        :condition (and 
                   (over all (producer_p6 ?p))
                   (at start (> (stock_p6 ?p) 0))
                   ; pericibilidade
                   ;(at start (>= (stock_p1_available ?cd) (demand_p1 ?cd)))
                   ;(at start (>= (stock_p2 ?cd) (demand_p2 ?cd)))
        )
        :effect (and
                (at end (increase (stock_p6_available ?p) (stock_p6 ?p)))
                (at end (decrease (stock_p6 ?p) (stock_p6 ?p)))
                (at end (increase (total_cost) ?duration))
        )
    )

    (:durative-action send_p6
        :parameters (?t - truck ?p - company ?cd - company)
        :duration (= ?duration (distance_company ?p ?cd))
        :condition (and
                   (over all (truck_available_p6 ?t ?p ?cd))
                   (at start (>= (stock_p6_available ?p) (truck_capacity_p6 ?t)))
                   (at start (= (truck_driving ?t) 0))
        )
        :effect (and
                (at start (assign (truck_driving ?t) 1))
                (at start (decrease (stock_p6_available ?p) (truck_capacity_p6 ?t)))
                (at end (increase (stock_p6_available ?cd) (truck_capacity_p6 ?t)))
                (at end (increase (total_cost) (distance_company ?p ?cd)))
                (at end (assign (truck_driving ?t) 0))
                (at end (increase (co2) (* (* (distance_km ?p ?cd) (capacity_p6 ?p)) 0.8621611)))
        )
    )

    ; ===== leite em pó interno bag - p3 =====
    (:durative-action produce_p3
        :parameters (?p - company ?cd - company)
        :duration (= ?duration 1)
        :condition (and 
                   (over all (producer_p3 ?p))
                   (over all (> (capacity_p3 ?p) 0))
                   (at start (= (producing_p3 ?p) 0))
        )
        :effect (and
                (at start (assign (producing_p3 ?p) 1))
                (at end (increase (stock_p3 ?p) (capacity_p3 ?p)))
                (at end (increase (total_cost) ?duration))
                (at end (assign (producing_p3 ?p) 0))
        )
    )

    (:durative-action stock_p3_quarentine
        :parameters (?p - company ?cd - company)
        :duration (= ?duration (quarentine_time_p3))
        :condition (and 
                   (over all (producer_p3 ?p))
                   (at start (> (stock_p3 ?p) 0))
        )
        :effect (and
                (at end (increase (stock_p3_available ?p) (stock_p3 ?p)))
                (at end (decrease (stock_p3 ?p) (stock_p3 ?p)))
                (at end (increase (total_cost) ?duration))
        )
    )

    (:durative-action send_p3
        :parameters (?t - truck ?p - company ?cd - company)
        :duration (= ?duration (distance_company ?p ?cd))
        :condition (and
                   (over all (truck_available_p3 ?t ?p ?cd))
                   (at start (>= (stock_p3_available ?p) (truck_capacity_p3 ?t)))
                   (at start (= (truck_driving ?t) 0))
        )
        :effect (and
                (at start (assign (truck_driving ?t) 1))
                (at start (decrease (stock_p3_available ?p) (truck_capacity_p3 ?t)))
                (at end (increase (stock_p3_available ?cd) (truck_capacity_p3 ?t)))
                (at end (increase (total_cost) (distance_company ?p ?cd)))
                (at end (assign (truck_driving ?t) 0))
                (at end (increase (co2) (* (* (distance_km ?p ?cd) (capacity_p3 ?p)) 0.8621611)))
        )
    )

    (:durative-action share_p3
        :parameters (?p1 - company ?p2 - company ?t - truck)
        :duration (= ?duration (distance_company ?p1 ?p2))
        :condition (and 
                   (over all (truck_available_p3 ?t ?p1 ?p2))
                   (over all (producers_share_p3 ?p1 ?p2))
                   (over all (>= (stock_p3_available ?p1) (truck_capacity_p3 ?t)))
                   (at start (= (truck_driving ?t) 0))
        )
        :effect (and
                (at start (assign (truck_driving ?t) 1))
                (at end (decrease (stock_p3_available ?p1) (truck_capacity_p3 ?t)))
                (at end (increase (stock_p3_available ?p2) (truck_capacity_p3 ?t)))
                (at end (increase (total_cost) (distance_company ?p1 ?p2)))
                (at end (assign (truck_driving ?t) 0))
        )
    )

    ; ===== leite em pó interno fracionado - p4 =====
    (:durative-action produce_p4
        :parameters (?p - company ?cd - company)
        :duration (= ?duration 1)
        :condition (and 
                   (over all (producer_p4 ?p))
                   ;(over all (= (producing_lpef ?p) 0))
                   (over all (> (capacity_p4 ?p) 0))
                   (at start (= (producing_p4 ?p) 0))
                   (at start (>= (stock_p3_available ?p) (capacity_p4 ?p)))
        )
        :effect (and
                (at start (assign (producing_p4 ?p) 1))
                (at end (increase (stock_p4 ?p) (capacity_p4 ?p)))
                (at end (decrease (stock_p3_available ?p) (capacity_p4 ?p)))
                (at end (increase (total_cost) ?duration))
                (at end (assign (producing_p4 ?p) 0))
        )
    )

    (:durative-action send_p4
        :parameters (?t - truck ?p - company ?cd - company)
        :duration (= ?duration (distance_company ?p ?cd))
        :condition (and
                   (over all (truck_available_p4 ?t ?p ?cd))
                   (at start (>= (stock_p4 ?p) (truck_capacity_p4 ?t)))
                   (at start (= (truck_driving ?t) 0))
        )
        :effect (and
                (at start (assign (truck_driving ?t) 1))
                (at start (decrease (stock_p4 ?p) (truck_capacity_p4 ?t)))
                (at end (increase (stock_p4 ?cd) (truck_capacity_p4 ?t)))
                (at end (increase (total_cost) (distance_company ?p ?cd)))
                (at end (assign (truck_driving ?t) 0))
                (at end (increase (co2) (* (* (distance_km ?p ?cd) (capacity_p4 ?p)) 0.8621611)))
        )
    )
)
