(in-package #:bubble-operator-upwards)

(defun cartesian-product (&rest possibility-groups)
  (when (and possibility-groups (not (member nil possibility-groups)))
    (labels ((recurse (groups)
               (destructuring-bind (first-group . other-groups) groups
                 (if other-groups
                     (let ((constructed-groups (recurse other-groups)))
                       (mapcan (lambda (possibility)
                                 (mapcar (lambda (group)
                                           (cons possibility group))
                                         constructed-groups))
                               first-group))
                     (mapcar #'list first-group)))))
      (recurse possibility-groups))))

(defun bubble-operator-upwards (operator form
                                &key (result-kind :abridged)
                                (if-collapsed nil)
                                (collapsed-identity (ecase result-kind
                                                      ((:full :abridged)
                                                       (list operator))
                                                      (:branches nil))))
  (check-type if-collapsed (member nil :error))
  (labels ((recurse (form)
             (cond
               ((atom form)
                (list form))
               ((eq (first form) operator)
                (mapcan #'recurse (rest form)))
               (t
                (apply #'cartesian-product (mapcar #'recurse form))))))
    (let ((branches (recurse form)))
      (if branches
          (ecase result-kind
            (:full (cons operator branches))
            (:branches branches)
            (:abridged (if (rest branches)
                           (cons operator branches)
                           (first branches))))
          (if (eq if-collapsed :error)
              (error "Collapsed result and if-collapsed is :error:~%~S."
                     `(bubble-operator-upwards ,operator ,form))
              collapsed-identity)))))
