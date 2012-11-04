(asdf:defsystem #:bubble-operator-upwards

  :author "Jean-Philippe Paradis <hexstream@gmail.com>"

  ;; See the UNLICENSE file for details.
  :license "Public Domain"

  :description "bubble-operator-upwards is a function that \"bubbles an operator upwards\" in a form, demultiplexing all alternative branches by way of cartesian product. This operation is notably useful for easy implementation of certain kinds of shorthand notations in macros. A cartesian-product function is also exported, as it's needed to implement the main function."

  :depends-on ()

  :version "1.0"
  :serial cl:t
  :components ((:file "package")
	       (:file "main")))
