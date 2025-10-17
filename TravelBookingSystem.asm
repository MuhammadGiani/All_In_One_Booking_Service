data segment
    welcome_msg db "Welcome to All-in-One Booking Services!", 0Dh, 0Ah, 
                db " ", 0Dh, 0Ah
                db "$"
    main_menu db 0Dh, 0Ah, "Select a Destination:", 0Dh, 0Ah 
               db " ", 0Dh, 0Ah 
               db "1. Dubai - 750 Euro ", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "2. Italy - 650 Euro ", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "3. Paris - 850 Euro ", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "$" 
               db " ", 0Dh, 0Ah
    destination_prompt db "Enter your choice (1-3): $"
    
    
    activities_menu db 0Dh, 0Ah, "Select Your Activity Package:", 0Dh, 0Ah
                    db "1. Adventure Package: Water Sports, Hiking, Paragliding - 250 Euros", 0Dh, 0Ah
                    db "2. Cultural Package: Historical Sites Visit, Traditional Cuisine Tour - 180 Euros", 0Dh, 0Ah
                    db "3. Relaxation Package: Beach Stay, Spa, Yoga Sessions - 300 Euros", 0Dh, 0Ah
                    db "4. Wildlife Package: Safari Adventure, Bird Watching, Nature Walks - 220 Euros", 0Dh, 0Ah
                    db "5. Family Fun Package: Theme Park, Aquarium Visit, City Tours - 200 Euros", 0Dh, 0Ah
                    db "$"
    activity_prompt db "Enter your choice (1-5): $"
                    
                    
    
    country_menu db " ", 0Dh, 0Ah
                 db " ", 0Dh, 0Ah
                 db " ", 0Dh, 0Ah
                 db " ", 0Dh, 0Ah
                 db "Where are you from?", 0Dh, 0Ah,
                 db " ", 0Dh, 0Ah 
                 db "1. Pakistan", 0Dh, 0Ah,
                 db " ", 0Dh, 0Ah 
                 db "2. India", 0Dh, 0Ah,
                 db " ", 0Dh, 0Ah 
                 db "3. China", 0Dh, 0Ah,
                 db " ", 0Dh, 0Ah 
                 db "4. Bangladesh", 0Dh, 0Ah,
                 db " ", 0Dh, 0Ah 
                 db "$"   
                 
    country_prompt db "Enter your choice (1-4): $" 
    
    
    hotel_menu db 0Dh, 0Ah, "Do you want to book a hotel? (Y/N): $"
 
    
    hotel_options db " ", 0Dh, 0Ah
               db 0Dh, 0Ah, "Choose a Hotel for your stay:", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "1. Ramada - 100 Euro/night", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "2. Oreal Continental - 150 Euro/night", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "3. Merroit - 200 Euro/night", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "4. Pearl Continental - 250 Euro/night", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "5. Hilton - 300 Euro/night", 0Dh, 0Ah
               db " ", 0Dh, 0Ah
               db "$"

    hotel_prompt db "Enter your choice (1-5): $"

    

    


    
    

    
    need_transport_msg db 0Dh, 0Ah, "Do you want transportation for your activities? (Y/N): $" 
    
    transport_menu db " ", 0Dh, 0Ah
                   db "Choose a mode of transport:", 0Dh, 0Ah 
                   db " ", 0Dh, 0Ah
                   db "1. Bus - 10 Euro", 0Dh, 0Ah
                   db " ", 0Dh, 0Ah
                   db "2. Train - 20 Euro", 0Dh, 0Ah
                   db " ", 0Dh, 0Ah
                   db "3. Speed Train - 50 Euro", 0Dh, 0Ah
                   db " ", 0Dh, 0Ah
                   db "4. Bike - 5 Euro", 0Dh, 0Ah
                   db " ", 0Dh, 0Ah
                   db "5. Private Cab - 100 Euro", 0Dh, 0Ah
                   db " ", 0Dh, 0Ah 
                   db "$"
    transport_prompt db "Enter your choice (1-5): $"  
    
    

    
    promo_prompt db 0Dh, 0Ah, "Do you have a promotional code? (Y/N): $"
    promo_code_msg db "Enter your promo code: $"
    invalid_promo_msg db "Invalid promo code. Try again or Exit? (R/E): $"
    final_cost_msg db "Your Final Cost is: $"
    thank_you db "Thank you for using our services!", 0Dh, 0Ah, "$"
    invalid_input_msg db "Invalid Input! Restarting...", 0Dh, 0Ah, "$"

   

    promo_code db "DIS20", 0
    user_code db 6 dup(?)

    dubai_cost dw 750
    italy_cost dw 650
    paris_cost dw 850

    adventure_cost dw 250
    cultural_cost dw 180
    relaxation_cost dw 300
    wildlife_cost dw 220
    family_cost dw 200

    ramada_cost dw 100
    oreal_cost dw 150
    merroit_cost dw 200
    pearl_cost dw 250
    hilton_cost dw 300  
    

    bus_cost dw 10
    train_cost dw 20
    speed_train_cost dw 50
    bike_cost dw 5
    cab_cost dw 100

    promo_discount dw 20
    total_cost dw 0
    activity_cost dw 0
    hotel_cost dw 0
    transport_cost dw 0

data ends

code segment
start:
    ; Initialize DS
    mov ax, @data
    mov ds, ax

    ; Print Welcome Message
    lea dx, welcome_msg
    mov ah, 09h
    int 21h

    ; Show Main Menu
    lea dx, main_menu
    mov ah, 09h
    int 21h

    ; Get Destination Choice
    lea dx, destination_prompt
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 1
    je dubai_selected
    cmp al, 2
    je italy_selected
    cmp al, 3
    je paris_selected
    jmp invalid_input

dubai_selected:
    mov ax, dubai_cost
    mov total_cost, ax
    jmp ask_country

italy_selected:
    mov ax, italy_cost
    mov total_cost, ax
    jmp ask_country

paris_selected:
    mov ax, paris_cost
    mov total_cost, ax
    jmp ask_country

ask_country:
    ; Show Country Menu
    lea dx, country_menu
    mov ah, 09h
    int 21h

    ; Get Country Choice
    lea dx, country_prompt
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 1
    je pakistan
    cmp al, 2
    je india
    cmp al, 3
    je china
    cmp al, 4
    je bangladesh
    jmp invalid_input

pakistan:
    add total_cost, 200
    jmp hotel_booking

india:
    add total_cost, 150
    jmp hotel_booking

china:
    add total_cost, 300
    jmp hotel_booking

bangladesh:
    add total_cost, 250
    jmp hotel_booking

hotel_booking:
    ; Ask for Hotel Booking
    lea dx, hotel_menu
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h 
    AND al, 0DFh ;both cases
    cmp al, 'Y'
    je select_hotel
    cmp al, 'N'
    je transport_menu_display
    jmp invalid_input

select_hotel:
    ; Show hotel options menu
    lea dx, hotel_options
    mov ah, 09h
    int 21h

    ; Get hotel choice
    lea dx, hotel_prompt
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 1
    je select_ramada
    cmp al, 2
    je select_oreal
    cmp al, 3
    je select_merroit
    cmp al, 4
    je select_pearl
    cmp al, 5
    je select_hilton
    jmp invalid_input

select_ramada:
    mov ax, ramada_cost
    mov hotel_cost, ax
    jmp transport_menu_display

select_oreal:
    mov ax, oreal_cost
    mov hotel_cost, ax
    jmp transport_menu_display

select_merroit:
    mov ax, merroit_cost
    mov hotel_cost, ax
    jmp transport_menu_display

select_pearl:
    mov ax, pearl_cost
    mov hotel_cost, ax
    jmp transport_menu_display

select_hilton:
    mov ax, hilton_cost
    mov hotel_cost, ax
    jmp transport_menu_display

invalid_input:
    lea dx, invalid_input_msg
    mov ah, 09h
    int 21h
    jmp start

transport_menu_display:
    ; Show Transport Menu
    lea dx, transport_menu
    mov ah, 09h
    int 21h

    ; Get Transport Choice
    lea dx, transport_prompt
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 1
    je bus
    cmp al, 2
    je train
    cmp al, 3
    je speed_train
    cmp al, 4
    je bike
    cmp al, 5
    je cab
    jmp invalid_input

bus:
    mov ax, bus_cost
    add transport_cost, ax
    jmp promo_check

train:
    mov ax, train_cost
    add transport_cost, ax
    jmp promo_check

speed_train:
    mov ax, speed_train_cost
    add transport_cost, ax
    jmp promo_check

bike:
    mov ax, bike_cost
    add transport_cost, ax
    jmp promo_check

cab:
    mov ax, cab_cost
    add transport_cost, ax
    jmp promo_check

promo_check:
    lea dx, promo_prompt
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    AND al, 0DFh ;both cases
    cmp al, 'Y'
    je enter_promo
    cmp al, 'N'
    je final_output
    jmp invalid_input

enter_promo:
    lea dx, promo_code_msg
    mov ah, 09h
    int 21h
    lea di, user_code
    mov cx, 5
input_code:
    mov ah, 01h
    int 21h
    mov [di], al
    inc di
    loop input_code
    lea si, promo_code
    lea di, user_code
    mov cx, 5
compare_loop:
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jne invalid_promo
    inc si
    inc di
    loop compare_loop
    jmp apply_promo

apply_promo:
    mov ax, total_cost     ; Load total_cost into AX
    sub ax, promo_discount ; Subtract promo_discount from AX
    mov total_cost, ax     ; Store the result back into total_cost
    jmp final_output


invalid_promo:
    lea dx, invalid_promo_msg
    mov ah, 09h
    int 21h
    jmp promo_check

final_output:
    ; Calculate Final Cost
    mov ax, total_cost      ; Load total_cost into AX
    add ax, transport_cost  ; Add transport_cost to AX
    mov total_cost, ax      ; Store the updated total_cost back into total_cost

    ; Display the Final Cost Message
    lea dx, final_cost_msg  ; Load the address of the final cost message
    mov ah, 09h
    int 21h                 ; Print the message

    ; Print the Total Cost
    mov ax, total_cost      ; Load total_cost into AX
    call print_number       ; Print the value of total_cost


    ; Display Thank You Message
    lea dx, thank_you
    mov ah, 09h
    int 21h

    ; Exit Program
    mov ah, 4Ch
    int 21h

print_number:
    ; Converts AX to Decimal and Prints
    push ax
    mov cx, 0
    mov bx, 10
convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convert_loop
print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits
    pop ax
    ret
code ends
end start

