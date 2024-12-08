#lang racket

; **Exercise 3.12:**  The following procedure for
; appending lists was introduced in 2.2.1.  It has been modified for use in Racket specifically
; for this exercise.

(define (append x y)
  (if (null? x)
      y
      (mcons (mcar x) (append (mcdr x) y))))


; `Append` forms a new list by successively `cons`ing the elements of
; `x` onto `y`.  The procedure `append!` is similar to
; `append`, but it is a mutator rather than a constructor.  It appends the
; lists by splicing them together, modifying the final pair of `x` so that
; its `cdr` is now `y`.  (It is an error to call `append!` with an
; empty `x`.)


(define (append! x y)
  (set-mcdr! (last-pair x) y)
    x)


; Here `last-pair` is a procedure that returns the last pair in its
; argument:


(define (last-pair x)
  (if (null? (mcdr x))
      x
      (last-pair (mcdr x))))


; Consider the interaction


(define x (mcons 'a (mcons 'b null)))
(define y (mcons 'c (mcons 'd null)))
(define z (append x y))

z ; Output: (mcons 'a (mcons 'b (mcons 'c (mcons 'd '()))))

(display "__________________________\n")
(mcdr x) ;⟨response⟩ = (mcons 'b '())
(display "__________________________\n")

(define w (append! x y))

w ;Output: (mcons 'a (mcons 'b (mcons 'c (mcons 'd '()))))

(display "__________________________\n")

(mcdr x) ; ⟨response⟩ = (mcons 'b (mcons 'c (mcons 'd '())))

; What are the missing `⟨response⟩`s?  Draw box-and-pointer diagrams to
; explain your answer.

;Hecho en OneNote