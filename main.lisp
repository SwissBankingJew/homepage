(defpackage :homepage
  (:use :cl
   :hunchentoot)
  (:export :start-server))

(in-package :homepage)

(defun start-server ()
  (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor
				    :port 4242
				    :address "127.0.0.1")))

;; (defparameter *server* (start-server))

(defconstant *navbar*
  (spinneret:with-html
    `(:nav :class "bg-gray-800 text-gray-100 p-4"
	   (:ul :class "flex space-x-6"
		(:li (:a :href "/" :class "hover:text-gray-300" "Home"))
		(:li (:a :href "/about" :class "hover:text-gray-300" "About"))
		(:li (:a :href "/projects" :class "hover:text-gray-300" "Projects"))
		(:li (:a :href "/contact" :class "hover:text-gray-300" "Contact"))
		))))

(defvar *terracotta* "#E2725B")

(defun button (text &optional on-click)
  (spinneret:with-html
    `(:button :class "bg-blue-500 hover:bg-deepRed text-cream px-4 py-2 rounded"
	      ,text)))


(defmacro with-page ((&key title) &body body)
  `(spinneret:with-html-string
     (:doctype)
     (:html
      (:head
       (:script :src "https://unpkg.com/htmx.org@2.0.3")
       (:script :src "https://cdn.tailwindcss.com")
       (:title ,title))
      (:body :class "container mx-auto px-4"
	     ,*nav-bar*
	     ,@body))))

(hunchentoot:define-easy-handler (say-yo :uri "/") ()
  (setf (hunchentoot:content-type*) "text/html")  
  (with-page (:title "Title")
    (:h1 :class "text-6xl" "Whale Cum to my page")))

(hunchentoot:define-easy-handler (about :uri "/about") ()
  (setf (hunchentoot:content-type*) "text/html")
  (with-page (:title "About")
    (:h1 :class "text-4xl" "WIP")))

(hunchentoot:define-easy-handler (projects :uri "/projects") ()
  (setf (hunchentoot:content-type*) "text/html")
  (with-page (:title "Projects")
    (:h1 :class "text-4xl" "WIP")))

(hunchentoot:define-easy-handler (contact :uri "/contact") ()
  (setf (hunchentoot:content-type*) "text/html")
  (with-page (:title "Contact")
    (:h1 :class "text-4xl" "WIP")))
