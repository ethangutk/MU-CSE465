(define (mystery1 lst v)
	(COND
		((NULL? lst) lst)
		((>= (car lst) v) (cons 1 (mystery1 (cdr lst) v)))
		(else             (cons 0 (mystery1 (cdr lst) v)))
	)
)
(newline)
(display (mystery1 '(10) 4)) (newline)
(display (mystery1 '(1 2 3 4 5 4 3 2 1) 4))(newline)

; Determine what is displayed, without running the code.

(define (mystery2 lst)
     (if (NULL? lst)
	      '(0 0)
		  (list (+ (caar lst) (car (mystery2 (cdr lst))))
				(+ (cadar lst) (cadr (mystery2 (cdr lst))))		  
		   )
	)
)

(newline)
(display (mystery2 '((1 2)) ))(newline)
(display (mystery2 '((1 2) (3 4) (5 6))))(newline)

(define (mystery3 lst)
	(if (<= (length lst) 1)
		#t
		(and (< (car lst) (cadr lst)) (mystery3 (cdr lst)))
	)
)

(newline)
(display (mystery3 '(5 4 3)))(newline)
(display (mystery3 '(1 2 3 4)))(newline)
