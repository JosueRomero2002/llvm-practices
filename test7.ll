declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
    @a = global i32 zeroinitializer
define i32 @add(i32 %aadd, i32 %badd){


%t2 = add i32 %aadd, %badd
ret i32 %t2
ret i32 0
}

define i32 @addThree(i32 %aaddThree, i32 %baddThree, i32 %caddThree){ 


%t5 = add i32 %aaddThree, %baddThree

%t7 = add i32 %t5, %caddThree
ret i32 %t7
ret i32 0
}

define void @showResults(){
call i32(i8*, ...) @printf(i8* @.fmt0)
%t8 = add i32 5, 0

%t9 = add i32 10, 0

%t10 = call i32 @add(i32 %t8, i32 %t9)

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t10)
%t11 = add i32 5, 0

%t12 = add i32 10, 0
%t13 = add i32 15, 0

%t14 = call i32 @addThree(i32 %t11, i32 %t12, i32 %t13)

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t14)
ret void
}

define i32 @main(){

call void @showResults()
%t16 = add i32 0, 0

ret i32 %t16
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1
@.fmt0 = private constant [9 x i8] c"Results:\00", align 1