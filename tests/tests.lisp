(cl:defpackage #:bubble-operator-upwards_tests
  (:use #:cl #:parachute)
  (:import-from #:bubble-operator-upwards #:bubble-operator-upwards #:cartesian-product))

(cl:in-package #:bubble-operator-upwards_tests)

(define-test "featured-examples"
  (is equal '(and (plate ham beans) (plate eggs beans))
      (bubble-operator-upwards 'and '(plate (and ham eggs) beans)))
  (is equal '((section 1 - "a") (section 1 - "b")
              (section 2 - "a") (section 2 - "b")
              (section 3 - "a") (section 3 - "b"))
      (bubble-operator-upwards 'alt '(section (alt 1 2 3) - (alt "a" "b"))
                               :result-kind :branches))
  (is equal '(or
              (>> ul (:class "important"))
              (>> ul (:class "urgent"))
              (>> ul (id "first-priority"))
              (>> ol (:class "important"))
              (>> ol (:class "urgent"))
              (>> ol (id "first-priority")))
      (bubble-operator-upwards 'or '(>> (or ul ol)
                                     (or (:class (or "important" "urgent"))
                                      (id "first-priority")))))
  (is equal '((1 a) (1 b) (1 c)
              (2 a) (2 b) (2 c))
      (cartesian-product '(1 2) '(a b c))))
