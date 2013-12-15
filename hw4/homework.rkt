#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; Pro 1
(define (sequence low high stride)
 (cond [(> low high) '()]
       [(<= low high)(cons low (sequence (+ low stride) high stride))]
       [#t '()]))

;;Pro 2

(define (string-append-map xs suffix)
  (map (lambda(x) (string-append x suffix)) xs))

;;Pro 3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
  [(null? xs) (error "list-nth-mod: empty list")]
  [#t (let ([elem (remainder n (length xs))])        
      (car (list-tail xs elem)))]))

;;Pro 4
(define (stream-for-n-steps s n) 
  (let ([sel (s)])
    (if (> n 0)
        (cons (car sel)
              (stream-for-n-steps (cdr sel) (- n 1)))
        null)))

;;Pro 5
(define funny-number-stream
  (letrec ([f (lambda (x) 
                (if (= (remainder x 5) 0) (cons (- 0 x)(lambda () (f (+ x 1))))
                (cons x (lambda () (f (+ x 1))))))])
    (lambda () (f 1))))

;;Pro 6
(define (dan-then-dog)
  (letrec
      ((dan (lambda () (cons "dan.jpg" dog)))
       (dog (lambda () (cons "dog.jpg" dan))))(dan)))

;;Pro 7
(define (stream-add-zero s)
  (letrec ([f (lambda (s) (cons (cons 0 (car (s)))
                                (lambda () (f (cdr (s))))))])
           (lambda () (f s))))

;;Pro 8
(define (cycle-lists xs ys)        
  (letrec ([stream-thunk (lambda(ns fs n)        
        (cons (cons(list-nth-mod ns n) (list-nth-mod fs n))         
          (lambda() (stream-thunk ns fs (+ n 1)))))])        
    (lambda() (stream-thunk xs ys 0))))

;;Pro 9
(define (vector-assoc v vec)         
  (letrec        
      ([loop (lambda(n)        
          (if(= n (vector-length vec)) #f        
             (let ([cur (vector-ref vec n)])        
               (cond        
                 [( not( pair? cur))        
                  (begin (print "pair") (loop (+ n 1)))]
                 [(equal? (car cur) v)  cur]
                 [#t (loop (+ n 1))]))))])        
      (loop 0)))

;;Pro 10

(define (cached-assoc xs n)
  (define cache (make-vector n #f))
  (define index 0)
  (define (fetch-cache k i)
    (if (or (negative? i) (< i (- index n))) #f
        (let ((cur (vector-ref cache (modulo i n))))
          (if (equal? (car cur) k) cur
              (fetch-cache k (sub1 i))))))
  (define (update-cache val)
    (vector-set! cache (modulo index n) val)
    (set! index (add1 index))
    val)
  (lambda (k)
    (cond ((fetch-cache k (sub1 index)))
          ((assoc k xs) => update-cache)
          (else #f))))

;;Pro 11
(define-syntax while-less
  (syntax-rules (do) 
  [(while-less2 e1 do e2) 
   (letrec ([loop (lambda () 
                    (let ([val2 e2])
                    (if (<= e1 val2) #t 
                        (loop) )))]) 
     (loop))]))
