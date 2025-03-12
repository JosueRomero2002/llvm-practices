declare void @exit(i32)
declare i32 @printf(i8*, ...)

define i32 @ispalindrome(i32 %n){
entry:
    %reversedInteger = alloca i32, align 4
    %remainder = alloca i32, align 4
    %originalInteger = alloca i32, align 4

    %n_local = alloca i32, align 4

    store i32 %n, i32* %n_local, align 4
    store i32 0, i32* %reversedInteger, align 4
    store i32 %n, i32* %originalInteger, align 4

    br label %loop

loop:
    %nval = load i32, i32* %n_local, align 4
    %res = icmp eq i32 %nval, 0
    br i1 %res, label %end_loop, label %loop_body

loop_body:
    %mod = srem i32 %nval, 10
    store i32 %mod, i32* %remainder, align 4
    
    %revIntVal = load i32, i32* %reversedInteger, align 4
    %remVal = load i32, i32* %remainder, align 4
    %revIntMul = mul i32 %revIntVal, 10
    %revIntNew = add i32 %revIntMul, %remVal
    store i32 %revIntNew, i32* %reversedInteger, align 4

    %ndiv = sdiv i32 %nval, 10
    store i32 %ndiv, i32* %n_local, align 4
    br label %loop

end_loop:
    %origInt = load i32, i32* %originalInteger, align 4
    %revIntVal2 = load i32, i32* %reversedInteger, align 4
    
    %retVal = icmp eq i32 %origInt, %revIntVal2 
    %retVali32 = zext i1 %retVal to i32
    ret i32 %retVali32
}

define void @main(){
entry:
    %pal = call i32 @ispalindrome(i32 343)
    call i32(i8*, ...) @printf(i8* @.fmt, i32 %pal)
    ret void
}

define void @_start(){
entry:
    call void() @main()
    call void(i32) @exit(i32 0)
    unreachable
}

@.fmt = private constant [23 x i8] c"ispalindrome(343): %d\0a\00"
