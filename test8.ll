declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
define void @bubbleSort(i32* %arrbubbleSort){
    %tempbubbleSort = alloca i32, align 4
    %jbubbleSort = alloca i32, align 4
    %ibubbleSort = alloca i32, align 4
%t0 = add i32 0, 0

store i32 %t0, i32* %ibubbleSort
br label %L0
L0:
%t1 = load i32, i32* %ibubbleSort, align 4
%t2 = add i32 5, 0

%t3_1 = icmp slt i32 %t1, %t2
%t3 = zext i1 %t3_1 to i32

%t4 = icmp ne i32 %t3, 0
br i1 %t4, label %L1, label %L2
L1:
%t5 = add i32 0, 0

store i32 %t5, i32* %jbubbleSort
br label %L3
L3:
%t6 = load i32, i32* %jbubbleSort, align 4
%t7 = add i32 5, 0

%t8 = load i32, i32* %ibubbleSort, align 4
%t9 = sub i32 %t7, %t8

%t10 = add i32 1, 0

%t11 = sub i32 %t9, %t10

%t12_1 = icmp slt i32 %t6, %t11
%t12 = zext i1 %t12_1 to i32

%t13 = icmp ne i32 %t12, 0
br i1 %t13, label %L4, label %L5
L4:
;ArrayVariable -----------
%t14 = load i32, i32* %jbubbleSort, align 4
%t15 = getelementptr [1 x i32], [1 x i32]* %arrbubbleSort, i32 0, i32 %t14
%t16 = load i32, i32* %t15, align 4
;FIN - ArrayVariable --------

;ArrayVariable -----------
%t17 = load i32, i32* %jbubbleSort, align 4
%t18 = add i32 1, 0

%t19 = add i32 %t17, %t18
%t20 = getelementptr [1 x i32], [1 x i32]* %arrbubbleSort, i32 0, i32 %t19
%t21 = load i32, i32* %t20, align 4
;FIN - ArrayVariable --------

%t22_1 = icmp sgt i32 %t16, %t21
%t22 = zext i1 %t22_1 to i32

%t38 = icmp ne i32 %t22, 0
br i1 %t38, label %L6, label %L7
L6:
;ArrayVariable -----------
%t23 = load i32, i32* %jbubbleSort, align 4
%t24 = getelementptr [1 x i32], [1 x i32]* %arrbubbleSort, i32 0, i32 %t23
%t25 = load i32, i32* %t24, align 4
;FIN - ArrayVariable --------

store i32 %t25, i32* %tempbubbleSort
;ArrayVariable -----------
%t26 = load i32, i32* %jbubbleSort, align 4
%t27 = add i32 1, 0

%t28 = add i32 %t26, %t27
%t29 = getelementptr [1 x i32], [1 x i32]* %arrbubbleSort, i32 0, i32 %t28
%t30 = load i32, i32* %t29, align 4
;FIN - ArrayVariable --------

%t31 = load i32, i32* %jbubbleSort, align 4
%t32 = getelementptr [1 x i32], [1 x i32]* %arrbubbleSort, i32 0, i32 %t31
store i32 %t30, i32* %t32, align 4
%t33 = load i32, i32* %tempbubbleSort, align 4
%t34 = load i32, i32* %jbubbleSort, align 4
%t35 = add i32 1, 0

%t36 = add i32 %t34, %t35
%t37 = getelementptr [1 x i32], [1 x i32]* %arrbubbleSort, i32 0, i32 %t36
store i32 %t33, i32* %t37, align 4

br label %L7
L7:
%t39 = load i32, i32* %jbubbleSort, align 4
%t40 = add i32 1, 0

%t41 = add i32 %t39, %t40
store i32 %t41, i32* %jbubbleSort

br label %L3
L5:
%t42 = load i32, i32* %ibubbleSort, align 4
%t43 = add i32 1, 0

%t44 = add i32 %t42, %t43
store i32 %t44, i32* %ibubbleSort

br label %L0
L2:
ret void
}

define void @printArray(i32* %arrprintArray){
    %iprintArray = alloca i32, align 4
%t45 = add i32 0, 0

store i32 %t45, i32* %iprintArray
br label %L8
L8:
%t46 = load i32, i32* %iprintArray, align 4
%t47 = add i32 5, 0

%t48_1 = icmp slt i32 %t46, %t47
%t48 = zext i1 %t48_1 to i32

%t49 = icmp ne i32 %t48, 0
br i1 %t49, label %L9, label %L10
L9:
;ArrayVariable -----------
%t50 = load i32, i32* %iprintArray, align 4
%t51 = getelementptr [1 x i32], [1 x i32]* %arrprintArray, i32 0, i32 %t50
%t52 = load i32, i32* %t51, align 4
;FIN - ArrayVariable --------

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t52)
%t53 = load i32, i32* %iprintArray, align 4
%t54 = add i32 1, 0

%t55 = add i32 %t53, %t54
store i32 %t55, i32* %iprintArray

br label %L8
L10:
ret void
}

define i32 @main(){
    %arrmain = alloca [5 x i32], align 4
%t56 = add i32 64, 0

%t57 = add i32 0, 0

%t58 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t57
store i32 %t56, i32* %t58, align 4
%t59 = add i32 34, 0

%t60 = add i32 1, 0

%t61 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t60
store i32 %t59, i32* %t61, align 4
%t62 = add i32 25, 0

%t63 = add i32 2, 0

%t64 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t63
store i32 %t62, i32* %t64, align 4
%t65 = add i32 12, 0

%t66 = add i32 3, 0

%t67 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t66
store i32 %t65, i32* %t67, align 4
%t68 = add i32 22, 0

%t69 = add i32 4, 0

%t70 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t69
store i32 %t68, i32* %t70, align 4


call void @bubbleSort(i32* %t71)


call void @printArray(i32* %t73)
%t75 = add i32 0, 0

ret i32 %t75
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1   