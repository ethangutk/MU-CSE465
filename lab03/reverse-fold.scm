;;  Use the 'fold' or 'fold-right' and 'cons' functions to 
;;  reverse all of the elements of a list. 

;; You may NOT use the built-in reverse function!
;; Doing so is an integrity vialoation 


; (fold )
; (fold-left init +)
; reduce or accumulate are used in other lanuages

; (fold-left + 0 L)
; (1 2 3 4 5) == 15
; (fold-right cons '() L)
; (fold cons '() L)
; ^^^^^^^^^^^ CORRECT VERSION
; 
;(fold-right + L 0)
; 



(define (my-reverse lst)
  ; This is one short line
  (fold cons '() lst)
)

;; Test cases
(define (println s) (display s) (newline))
(define (reverse . args) (display "DO NOT USE REVERSE! ") (newline) '())

(println (my-reverse '(1 2 3 4)))
(println (my-reverse '(a b c d)))
(println (my-reverse '()))

