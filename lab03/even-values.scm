;;  Use the 'filter' higher order function to 
;;  filter out the odd values from a list. 



(define (even-values lst)
  ; This is one short line
 '()
 (filter even? lst)
)

;; Test cases
(define (println s) (display s) (newline))

(println (even-values '(1 2 3 4)))
(println (even-values '()))
(println (even-values '(0 1 2 3 4)))
(println (even-values '(1 3 5 7)))
(println (even-values '(0 2 4 6 8)))
