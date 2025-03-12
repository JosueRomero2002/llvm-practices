define i32 @suma(i32 %a, i32 %b) {
entry:
    %resultado = add i32 %a, %b  ; Sumamos los dos parámetros
    ret i32 %resultado           ; Retornamos el resultado
}