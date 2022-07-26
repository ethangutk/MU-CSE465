; (map (lambda (x) (* x x x x)) L)
; 
; Write a function that uses the schem 'map' higher 
;; order function in order to compute the cubed value 
;; of every element of a list. 
;;

;;  You MUST use map -- NOT recursion -- to solve this. 

(define (cube-all lst) 
  (map (lambda (x) (* x x x)) lst)
)

;; Test cases
(define (println s) (display s) (newline))

(println (cube-all '(1 2 3 4)))
(println (cube-all '()))
(println (cube-all '(0 -1 1 -2 2 3 -3)))

