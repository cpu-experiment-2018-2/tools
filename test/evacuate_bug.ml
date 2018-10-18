let rec yloop y =
   let rec xloop x y =
     print_int y
     in
   xloop 0 y
   in
 yloop 1
