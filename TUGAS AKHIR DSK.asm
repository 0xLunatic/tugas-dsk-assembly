.model small
.stack 100h
.data
    nama db 10,13,'Masukkan Nama : $'
    nim db 10,13,'Masukkan NIM : $'     
    fakultas db 10,13,'Masukkan Fakultas : $' 
    prodi db 10,13,'Masukkan Prodi : $'
    newLine db 10,13,'$'
    array db 100 dup("$")
    info db 10,13,'$'
    table db 10,13,'| Nama | NIM | Fakultas | Prodi |$'
    
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov si, offset array
    mov dx, offset nama
    mov ah, 9
    int 21h

; NIM CODE    
nimInitiator:
    mov ah, 1
    int 21h
    cmp al, 13
    je nimSet
    mov [si], al
    inc si
    jmp nimInitiator
        
nimSet:
    mov al, 32
    mov [si], al
    inc si                
        
    mov dx, offset newLine
    mov ah, 9
    int 21h 
    
    mov dx, offset nim
    mov ah, 9
    int 21h  
    jmp nimSaving
    
nimSaving:
    mov ah, 1
    int 21h
    cmp al, 13
    je fakultasInitiator
    mov [si], al
    inc si
    jmp nimSaving 
    
; FAKULTAS CODE
fakultasInitiator:
    je fakultasSet
    mov [si], al
    inc si
    jmp fakultasInitiator
        
fakultasSet:
    mov al, 32
    mov [si], al
    inc si                
        
    mov dx, offset newLine
    mov ah, 9
    int 21h 
    
    mov dx, offset fakultas
    mov ah, 9
    int 21h  
    jmp fakultasSaving
    
fakultasSaving:
    mov ah, 1
    int 21h
    cmp al, 13
    je prodiInitiator
    mov [si], al
    inc si
    jmp fakultasSaving  
    
; PRODI CODE
prodiInitiator:
    je prodiSet
    mov [si], al
    inc si
    jmp prodiInitiator
        
prodiSet:
    mov al, 32
    mov [si], al
    inc si                
        
    mov dx, offset newLine
    mov ah, 9
    int 21h 
    
    mov dx, offset prodi
    mov ah, 9
    int 21h  
    jmp prodiSaving
    
prodiSaving:
    mov ah, 1
    int 21h
    cmp al, 13
    je print
    mov [si], al
    inc si
    jmp prodiSaving    
    
    
print:
    mov dx, offset info
    mov ah, 9
    int 21h
                
    mov dx, offset newLine
    mov ah, 9
    int 21h
                
    mov dx, offset table
    mov ah, 9
    int 21h
                
    mov dx, offset newLine
    mov ah, 9
    int 21h
                
    mov dx, offset array
    mov ah, 9
    int 21h
    mov ah, 4ch
    int 21h