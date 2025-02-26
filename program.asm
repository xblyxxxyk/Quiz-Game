section .data
   delay dq 1,100000000
   cls db 27, "[2J"

   points db 0
   question db 0

   t1 db "Welcome! " ; 9
   t2 db "Press Enter to continue..." ; 26


   q1 db "Question 1: Who is the current U.S. President?", 10, "A: Joe Biden", 10, "B: Donald Trump", 10, "C: Hillary Clinton", 10, "D: Kamala Harris", 10

   q2 db "Question 2: Who was the first man on the moon?", 10, "A: Neil Armstrong", 10, "B: Donald Trump", 10, "C: Joseph Stalin", 10, "D: Jurij Gagarin", 10

   q3 db "Question 3: Who was the first man in cosmos?", 10, "A: Jurij Gagarin", 10, "B: Joseph Stalin", 10, "C: Micheal Jackson", 10, "D: Ronald Reagan", 10


   sc0txt db 10, "You scored 0/3 points!" ; 22
   sc1txt db 10, "You scored 1/3 points!"
   sc2txt db 10, "You scored 2/3 points!"
   sc3txt db 10, "You scored 3/3 points!"


   endtext db "Quiz finished!"

   correct db "Correct!"
   wrong db "Wrong!"


section .bss
   write resb 32
   wq1 resb 1
   wq2 resb 1
   wq3 resb 1

section .text
   global _start



_start:
   call pt1
   call pt2

   call cq1


   call exit




pt1:
   mov rax, 1
   mov rdi, 1
   mov rsi, t1
   mov rdx, 9
   syscall
   ret

pt2:
   mov rax, 1
   mov rdi, 1
   mov rsi, t2
   mov rdx, 26
   syscall

   mov rax, 0
   mov rdi, 0
   mov rsi, write
   mov rdx, 32
   syscall

   call clean
   ret 

sleep:
   mov rax, 35
   mov rdi, delay
   mov rsi, 0
   syscall
   ret

clean:
   mov rax, 1
   mov rdi, 1
   mov rsi, cls
   mov rdx, 4
   syscall
   ret

exit:
   mov rax, 60
   xor rdx, rdx
   syscall

Success:
   mov rax, 1
   mov rdi, 1
   mov rsi, correct
   mov rdx, 8
   syscall

   mov rax, 35
   mov rdi, delay
   mov rsi, 0
   syscall


   inc byte [points]
   inc byte [question]
   mov al, [question]

   cmp al, 1
   je cq1

   cmp al, 2
   je cq2

   cmp al, 3
   je endscreen
cq1:
   mov rax, 1
   mov rdi, 1
   mov rsi, q1
   mov rdx, 112
   syscall

   mov rax, 0
   mov rdi, 0
   mov rsi, wq1
   mov rdx, 1
   syscall

   mov al, [wq1]

   cmp al, 'B'
   je Success

   cmp al, 'b'
   je Success


   jmp Fail
cq2:
   mov rax, 1
   mov rdi, 1
   mov rsi, cls
   mov rdx, 4
   syscall

   mov rax, 1
   mov rdi, 1
   mov rsi, q2
   mov rdx, 115
   syscall

   mov rax, 0
   mov rdi, 0
   mov rsi, wq2
   mov rdx, 1
   syscall


   mov al, [wq2]

   cmp al, 'A'
   je Success

   cmp al, 'a'
   je Success


   jmp Fail

cq3:
   mov rax, 1
   mov rdi, 1
   mov rsi, cls
   mov rdx, 4
   syscall

   mov rax, 1
   mov rdi, 1
   mov rsi, q3
   mov rdx, 115
   syscall

   mov rax, 0
   mov rdi, 0
   mov rsi, wq3
   mov rdx, 1
   syscall


   mov al, [wq3]

   cmp al, 'A'
   je Success


   cmp al, 'a'
   je Success


   jmp Fail
endscreen:
   mov rax, 1
   mov rdi, 1
   mov rsi, cls
   mov rdx, 4
   syscall

   mov rax, 1
   mov rdi, 1
   mov rsi, endtext
   mov rdx, 14
   syscall

   mov rax, 1
   mov rdi, 1
   mov rsi, points
   mov rdx, 1
   syscall

   mov al, [points]

   cmp al, 0
   je sc0p

   cmp al, 1
   je sc1p

   cmp al, 2
   je sc2p

   cmp al, 3
   je sc3p



Fail:
   mov rax, 1
   mov rdi, 1
   mov rsi, wrong
   mov rdx, 6
   syscall

   mov rax, 35
   mov rdi, delay
   mov rsi, 0
   syscall

   mov al, [question]

   cmp al, 1
   je cq2

   cmp al, 2
   je cq3

   cmp al, 3
   je endscreen

sc0p:
   mov rax, 1
   mov rdi, 1
   mov rsi, sc0txt
   mov rdx, 23
   syscall

   mov rax, 35
   mov rdi, delay
   mov rsi, 0
   syscall

   call exit


sc1p:
   mov rax, 1
   mov rdi, 1
   mov rsi, sc1txt
   mov rdx, 23
   syscall

   mov rax, 35
   mov rdi, delay
   mov rsi, 0
   syscall

   call exit

sc2p:
   mov rax, 1
   mov rdi, 1
   mov rsi, sc2txt
   mov rdx, 23
   syscall

   mov rax, 35
   mov rdi, delay
   mov rsi, 0
   syscall

   call exit

sc3p:
   mov rax, 1
   mov rdi, 1
   mov rsi, sc3txt
   mov rdx, 23
   syscall

   mov rax, 35
   mov rdi, delay
   mov rsi, 0
   syscall

   call exit