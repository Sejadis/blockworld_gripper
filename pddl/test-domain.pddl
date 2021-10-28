(define (domain blockworld)
(:requirements :strips :typing :adl :fluents :durative-actions)

;; Types ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(:types
    box
    gripper
    location
    stack
);; end Types ;;;;;;;;;;;;;;;;;;;;;;;;;

;; Predicates ;;;;;;;;;;;;;;;;;;;;;;;;;
(:predicates

    (gripper_at ?g - gripper ?l - location)
    (box_at ?b - box ?l - location)
    (box_on ?b_above ?b_below - box)
    (gripper_open ?g - gripper)
    (is_holding ?g - gripper ?b - box)
    (clear ?b - box)
    (stack_empty ?s - stack)
    (location_above ?l_above ?l_below - location)
    (is_base_loc ?l - location ?s - stack)

);; end Predicates ;;;;;;;;;;;;;;;;;;;;
;; Functions ;;;;;;;;;;;;;;;;;;;;;;;;;
(:functions

);; end Functions ;;;;;;;;;;;;;;;;;;;;
;; Actions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(:durative-action GRAB
    :parameters (
        ?g - gripper
        ?b - box
        ?l - location
        ?s - stack
    )
    :duration (= ?duration 0.25)
    :condition (
        and
            (over all(gripper_at ?g ?l))
            (at start(box_at ?b ?l))
            (at start(gripper_open ?g))
            (at start(clear ?b))
            (at start(is_base_loc ?l ?s))
    )
    :effect (
        and
            (at end(not (box_at ?b ?l)))
            (at end(not (gripper_open ?g)))
            (at end(is_holding ?g ?b))
            (at end(stack_empty ?s))
            (at end(not(clear ?b)))
    )
)

(:durative-action PLACE
    :parameters (
        ?g - gripper
        ?b - box
        ?l - location
        ?s - stack
    )
    :duration (= ?duration 0.25)
    :condition (
        and
            (at start(is_holding ?g ?b))
            (over all(gripper_at ?g ?l))
            (at start(is_base_loc ?l ?s))
            (at start(stack_empty ?s))
    )
    :effect (
        and
            (at end(box_at ?b ?l))
            (at end(not (is_holding ?g ?b)))
            (at end(gripper_open ?g))
            (at end(clear ?b))
            (at end(not(stack_empty ?s)))
    )
)

(:durative-action STACK
    :parameters (
        ?g - gripper
        ?b ?b2 - box
        ?l ?l2 - location
    )
    :duration (= ?duration 0.25)
    :condition (
        and
            (at start(clear ?b2))
            (at start(is_holding ?g ?b))
            (over all(gripper_at ?g ?l))
            (at start(location_above ?l ?l2))
            (at start(box_at ?b2 ?l2))
    )
    :effect (
        and
            (at end(not(clear ?b2)))
            (at end(box_on ?b ?b2))
            (at end(clear ?b))
            (at end(box_at ?b ?l))
            (at end(not(is_holding ?g ?b)))
            (at end(gripper_open ?g))
    )
)

(:durative-action UNSTACK
    :parameters (
        ?g - gripper
        ?b ?b2 - box
        ?l ?l2 - location
    )
    :duration (= ?duration 0.25)
    :condition (
        and
            (at start(clear ?b))
            (at start(gripper_open ?g))
            (at start(box_on ?b ?b2))
            (over all(gripper_at ?g ?l))
            (at start(box_at ?b ?l))
            (at start(box_at ?b2 ?l2))
    )
    :effect (
        and
            (at end(not(clear ?b)))
            (at end(not(box_on ?b ?b2)))
            (at end(clear ?b2))
            (at end(is_holding ?g ?b))
            (at end(not(box_at ?b ?l)))
            (at end(not(gripper_open ?g)))
    )
)

(:durative-action MOVE-GRIPPER
    :parameters (
        ?g - gripper
        ?l_from ?l_to - location
    )
    :duration (= ?duration 1)
    :condition (
        and
            (at start(gripper_at ?g ?l_from))
    )
    :effect (
        and
            (at start(not (gripper_at ?g ?l_from)))
            (at end(gripper_at ?g ?l_to))
    )
)

);; end Domain ;;;;;;;;;;;;;;;;;;;;;;;;
