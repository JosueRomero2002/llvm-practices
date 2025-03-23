declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
    @a = global i32 zeroinitializer
define i32 @factorial(i32 %nfactorial){
call i32(i8*, ...) @printf(i8* @.fmt0)

call i32(i8*, ...) @printf(i8* @.fmt, i32 %nfactorial)

%t2 = add i32 1, 0

%t3_1 = icmp sle i32 %nfactorial, %t2
%t3 = zext i1 %t3_1 to i32

%t6 = icmp ne i32 %t3, 0
br i1 %t6, label %L0, label %L2
L0:
call i32(i8*, ...) @printf(i8* @.fmt1)

call i32(i8*, ...) @printf(i8* @.fmt, i32 %nfactorial)
%t5 = add i32 1, 0

ret i32 %t5

br label %L1
L2:


%t9 = add i32 1, 0

%t10 = sub i32 %nfactorial, %t9


%t11 = call i32 @factorial(i32 %t10)

%t12 = mul i32 %nfactorial, %t11

ret i32 %t12
br label %L1
L1:
ret i32 0
}

define i32 @main(){
    %resultadomain = alloca i32, align 4
    %nmain = alloca i32, align 4
%t13 = add i32 5, 0

store i32 %t13, i32* %nmain
%t14 = load i32, i32* %nmain, align 4

%t15 = call i32 @factorial(i32 %t14)

store i32 %t15, i32* %resultadomain
call i32(i8*, ...) @printf(i8* @.fmt2)
%t16 = load i32, i32* %resultadomain, align 4
call i32(i8*, ...) @printf(i8* @.fmt, i32 %t16)
call i32(i8*, ...) @printf(i8* @.fmt3)
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1
@.fmt3 = private constant [4 x i8] c"Fin\00", align 1
@.fmt2 = private constant [12 x i8] c"Resultado: \00", align 1        
@.fmt1 = private constant [10 x i8] c"VERDADERO\00", align 1
@.fmt0 = private constant [10 x i8] c"Factorial\00", align 1
