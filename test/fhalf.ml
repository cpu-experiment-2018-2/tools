let rec f x acc = 
    if x = 0 then ()
    else 
        (
            let _ =  print_int (int_of_float ((fhalf acc) *. (1000.0))) in
            let _ = print_newline() in
            f (x-1) (acc-.0.1)
        )
in 
    f 1000 (10.0)
