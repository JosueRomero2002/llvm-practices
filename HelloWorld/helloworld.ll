; Declare external C functions
declare i32 @printf(i8*, ...)

; Define constant string
@.str = private unnamed_addr constant [13 x i8] c"Hello World\0A\00"

define i32 @main() {
entry:
  ; Call printf with our string
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  
  ; Return 0
  ret i32 0
}