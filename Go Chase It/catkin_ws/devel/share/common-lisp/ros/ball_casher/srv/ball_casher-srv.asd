
(cl:in-package :asdf)

(defsystem "ball_casher-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DriveToTarget" :depends-on ("_package_DriveToTarget"))
    (:file "_package_DriveToTarget" :depends-on ("_package"))
  ))