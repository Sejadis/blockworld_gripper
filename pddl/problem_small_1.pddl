(define (problem place) (:domain blockworld)
(:objects 
    gripper - gripper
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 - box
    s1 s2 s3 s4 s5 - stack
    s1l1 s1l2 s1l3 s1l4 s1l5 - location
    s2l1 s2l2 s2l3 s2l4 s2l5 - location
    s3l1 s3l2 s3l3 s3l4 s3l5 - location
    s4l1 s4l2 s4l3 s4l4 s4l5 - location
    s5l1 s5l2 s5l3 s5l4 s5l5 - location
)

(:init
    ;todo: put the initial state's facts and numeric values here
    
    ;base locations
    (is_base_loc s1l1 s1)
    (is_base_loc s2l1 s2)
    (is_base_loc s3l1 s3)
    (is_base_loc s4l1 s4)
    (is_base_loc s5l1 s5)

    ;other locations
    (location_above s1l2 s1l1)
    (location_above s1l3 s1l2)
    (location_above s1l4 s1l3)
    (location_above s1l5 s1l4)

    (location_above s2l2 s2l1)
    (location_above s2l3 s2l2)
    (location_above s2l4 s2l3)
    (location_above s2l5 s2l4)
        
    (location_above s3l2 s3l1)
    (location_above s3l3 s3l2)
    (location_above s3l4 s3l3)
    (location_above s3l5 s3l4)

    (location_above s4l2 s4l1)
    (location_above s4l3 s4l2)
    (location_above s4l4 s4l3)
    (location_above s4l5 s4l4)

    (location_above s5l2 s5l1)
    (location_above s5l3 s5l2)
    (location_above s5l4 s5l3)
    (location_above s5l5 s5l4)

    ;gripper
    ;(gripper_available gripper)
    (gripper_at gripper s1l3)
    (gripper_open gripper)

    ;boxes
    (box_at b1 s1l1)

    (box_at b2 s1l2)
    (box_on b2 b1)

    (box_at b3 s1l3)
    (box_on b3 b2)

    (box_at b4 s1l4)
    (box_on b4 b3)

    (box_at b5 s1l5)
    (box_on b5 b4)

    (clear b5)

    (box_at b6 s2l1)

    (box_at b7 s2l2)
    (box_on b7 b6)

    (box_at b8 s2l3)
    (box_on b8 b7)

    (clear b8)

    (box_at b9 s3l1)

    (box_at b10 s3l2)
    (box_on b10 b9)

    (box_at b11 s3l3)
    (box_on b11 b10)

    (box_at b12 s3l4)
    (box_on b12 b11)

    (box_at b13 s3l5)
    (box_on b13 b12)

    (clear b13)
    
    (box_at b14 s4l1)

    (box_at b15 s4l2)
    (box_on b15 b14)

    (box_at b16 s4l3)
    (box_on b16 b15)

    (clear b16)
    
    (box_at b17 s5l1)

    (box_at b18 s5l2)
    (box_on b18 b17)

    (box_at b19 s5l3)
    (box_on b19 b18)

    (box_at b20 s5l4)
    (box_on b20 b19)
)

(:goal (and
    (box_at b5 s2l4)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)