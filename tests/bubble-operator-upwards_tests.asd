(asdf:defsystem #:bubble-operator-upwards_tests

  :author "Jean-Philippe Paradis <hexstream@gmail.com>"

  ;; See the UNLICENSE file for details.
  :license "Public Domain"

  :description "BUBBLE-OPERATOR-UPWARDS unit tests."

  :depends-on ("bubble-operator-upwards"
               "parachute")

  :serial cl:t
  :components ((:file "tests"))

  :perform (asdf:test-op (op c) (uiop:symbol-call '#:parachute '#:test '#:bubble-operator-upwards_tests)))
