declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
define void @incrementBy(i32* %xincrementBy, i32 %yincrementBy){      
%t0 = load i32, i32* %xincrementBy, align 4

%t2 = add i32 %t0, %yincrementBy
store i32 %t2, i32* %xincrementBy
ret void
}

define void @applyIncrements(){
    %iapplyIncrements = alloca i32, align 4
    %fa2applyIncrements = alloca i32, align 4
    %baseapplyIncrements = alloca i32, align 4
    %valuesapplyIncrements = alloca [5 x i32], align 4
%t3 = add i32 0, 0

store i32 %t3, i32* %baseapplyIncrements
%t4 = add i32 5, 0

store i32 %t4, i32* %fa2applyIncrements
%t5 = add i32 0, 0

store i32 %t5, i32* %iapplyIncrements
br label %L0
L0:
%t6 = load i32, i32* %iapplyIncrements, align 4
%t7 = load i32, i32* %fa2applyIncrements, align 4
%t8_1 = icmp slt i32 %t6, %t7
%t8 = zext i1 %t8_1 to i32

%t9 = icmp ne i32 %t8, 0
br i1 %t9, label %L1, label %L2
L1:
%t10 = load i32, i32* %baseapplyIncrements, align 4
%t11 = load i32, i32* %iapplyIncrements, align 4
call void @incrementBy(i32* %baseapplyIncrements, i32 %t11)
%t13 = load i32, i32* %baseapplyIncrements, align 4
%t14 = load i32, i32* %iapplyIncrements, align 4
%t15 = add i32 %t13, %t14
%t16 = load i32, i32* %iapplyIncrements, align 4
%t17 = getelementptr [5 x i32], [5 x i32]* %valuesapplyIncrements, i32 0, i32 %t16
store i32 %t15, i32* %t17, align 4
%t18 = load i32, i32* %iapplyIncrements, align 4
%t19 = add i32 1, 0

%t20 = add i32 %t18, %t19
store i32 %t20, i32* %iapplyIncrements

br label %L0
L2:
%t21 = load i32, i32* %fa2applyIncrements, align 4
call i32(i8*, ...) @printf(i8* @.fmt, i32 %t21)
;ArrayVariable -----------
%t22 = add i32 0, 0

%t23 = getelementptr [5 x i32], [5 x i32]* %valuesapplyIncrements, i32 0, i32 %t22
%t24 = load i32, i32* %t23, align 4
;FIN - ArrayVariable --------

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t24)
;ArrayVariable -----------
%t25 = add i32 1, 0

%t26 = getelementptr [5 x i32], [5 x i32]* %valuesapplyIncrements, i32 0, i32 %t25
%t27 = load i32, i32* %t26, align 4
;FIN - ArrayVariable --------

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t27)
;ArrayVariable -----------
%t28 = add i32 2, 0

%t29 = getelementptr [5 x i32], [5 x i32]* %valuesapplyIncrements, i32 0, i32 %t28
%t30 = load i32, i32* %t29, align 4
;FIN - ArrayVariable --------

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t30)
;ArrayVariable -----------
%t31 = add i32 3, 0

%t32 = getelementptr [5 x i32], [5 x i32]* %valuesapplyIncrements, i32 0, i32 %t31
%t33 = load i32, i32* %t32, align 4
;FIN - ArrayVariable --------

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t33)
;ArrayVariable -----------
%t34 = add i32 4, 0

%t35 = getelementptr [5 x i32], [5 x i32]* %valuesapplyIncrements, i32 0, i32 %t34
%t36 = load i32, i32* %t35, align 4
;FIN - ArrayVariable --------

call i32(i8*, ...) @printf(i8* @.fmt, i32 %t36)
ret void
}

define void @main(){

call void @applyIncrements()
ret void
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1