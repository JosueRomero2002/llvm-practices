declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
    @a = global i32 zeroinitializer
define i32 @square(i32 %xsquare){


%t2 = mul i32 %xsquare, %xsquare

ret i32 %t2
ret i32 0
}

define i32 @calculateExpression(i32 %acalculateExpression, i32 %bcalculateExpression, i32 %ccalculateExpression){


%t4 = call i32 @square(i32 %acalculateExpression)



%t6 = call i32 @square(i32 %bcalculateExpression)

%t7 = add i32 %t4, %t6


%t9 = call i32 @square(i32 %ccalculateExpression)

%t10 = add i32 %t7, %t9
ret i32 %t10
ret i32 0
}

define void @displayResult(){
    %resultdisplayResult = alloca i32, align 4
%t11 = add i32 2, 0

%t12 = add i32 3, 0
%t13 = add i32 4, 0

%t14 = call i32 @calculateExpression(i32 %t11, i32 %t12, i32 %t13)    

store i32 %t14, i32* %resultdisplayResult
%t15 = load i32, i32* %resultdisplayResult, align 4
call i32(i8*, ...) @printf(i8* @.fmt, i32 %t15)
ret void
}

define i32 @main(){

call void @displayResult()
%t17 = add i32 0, 0

ret i32 %t17
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1