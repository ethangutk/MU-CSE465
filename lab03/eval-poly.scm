;;
;;  Write a RECURSIVE function `(eval-polynomial coefficients x)`
;;  that accepts a list (a0, a1, ..., a_n) of n+1 coefficients, 
;;  and returns result of evaluating the order-n polynomial 
;;      p(x) = a0 + a1 x + a2 x^2 + ... + a_n x^n.
;;  If the list of coefficients is empty, 
;;  then p(x) should return zero.
;;
;;;;;;;;;




(define (eval-polynomial coefficients x)
	(
	 if (null? coefficients) 
	 0
	 (+ (car coefficients) (* x (eval-polynomial (cdr coefficients) x) ) )
	)
)

;;;;;;;;;;;;;
;; Tests

(define (println s) (begin (display s) (newline)))

(println 
  (eval-polynomial `() 5)  ; Expext 0
  )

(println
  (eval-polynomial `(10 3 -4 2) 5)  ; Expect 175
  )


(println
  (eval-polynomial `(10) 3) ; Expect 10
  )
