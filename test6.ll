declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
define void @analyze(i32 %xanalyze, i32 %yanalyze){

%t1 = add i32 0, 0

%t2_1 = icmp sgt i32 %xanalyze, %t1
%t2 = zext i1 %t2_1 to i32


%t4 = add i32 0, 0

%t5_1 = icmp sgt i32 %yanalyze, %t4
%t5 = zext i1 %t5_1 to i32

%t6 = and i32 %t2, %t5

%t7 = icmp ne i32 %t6, 0
br i1 %t7, label %L0, label %L2
L0:
call i32(i8*, ...) @printf(i8* @.fmt0)

br label %L1
L2:
call i32(i8*, ...) @printf(i8* @.fmt1)
br label %L1
L1:
ret void
}

define i32 @main(){
    %ymain = alloca i32, align 4
    %xmain = alloca i32, align 4
%t8 = add i32 5, 0

%t9 = sub i32 0, %t8

store i32 %t9, i32* %xmain
%t10 = add i32 10, 0

store i32 %t10, i32* %ymain
%t11 = load i32, i32* %xmain, align 4
%t12 = load i32, i32* %ymain, align 4
call void @analyze(i32 %t11, i32 %t12)
%t14 = add i32 0, 0

ret i32 %t14
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1
@.fmt1 = private constant [45 x i8] c"Both numbers are zero or one of them is zero\00", align 1
@.fmt0 = private constant [26 x i8] c"Both numbers are positive\00", align 1