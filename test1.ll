


declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
    @a = global i32 zeroinitializer
    @matrix = global [9 x i32] zeroinitializer
define i32 @getSum(){
    %jgetSum = alloca i32, align 4
    %igetSum = alloca i32, align 4
    %totalgetSum = alloca i32, align 4
%t0 = add i32 0, 0

store i32 %t0, i32* %totalgetSum
%t1 = add i32 0, 0

store i32 %t1, i32* %igetSum
br label %L0
L0:
%t2 = load i32, i32* %igetSum, align 4
%t3 = add i32 3, 0

%t4_1 = icmp slt i32 %t2, %t3
%t4 = zext i1 %t4_1 to i32

%t5 = icmp ne i32 %t4, 0
br i1 %t5, label %L1, label %L2
L1:
%t6 = add i32 0, 0

store i32 %t6, i32* %jgetSum
br label %L3
L3:
%t7 = load i32, i32* %jgetSum, align 4
%t8 = add i32 3, 0

%t9_1 = icmp slt i32 %t7, %t8
%t9 = zext i1 %t9_1 to i32

%t10 = icmp ne i32 %t9, 0
br i1 %t10, label %L4, label %L5
L4:
%t11 = load i32, i32* %totalgetSum, align 4
;ArrayVariable -----------
%t12 = load i32, i32* %igetSum, align 4
%t13 = add i32 3, 0

%t14 = mul i32 %t12, %t13

%t15 = load i32, i32* %jgetSum, align 4
%t16 = add i32 %t14, %t15
%t17 = getelementptr [9 x i32], [9 x i32]* @matrix, i32 0, i32 %t16   
%t18 = load i32, i32* %t17, align 4
;FIN - ArrayVariable --------

%t19 = add i32 %t11, %t18
store i32 %t19, i32* %totalgetSum
%t20 = load i32, i32* %jgetSum, align 4
%t21 = add i32 1, 0

%t22 = add i32 %t20, %t21
store i32 %t22, i32* %jgetSum

br label %L3
L5:
%t23 = load i32, i32* %igetSum, align 4
%t24 = add i32 1, 0

%t25 = add i32 %t23, %t24
store i32 %t25, i32* %igetSum

br label %L0
L2:
%t26 = load i32, i32* %totalgetSum, align 4
ret i32 %t26
ret i32 0
}

define void @initializeMatrix(){
    %jinitializeMatrix = alloca i32, align 4
    %iinitializeMatrix = alloca i32, align 4
%t27 = add i32 0, 0

store i32 %t27, i32* %iinitializeMatrix
br label %L6
L6:
%t28 = load i32, i32* %iinitializeMatrix, align 4
%t29 = add i32 3, 0

%t30_1 = icmp slt i32 %t28, %t29
%t30 = zext i1 %t30_1 to i32

%t31 = icmp ne i32 %t30, 0
br i1 %t31, label %L7, label %L8
L7:
%t32 = add i32 0, 0

store i32 %t32, i32* %jinitializeMatrix
br label %L9
L9:
%t33 = load i32, i32* %jinitializeMatrix, align 4
%t34 = add i32 3, 0

%t35_1 = icmp slt i32 %t33, %t34
%t35 = zext i1 %t35_1 to i32

%t36 = icmp ne i32 %t35, 0
br i1 %t36, label %L10, label %L11
L10:
%t37 = load i32, i32* %iinitializeMatrix, align 4
%t38 = load i32, i32* %jinitializeMatrix, align 4
%t39 = mul i32 %t37, %t38

%t40 = load i32, i32* %iinitializeMatrix, align 4
%t41 = add i32 3, 0

%t42 = mul i32 %t40, %t41

%t43 = load i32, i32* %jinitializeMatrix, align 4
%t44 = add i32 %t42, %t43
%t45 = getelementptr [9 x i32], [9 x i32]* @matrix, i32 0, i32 %t44   
store i32 %t39, i32* %t45, align 4
%t46 = load i32, i32* %jinitializeMatrix, align 4
%t47 = add i32 1, 0

%t48 = add i32 %t46, %t47
store i32 %t48, i32* %jinitializeMatrix

br label %L9
L11:
%t49 = load i32, i32* %iinitializeMatrix, align 4
%t50 = add i32 1, 0

%t51 = add i32 %t49, %t50
store i32 %t51, i32* %iinitializeMatrix

br label %L6
L8:
ret void
}

define i32 @main(){
    %resultmain = alloca i32, align 4

call void @initializeMatrix()

%t53 = call i32 @getSum()

store i32 %t53, i32* %resultmain
call i32(i8*, ...) @printf(i8* @.fmt0)
%t54 = load i32, i32* %resultmain, align 4
call i32(i8*, ...) @printf(i8* @.fmt, i32 %t54)
%t55 = add i32 0, 0

ret i32 %t55
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1
@.fmt0 = private constant [10 x i8] c"resultado\00", align 1