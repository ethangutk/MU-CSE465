;;; predicates: list? null? eq? equal?
;;; quote
;;; car cdr caddr
;;; cons list append
;;; length
(newline)
(display (cons 0 '(1 2 3)))(newline)
(display (cons '(a b) '(1 2 3)))(newline)
(display (cons (+ 10 20) '(1 2 3)))(newline)
(display (list '(a) '(b c d)))(newline)
(display (append '(a) '(b c d)))(newline)
(display (cdadr '((1 2) (3 4) (5 6))))(newline)
(display (list (+ 2 3) 0))(newline)
(display (list '(+ 2 3) 0))(newline)
(display (cons (car '(1 2 3)) (list 'a 'b 'c)))(newline)
(display (append '(1 2 3) (list 'a 'b 'c)))(newline)

(define (length lst)
	(cond
		((null? lst) 0)
		((list? lst) (+ 1 (length (cdr lst))))
		(else 0)
	)
)



(define (maxelt lst)
	(if (null? (cdr lst))
		(car lst) 
		(max (car lst) (maxelt (cdr lst))))
)

(define (minelt lst)
	(if (= (length lst) 1) 
		(car lst) 
		(min (car lst) (minelt (cdr lst))))
)

(define (numzeros lst) ; fill this in
    (cond
	( (null? lst) 0)
	( (= 0 (car lst)) (+ 1 (numzeros (cdr lst))))
	( else (numzeros(cdr lst)))
      )
)

(newline)
(display "Testing numzeros")(newline)
(display (numzeros `()))(newline) ; expect 0
(display (numzeros `(0)))(newline) ; expect 1
(display (numzeros `(0 0)))(newline) ; expect 2
(display (numzeros `(1 0 1 0 1 0)))(newline) ; expect 3
(display (numzeros `(1 1 1 1)))(newline) ; expect 0

(define (randlist len)
	(if (= len 0)
		'()
		(cons (random 100) 
			  (randlist (- len 1))
		)
	)
)

(define (allbutlast lst) 
	; complete. return original list, but without the last element
	; lst should never be empty (no need to check for that)
	;;'() 
	(cond 
	  ((null? (cdr lst)) '())
	  ( else (cons (car lst) (allbutlast (cdr lst))))
	)
)

(newline)
(display "Testing allbutlast")(newline)
(display (allbutlast '(1 2 3 4 5)))(newline) ; expect (1 2 3 4)
(display (allbutlast '(1)))(newline) ; expect ()


(define (ismember atm lst)
	(cond
		((null? lst) #f)
		((equal? atm (car lst)) #t)
		(else (ismember atm (cdr lst)))
	)
)

(define (odds lst)
	(cond
		((null? lst) '())
		((odd? (car lst)) (cons (car lst) (odds (cdr lst))))
		(else (odds (cdr lst)))
	)
)

(define (minandmax lst) ; fill this in. return (min, max)
    (list (minelt lst) (maxelt lst))
)

(newline)
(display "Testing minandmax")(newline)
(display (minandmax `( 1 2 3 4 5)))(newline) ; (1 5)
(display (minandmax `( 5 4 3 2 1)))(newline) ; (1 5)
(display (minandmax `( 5)))(newline) ; (5 5)
(display (minandmax `( 5 -5 3 -3 2 -2 1 -1 0)))(newline) ; (-5 5)

(define (zip lst1 lst2) 
  (zipRecur (list (list (car lst1) (car lst2))) (cdr lst1)  (cdr lst2))
)


;; cons removes last element of a list
;; car removes the first element of a list
;; cdr

(define (zipRecur currList lst1 lst2) ; fill this in
; input is two simple lists of same length: (1 2 3 4) (a b c d)
; returns ((1 a) (2 b) (3 c) (4 d))
	
	;; If one of the list is equal to zero,
	;; then return nil
	(cond
	  ;; if the list only has one element left, then end it
	  ((= 1 (length lst1)) (append currList (list (list (car lst1) (car lst2)))) )
	  ;; otherwise return the first element of the lsit
	  (else (zipRecur (append currList (list (list (car lst1) (car lst2)))) (cdr lst1) (cdr lst2)) )
	)
)


(newline)
(display "Testing zip")(newline)
(display (zip '(1 2 3 4) '(a b c d)))(newline)

(define (remove v lst)
	(cond 
		((null? lst)
			'()
		)
		((= v (car lst))
			(cdr lst))
		(else 
			(cons 
				(car lst) 
				(remove v (cdr lst))
			)
		)
	)
)

(define (sort lst)
	(if (null? lst)
		'()
		(cons (minelt lst) (sort (remove (minelt lst) lst)))
	)
)
