declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
define void @printFibonacci(i32 %countprintFibonacci){
    %iprintFibonacci = alloca i32, align 4
    %tempprintFibonacci = alloca i32, align 4
    %bprintFibonacci = alloca i32, align 4
    %aprintFibonacci = alloca i32, align 4
%t0 = add i32 0, 0

store i32 %t0, i32* %aprintFibonacci
%t1 = add i32 1, 0

store i32 %t1, i32* %bprintFibonacci
%t2 = add i32 0, 0

store i32 %t2, i32* %iprintFibonacci
br label %L0
L0:
%t3 = load i32, i32* %iprintFibonacci, align 4

%t5_1 = icmp slt i32 %t3, %countprintFibonacci
%t5 = zext i1 %t5_1 to i32

%t6 = icmp ne i32 %t5, 0
br i1 %t6, label %L1, label %L2
L1:
%t7 = load i32, i32* %aprintFibonacci, align 4
call i32(i8*, ...) @printf(i8* @.fmt, i32 %t7)
%t8 = load i32, i32* %aprintFibonacci, align 4
%t9 = load i32, i32* %bprintFibonacci, align 4
%t10 = add i32 %t8, %t9
store i32 %t10, i32* %tempprintFibonacci
%t11 = load i32, i32* %bprintFibonacci, align 4
store i32 %t11, i32* %aprintFibonacci
%t12 = load i32, i32* %tempprintFibonacci, align 4
store i32 %t12, i32* %bprintFibonacci
%t13 = load i32, i32* %iprintFibonacci, align 4
%t14 = add i32 1, 0

%t15 = add i32 %t13, %t14
store i32 %t15, i32* %iprintFibonacci

br label %L0
L2:
ret void
}

define i32 @main(){
    %countmain = alloca i32, align 4
%t16 = add i32 10, 0

store i32 %t16, i32* %countmain
call i32(i8*, ...) @printf(i8* @.fmt0)
%t17 = load i32, i32* %countmain, align 4

call void @printFibonacci(i32 %t17)
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1
@.fmt0 = private constant [22 x i8] c"resultado------------\00", align 1