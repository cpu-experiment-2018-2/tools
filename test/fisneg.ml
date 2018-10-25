let rec f x acc = 
    if x = 0 then ()
    else 
        (
            let _ = if fisneg acc then print_int 1 else print_int 0 in
            f (x-1) (acc+.0.05)
        )
in 
    f 1000 (-10.0)

