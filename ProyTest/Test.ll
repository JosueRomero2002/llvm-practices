declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
    @awiwi = global [9 x i32] zeroinitializer
define i32 @main(){
    %dmain = alloca i32, align 4
    %amain = alloca i32, align 4
%t0 = add i32 1, 0

store i32 %t0, i32* %amain
%t1 = add i32 9, 0

%t2 = add i32 0, 0

%t3 = getelementptr [9 x i32], [9 x i32]* @awiwi, i32 0, i32 %t2
store i32 %t1, i32* %t3, align 4
;ArrayVariable -----------
%t4 = add i32 12, 0

%t5 = getelementptr [9 x i32], [9 x i32]* @awiwi, i32 0, i32 %t4
%t6 = load i32, i32* %t5, align 4
;FIN - ArrayVariable --------

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t6)
%t7 = add i32 0, 0

ret i32 %t7
ret i32 0
}


@.fmt = private constant [4 x i8] c"%d\0A\00", align 1  