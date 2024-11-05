(defpackage :homepage
  (:use :cl
   :hunchentoot))

(in-package :homepage)

(defparameter *server* (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 4242)))


(defun nav-bar ()
  (spinneret:with-html
    `(:div :class "flex flex-row"
	   (:div :class "basis-1/4"
		 (:h5 "Home"))
	   (:div :class "basis-1/4"
		 (:h5 "Page"))
	   (:div :class "basis-1/4"
		 (:h5 "Stuff"))
	   (:div :class "basis-1/4"
		 (:h5 "Coding")))))

(defmacro with-page ((&key title) &body body)
  `(spinneret:with-html-string
     (:doctype)
     (:html
      (:head
       (:script :src "https://unpkg.com/htmx.org@2.0.3")
       (:script :src "https://cdn.tailwindcss.com"))      
      (:body
       ,(nav-bar)
       ,@body))))

(hunchentoot:define-easy-handler (say-yo :uri "/") ()
  (setf (hunchentoot:content-type*) "text/html")  
  (with-page (:title "Title") (:h1 "Hello")))

(hunchentoot:define-easy-handler (clicked :uri "/clicked") ()
  (setf (hunchentoot:content-type*) "text/html")
  (spinneret:with-html-string
    (:h1 "THE GREAT REPLACEMENT!")))
