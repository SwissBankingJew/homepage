(asdf:defsystem :homepage
  :version "0.1.0"
  :description "My personal home page in cl"
  :author "SBJ"
  :license "You-have-ZERO-rights-to-this-code"
  :depends-on (:dexador
	       :yason
	       :alexandria
	       :clack
	       :spinneret
	       :hunchentoot)
  :components ((:file "main")))
