declare i32 @printf(i8*, ...)
declare i32 @exit(i32)
    @a = global i32 zeroinitializer
define i32 @findMax(i32* %arrfindMax){
    %ifindMax = alloca i32, align 4
    %maxfindMax = alloca i32, align 4
;ArrayVariable -----------
%t0 = add i32 0, 0

%t1 = getelementptr [1 x i32], [1 x i32]* %arrfindMax, i32 0, i32 %t0 
%t2 = load i32, i32* %t1, align 4
;FIN - ArrayVariable --------

store i32 %t2, i32* %maxfindMax
%t3 = add i32 1, 0

store i32 %t3, i32* %ifindMax
br label %L0
L0:
%t4 = load i32, i32* %ifindMax, align 4
%t5 = add i32 5, 0

%t6_1 = icmp slt i32 %t4, %t5
%t6 = zext i1 %t6_1 to i32

%t7 = icmp ne i32 %t6, 0
br i1 %t7, label %L1, label %L2
L1:
;ArrayVariable -----------
%t8 = load i32, i32* %ifindMax, align 4
%t9 = getelementptr [1 x i32], [1 x i32]* %arrfindMax, i32 0, i32 %t8 
%t10 = load i32, i32* %t9, align 4
;FIN - ArrayVariable --------

%t11 = load i32, i32* %maxfindMax, align 4
%t12_1 = icmp sgt i32 %t10, %t11
%t12 = zext i1 %t12_1 to i32

%t16 = icmp ne i32 %t12, 0
br i1 %t16, label %L3, label %L4
L3:
;ArrayVariable -----------
%t13 = load i32, i32* %ifindMax, align 4
%t14 = getelementptr [1 x i32], [1 x i32]* %arrfindMax, i32 0, i32 %t13
%t15 = load i32, i32* %t14, align 4
;FIN - ArrayVariable --------

store i32 %t15, i32* %maxfindMax

br label %L4
L4:
%t17 = load i32, i32* %ifindMax, align 4
%t18 = add i32 1, 0

%t19 = add i32 %t17, %t18
store i32 %t19, i32* %ifindMax

br label %L0
L2:
%t20 = load i32, i32* %maxfindMax, align 4
ret i32 %t20
ret i32 0
}

define i32 @main(){
    %maximmain = alloca i32, align 4
    %arrmain = alloca [5 x i32], align 4
%t21 = add i32 64, 0

%t22 = add i32 0, 0

%t23 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t22  
store i32 %t21, i32* %t23, align 4
%t24 = add i32 34, 0

%t25 = add i32 1, 0

%t26 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t25  
store i32 %t24, i32* %t26, align 4
%t27 = add i32 25, 0

%t28 = add i32 2, 0

%t29 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t28  
store i32 %t27, i32* %t29, align 4
%t30 = add i32 12, 0

%t31 = add i32 3, 0

%t32 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t31  
store i32 %t30, i32* %t32, align 4
%t33 = add i32 22, 0

%t34 = add i32 4, 0

%t35 = getelementptr [5 x i32], [5 x i32]* %arrmain, i32 0, i32 %t34  
store i32 %t33, i32* %t35, align 4


%t37 = call i32 @findMax(i32* %arrmain)

store i32 %t37, i32* %maximmain
%t38 = load i32, i32* %maximmain, align 4
call i32(i8*, ...) @printf(i8* @.fmt, i32 %t38)
ret i32 0
}

@.fmt = private constant [4 x i8] c"%d\0A\00", align 1