declare void @exit(i32)
declare i32 @printf(i8*,...)

define void @minimum(i32* %array, i32 %size, i32* %minPos, i32* %minVal) {
entry:
    ; Inicializar min y minPos con el primer elemento del array
    %pointer = getelementptr i32, i32* %array, i32 0
    %arrVal = load i32, i32* %pointer, align 4
    store i32 %arrVal, i32* %minVal, align 4
    store i32 0, i32* %minPos, align 4

    %c = alloca i32, align 4
    store i32 1, i32* %c, align 4
    br label %loop

loop:
    %cval = load i32, i32* %c, align 4
    %res = icmp slt i32 %cval, %size
    br i1 %res, label %loop_body, label %end_loop

loop_body:
    %pointer2 = getelementptr i32, i32* %array, i32 %cval
    %arrC = load i32, i32* %pointer2, align 4

    %minVal2 = load i32, i32* %minVal, align 4
    %res2 = icmp slt i32 %arrC, %minVal2
    br i1 %res2, label %if_body, label %end_if

if_body:
    store i32 %arrC, i32* %minVal, align 4
    store i32 %cval, i32* %minPos, align 4
    br label %end_if

end_if:
    %cInc = add i32 %cval, 1
    store i32 %cInc, i32* %c, align 4
    ; Volvemos al inicio del loop para evaluar el siguiente elemento
    br label %loop

end_loop:
    ret void
}

define void @main() {
    %array = alloca [10 x i32], align 4
    %pos = alloca i32, align 4
    %min = alloca i32, align 4

    store [10 x i32] [i32 91, i32 96, i32 48, i32 10, i32 7, i32 52, i32 9, i32 24, i32 45, i32 9], [10 x i32]* %array, align 4

    ; Llamada corregida a @minimum (devuelve void)
    call void @minimum(i32* %array, i32 10, i32* %pos, i32* %min)

    %minVal = load i32, i32* %min, align 4
    %posVal = load i32, i32* %pos, align 4

    call i32(i8*, ...) @printf(i8* @.fmt, i32 %minVal, i32 %posVal)
    ret void
}

; define void @_start(){
; entry: 
;     call void @main()
;     call void @exit(i32 0)
;     unreachable
; }

@.fmt = private constant [31 x i8] c"Minimum element: %d at pos %d\0A\00"
