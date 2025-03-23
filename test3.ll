declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
    @a = global i32 zeroinitializer
define i32 @isPrime(i32 %numisPrime){
    %iisPrime = alloca i32, align 4

%t1 = add i32 0, 0

%t2_1 = icmp sle i32 %numisPrime, %t1
%t2 = zext i1 %t2_1 to i32

%t4 = icmp ne i32 %t2, 0
br i1 %t4, label %L0, label %L1
L0:
call i32(i8*, ...) @printf(i8* @.fmt0)
%t3 = add i32 0, 0

ret i32 %t3

br label %L1
L1:
%t5 = add i32 2, 0

store i32 %t5, i32* %iisPrime
br label %L2
L2:
%t6 = load i32, i32* %iisPrime, align 4

%t8_1 = icmp slt i32 %t6, %numisPrime
%t8 = zext i1 %t8_1 to i32

%t9 = icmp ne i32 %t8, 0
br i1 %t9, label %L3, label %L4
L3:
call i32(i8*, ...) @printf(i8* @.fmt1)

%t11 = load i32, i32* %iisPrime, align 4
%t12 = srem i32 %numisPrime, %t11

%t13 = add i32 0, 0

%t14_1 = icmp eq i32 %t12, %t13
%t14 = zext i1 %t14_1 to i32

%t16 = icmp ne i32 %t14, 0
br i1 %t16, label %L5, label %L6
L5:
call i32(i8*, ...) @printf(i8* @.fmt2)
%t15 = add i32 0, 0

ret i32 %t15

br label %L6
L6:
%t17 = load i32, i32* %iisPrime, align 4
%t18 = add i32 1, 0

%t19 = add i32 %t17, %t18
store i32 %t19, i32* %iisPrime

br label %L2
L4:
call i32(i8*, ...) @printf(i8* @.fmt3)
%t20 = add i32 1, 0

ret i32 %t20
ret i32 0
}

define i32 @main(){
    %nummain = alloca i32, align 4
    %resultmain = alloca i32, align 4
%t21 = add i32 7, 0

store i32 %t21, i32* %nummain
%t22 = load i32, i32* %nummain, align 4

%t23 = call i32 @isPrime(i32 %t22)

store i32 %t23, i32* %resultmain
call i32(i8*, ...) @printf(i8* @.fmt4)
%t24 = load i32, i32* %resultmain, align 4
call i32(i8*, ...) @printf(i8* @.fmt, i32 %t24)
%t25 = add i32 0, 0

ret i32 %t25
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1
@.fmt2 = private constant [20 x i8] c"0 sucede ==========\00", align 1
@.fmt4 = private constant [6 x i8] c"res: \00", align 1
@.fmt3 = private constant [15 x i8] c"tambien sucede\00", align 1     
@.fmt1 = private constant [13 x i8] c"while sucede\00", align 1       
@.fmt0 = private constant [10 x i8] c"si sucede\00", align 1