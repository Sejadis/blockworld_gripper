;Header and description

(define (domain boxes)

;remove requirements that are not needed
(:requirements :strips :adl :fluents :typing)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    box
    gripper
    location
    stack
)

; un-comment following line if constants are needed
;(:constants l1 l2 l3 - level)

(:predicates ;todo: define predicates here
    (gripper_at ?g - gripper ?l - location)
    (box_at ?b - box ?l - location)
    (box_on ?b_above ?b_below - box)
    (gripper_open ?g - gripper)
    (is_holding ?g - gripper ?b - box)
    (clear ?b - box)
    (stack_empty ?s - stack)
    (location_above ?l_above ?l_below - location)
    (is_base_loc ?l - location ?s - stack)
)

(:functions ;todo: define numeric functions here
)

;define actions here
(:action GRAB
    :parameters (
        ?g - gripper
        ?b - box
        ?l - location
        ?s - stack
    )
    :precondition (
        and
            (gripper_at ?g ?l)
            (box_at ?b ?l)
            (gripper_open ?g)
            (clear ?b)
            (is_base_loc ?l ?s)
    )
    :effect (
        and
            (not (box_at ?b ?l))
            (not (gripper_open ?g))
            (is_holding ?g ?b)
            (stack_empty ?s)
    )
)

(:action PLACE
    :parameters (
        ?g - gripper
        ?b - box
        ?l - location
        ?s - stack
    )
    ;:duration (= ?duration 0.25)
    :precondition (
        and
            (is_holding ?g ?b)
            (gripper_at ?g ?l)
            (is_base_loc ?l ?s)
            (stack_empty ?s)
    )
    :effect (
        and
            (box_at ?b ?l)
            (not (is_holding ?g ?b))
            (gripper_open ?g)
            (clear ?b)
            (not(stack_empty ?s))
    )
)

(:action STACK
    :parameters (
        ?g - gripper
        ?b ?b2 - box
        ?l ?l2 - location
    )
    ;:duration (= ?duration 0.25)
    :precondition (
        and
            (clear ?b2)
            (is_holding ?g ?b)
            (gripper_at ?g ?l)
            (location_above ?l ?l2)
            (box_at ?b2 ?l2)
    )
    :effect (
        and
            (not(clear ?b2))
            (box_on ?b ?b2)
            (clear ?b)
            (box_at ?b ?l)
            (not(is_holding ?g ?b))
            (gripper_open ?g)
    )
)

(:action UNSTACK
    :parameters (
        ?g - gripper
        ?b ?b2 - box
        ?l ?l2 - location

    )
    ;:duration (= ?duration 0.25)
    :precondition (
        and
            (clear ?b)
            (gripper_open ?g)
            (box_on ?b ?b2)
            (gripper_at ?g ?l)
            (box_at ?b ?l)
            (box_at ?b2 ?l2)
    )
    :effect (
        and
            (not(clear ?b))
            (not(box_on ?b ?b2))
            (clear ?b2)
            (is_holding ?g ?b)
            (not(box_at ?b ?l))
            (not(gripper_open ?g))
    )
)

(:action MOVE-GRIPPER
    :parameters (
        ?g - gripper
        ?l_from ?l_to - location
    )
    ;:duration (= ?duration 1.5)
    :precondition (
        and
            (gripper_at ?g ?l_from)
    )
    :effect (
        and
            (not (gripper_at ?g ?l_from))
            (gripper_at ?g ?l_to)
    )
)
)
