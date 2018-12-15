; ModuleID = 'io.ml.ll'
target datalayout = "e-m:e-p:32:32"

declare void @print_char(i32)


define void @print_int(i32 %V70.V27.x) {
entry:
  switch i32 %V70.V27.x, label %else2 [
    i32 0, label %then
    i32 1, label %then1
  ]

then:                                             ; preds = %entry
  tail call void @print_char(i32 48)
  br label %ifcont6

then1:                                            ; preds = %entry
  tail call void @print_char(i32 49)
  br label %ifcont6

else2:                                            ; preds = %entry
  %0 = icmp sgt i32 %V70.V27.x, -1
  br i1 %0, label %then3, label %else4

then3:                                            ; preds = %else2
  tail call void @V68.V25.print_int_plus(i32 %V70.V27.x, i1 true)
  br label %ifcont6

else4:                                            ; preds = %else2
  tail call void @print_char(i32 45)
  %V78.V33.21 = sub i32 0, %V70.V27.x
  tail call void @V68.V25.print_int_plus(i32 %V78.V33.21, i1 true)
  br label %ifcont6

ifcont6:                                          ; preds = %then1, %else4, %then3, %then
  ret void
}

define void @V68.V25.print_int_plus(i32 %V83.V40.x, i1 %V84.V41.flag) {
entry:
  %V85.V42.y = tail call i32 @V67.V24.div10(i32 %V83.V40.x)
  br i1 %V84.V41.flag, label %else2, label %ifcont3

else2:                                            ; preds = %entry
  %V86.V50.8 = tail call i32 @V66.V23.mul10(i32 %V85.V42.y)
  %not. = icmp ne i32 %V85.V42.y, 0
  tail call void @V68.V25.print_int_plus(i32 %V85.V42.y, i1 %not.)
  %V87.V43.r = add i32 %V83.V40.x, 48
  %V93.V47.11 = sub i32 %V87.V43.r, %V86.V50.8
  tail call void @print_char(i32 %V93.V47.11)
  ret void

ifcont3:                                          ; preds = %entry
  ret void
}

define i32 @V67.V24.div10(i32 %V94.V51.x) {
entry:
  %"121" = tail call i32 @V95.V52.div10binary(i32 %V94.V51.x, i32 %V94.V51.x, i32 0)
  ret i32 %"121"
}

define i32 @V95.V52.div10binary(i32 %V97.V54.x, i32 %V98.V55.up, i32 %V99.V56.low) {
entry:
  %V101.V57.51 = add i32 %V99.V56.low, 1
  %0 = icmp slt i32 %V101.V57.51, %V98.V55.up
  br i1 %0, label %else.preheader, label %ifcont3

else.preheader:                                   ; preds = %entry
  br label %else

else:                                             ; preds = %else.preheader, %else
  %V99.V56.low.tr3 = phi i32 [ %V99.V56.low.tr.V103.V58.mid, %else ], [ %V99.V56.low, %else.preheader ]
  %V98.V55.up.tr2 = phi i32 [ %V103.V58.mid.V98.V55.up.tr, %else ], [ %V98.V55.up, %else.preheader ]
  %V102.V60.6 = add i32 %V99.V56.low.tr3, %V98.V55.up.tr2
  %V103.V58.mid = lshr i32 %V102.V60.6, 1
  %V104.V59.mid10 = tail call i32 @V66.V23.mul10(i32 %V103.V58.mid)
  %1 = icmp sgt i32 %V104.V59.mid10, %V97.V54.x
  %V103.V58.mid.V98.V55.up.tr = select i1 %1, i32 %V103.V58.mid, i32 %V98.V55.up.tr2
  %V99.V56.low.tr.V103.V58.mid = select i1 %1, i32 %V99.V56.low.tr3, i32 %V103.V58.mid
  %V101.V57.5 = add i32 %V99.V56.low.tr.V103.V58.mid, 1
  %2 = icmp slt i32 %V101.V57.5, %V103.V58.mid.V98.V55.up.tr
  br i1 %2, label %else, label %ifcont3.loopexit

ifcont3.loopexit:                                 ; preds = %else
  %V99.V56.low.tr.V103.V58.mid.lcssa = phi i32 [ %V99.V56.low.tr.V103.V58.mid, %else ]
  br label %ifcont3

ifcont3:                                          ; preds = %ifcont3.loopexit, %entry
  %V99.V56.low.tr.lcssa = phi i32 [ %V99.V56.low, %entry ], [ %V99.V56.low.tr.V103.V58.mid.lcssa, %ifcont3.loopexit ]
  ret i32 %V99.V56.low.tr.lcssa
}

declare i32 @V66.V23.mul10(i32)
attributes #0 = { norecurse nounwind readnone }
