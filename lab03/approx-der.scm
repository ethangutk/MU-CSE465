;; Compute the derivative of a function in using numeric differentiation
;; ---------------------------------------------------------------------------
;;
;; Write a higher order function `(approx-der f h)`  that uses the 
;; symmetric difference quotient to find a numerical approximation 
;; to the derivative of the function f
;;
;; Your scheme function should accept two parameters. 
;; The first, f, is a function. 
;; The second parameter, h, is used to approximate the derivative. 
;;
;; The formula for the symmetric quotient method is this:
;;
;;              f(t+h) - f(t-h) 
;;   f'  =   ------------------
;;                  2h
;;
;; Choosing a smaller value of h leads to a better approximation. 
;;
;;;;;;;;;;;



(define (approx-der f h) 
  ;; This function should return another function that 
  ;; computes the derivative, NOT 0. Delete the 0!
  (lambda (t)
    (/ (- (f (+ t h)) (f (- t h) ) ) 
		 (* 2 h))
    )
)


;;;;;;;;;;
;; Tests
;; -----
;; This portion of the file will test your implementation. 
;; You can check that the output of the tests is correct by
;; running `make check` at the bash prompt. 
;;


(define (println x) (begin (display x) (newline)))


; Check   der(x^2) = 2x
(let ((f (lambda (x) (* x x)))
      (h 0.0001))
   (begin
       (println (round ( (approx-der f h) 1))) ; Expect 2
       (println (round ( (approx-der f h) 2))) ; Expect 4
       (println (round ( (approx-der f h) -2))) ; Expect -4
       (println (round ( (approx-der f h) 10))) ; Expect 20
   )
)


; Check der(10x+2x^2)  = 10+4x
(let ((f (lambda (x) (+ (* 10 x)  (* 2 x x))))
      (h 0.0001))
   (begin
       (println (round ( (approx-der f h) 1))) ; Expect 14
       (println (round ( (approx-der f h) 2))) ; Expect 18
       (println (round ( (approx-der f h) -2))) ; Expect 2
       (println (round ( (approx-der f h) 10))) ; Expect 50
   )
)


