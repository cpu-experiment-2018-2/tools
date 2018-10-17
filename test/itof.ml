let rec float_of_int x = 
    let rec add_until1 x y z = 
        if (x + 8388608) <= y then 
            add_until1 (x + 8388608) y (z +. 8388608.0)
         else
            z
    in 
    let rec add_until2 x y = 
        if (x + 8388608) <= y then 
            add_until2 (x + 8388608) y 
         else
            x 
    in 
    if  8388608 <= x then 
    (
        let m = add_until1 0 x 0.0  in 
        let n = float_of_int(x - (add_until2 0 x))  in
        m +. n
        )
    else
        (
        (Obj.magic (x + 1258291200)) -. 8388608.0
        )
        
in
print_int (Obj.magic (float_of_int(10)))
