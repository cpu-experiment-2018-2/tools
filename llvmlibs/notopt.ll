; ModuleID = 'io.ml.ll'
target datalayout = "e-m:e-p:32:32"


define i32 @V66.V23.mul10(i32 %V105.V62.x){
entry:
  %"1" = shl i32 %V105.V62.x, 3
  %"2" = shl i32 %V105.V62.x, 1
  %"3" = add i32 %"1",%"2"
  ret i32 %"3"
}
attributes #0 = { norecurse nounwind readnone }
