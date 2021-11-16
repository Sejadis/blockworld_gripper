(define (problem place) (:domain blockworld)
(:objects 
    gripper - gripper
    blue yellow white - box
    s1 s2 s3 - stack
    s1l1 s1l2 s1l3 - location
    s2l1 s2l2 s2l3 - location
    s3l1 s3l2 s3l3 - location
)

(:init
    ;todo: put the initial state's facts and numeric values here
    
    ;base locations
    (is_base_loc s1l1 s1)
    (is_base_loc s2l1 s2)
    (is_base_loc s3l1 s3)

    ;other locations
    (location_above s1l2 s1l1)
    (location_above s1l3 s1l2)

    (location_above s2l2 s2l1)
    (location_above s2l3 s2l2)
        
    (location_above s3l2 s3l1)
    (location_above s3l3 s3l2)

    ;gripper
    ;(gripper_available gripper)
    (gripper_at gripper s1l3)
    (gripper_open gripper)

    ;boxes
    (box_at blue s1l1)

    (box_at yellow s1l2)
    (box_on yellow blue)

    (box_at white s2l1)

    (clear yellow)
    (clear white)

    (stack_empty s3)
)

(:goal (and
    (box_on blue white)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
