; basics.scm
; From within Scheme interpreter: (load "basics.scm")

; This little snippet prevents scheme from continuing after the 
; first error is encountered. It just prints the error and exits scheme. 
(bind-default-condition-handler '() (lambda (x) (display x) (exit)))

;; The lab really begins here


(define COST 10)

(display "cost:") (newline)
(display COST)(newline)

(define (demo)
	(display (+ 2 3))
	(newline)
	(display (ACOS -1.0))
	(newline)
	(display (ABS -232))
	(newline)
	(display (+ (* 2 4) 3))
	(newline)
	(display (+ (* 2 4) 3))
	(newline)
	#t
)

(display "Demo")(newline)
(demo)

(display "Lambda")(newline)
(display ((lambda (x y) (* x y)) 4 5))
(newline)

;;; Write lambda expression for computing 
;;; the perimeter of a rectangle, given its 
;;; length and width as parameters, and
;;; display the perimeter of a ractangle with
;;; A length of 50 and a width of 25
;;; (Using your lambda function!)





(display "Your Lambda for the perimeter:")(newline)
;; FILL IT IN HERE
;; This calculates the perimeter given a length and width
;; thus a 20x30 shape will have 100 as a result
(display ((lambda (L W) (+ L L W W)) 25 50))
(newline)


(define (mycube x) (* x x x))

(define (sqr x) (* x x))

(define (hyp s1 s2) 
	(sqrt (+ (sqr s1) (sqr s2)))
)

(define (logbase x base)
	(/ (log x) (log base))
)

(define (distance x1 y1 x2 y2)
	;;; FILL THIS IN
	;;(define yDiff (- y2 y1))
	;;(define xDiff (- x2 x1))
	(hyp (- x2 x1) (- y2 y1))
)

(display "Distance")(newline)
(display (distance 3 4 6 8))(newline)


(define (perimeter L W)
	(* 2 (+ L W))
)

;;;; some predicates and relational operators: >= > < <= = EVEN? ODD? ZERO? AND OR

(define (max a b)
	(if (> a b) a b)
)

;; A number is small if it is less than 10
(define (isSmall x)
	;;; FILL THIS IN	
	(< x 10)
)

(display "isSmall")(newline)
(display (isSmall 5))(newline)
(display (isSmall 10))(newline)
(display (isSmall 15))(newline)

(define (fib n)
	(cond
		((= n 1) 1)
		((= n 2) 1)
		(else (+ (fib (- n 1)) (fib (- n 2))))
	)
)

(display "Fibbonacci Numbers")(newline)
(display (fib 1))(newline)
(display (fib 2))(newline)
(display (fib 3))(newline)
(display (fib 4))(newline)
(display (fib 5))(newline)
(display (fib 6))(newline)
(display (fib 7))(newline)

; Quadrants are based on the signs of x and y
;  2 | 1
;  --+--
;  3 | 4
(define (isInQuadrant1 x y)
	;;; FILL THIS IN
	(and (>= x 0) (>= y 0))
)

(display "IsInQuadrant1:")(newline)
(display (isInQuadrant1 1 1))(newline)
(display (isInQuadrant1 -3 2))(newline)
(display (isInQuadrant1 5 -1))(newline)
(display (isInQuadrant1 0 0))(newline)
(display (isInQuadrant1 -10 -10))(newline)

(define (quadrant x y)
;;; FILL THIS IN
	(cond
		( (and (>= x 0) (>= y 0)) 1)
		( (and (<  x 0) (>= y 0)) 2)
		( (and (<  x 0) (<  y 0)) 3)
		( else 4)
	  )
)


(display "Quadrant:")(newline)
(display (quadrant 1 1))(newline)
(display (quadrant -1 4))(newline)
(display (quadrant 5 -3))(newline)
(display (quadrant -12 -8))(newline)
(display (quadrant 0 0))(newline)

(define (computeGrossPay hours rate)
  (cond
    ( (> hours 60) (+ (* (* rate 2)   (- hours 60) ) (computeGrossPay 60 rate) ) )
    ( (> hours 40) (+ (* (* rate 1.5) (- hours 40) ) (computeGrossPay 40 rate) ) )
    ( else (* rate hours))
    )
  ;;; FILL THIS IN
  ;;; Hours over 40 are given time and half. Hours over 60 are given double time.
)

(display "computeGrossPay:")(newline)
(display (computeGrossPay 35 15.00))(newline)
(display (computeGrossPay 50 15.00))(newline)
(display (computeGrossPay 75 15.00))(newline)

