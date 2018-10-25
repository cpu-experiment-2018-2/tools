let rec f x acc b = 
    if x = 0 then ()
    else 
        (
            (* let _ = print_int((int_of_float (acc *. 100.0))) in *)
            (* let _ = print_char 32 in *)
            let _ = if fless acc b then print_int 1 else print_int 0  in
            (* let _ = print_newline()  in  *)
            f (x-1) (acc+.0.05) b
        )
in 
    (* let _ = f 1000 (-10.0) 0.3 in *)
    let _ = f 1000 (-10.0) (-0.3) in
    ()




