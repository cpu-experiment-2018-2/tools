let rec f x = 
        if fless x 10.0 then (
                print_int (int_of_float (floor x));
                    f (x +. 0.1)) else ()
in
f (-10.0)

