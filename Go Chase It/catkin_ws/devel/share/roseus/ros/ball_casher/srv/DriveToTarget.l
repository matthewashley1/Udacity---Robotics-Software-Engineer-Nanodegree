;; Auto-generated. Do not edit!


(when (boundp 'ball_casher::DriveToTarget)
  (if (not (find-package "BALL_CASHER"))
    (make-package "BALL_CASHER"))
  (shadow 'DriveToTarget (find-package "BALL_CASHER")))
(unless (find-package "BALL_CASHER::DRIVETOTARGET")
  (make-package "BALL_CASHER::DRIVETOTARGET"))
(unless (find-package "BALL_CASHER::DRIVETOTARGETREQUEST")
  (make-package "BALL_CASHER::DRIVETOTARGETREQUEST"))
(unless (find-package "BALL_CASHER::DRIVETOTARGETRESPONSE")
  (make-package "BALL_CASHER::DRIVETOTARGETRESPONSE"))

(in-package "ROS")





(defclass ball_casher::DriveToTargetRequest
  :super ros::object
  :slots (_linear_x _angular_z ))

(defmethod ball_casher::DriveToTargetRequest
  (:init
   (&key
    ((:linear_x __linear_x) 0.0)
    ((:angular_z __angular_z) 0.0)
    )
   (send-super :init)
   (setq _linear_x (float __linear_x))
   (setq _angular_z (float __angular_z))
   self)
  (:linear_x
   (&optional __linear_x)
   (if __linear_x (setq _linear_x __linear_x)) _linear_x)
  (:angular_z
   (&optional __angular_z)
   (if __angular_z (setq _angular_z __angular_z)) _angular_z)
  (:serialization-length
   ()
   (+
    ;; float64 _linear_x
    8
    ;; float64 _angular_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _linear_x
       (sys::poke _linear_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_z
       (sys::poke _angular_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _linear_x
     (setq _linear_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_z
     (setq _angular_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ball_casher::DriveToTargetResponse
  :super ros::object
  :slots (_msg_feedback ))

(defmethod ball_casher::DriveToTargetResponse
  (:init
   (&key
    ((:msg_feedback __msg_feedback) "")
    )
   (send-super :init)
   (setq _msg_feedback (string __msg_feedback))
   self)
  (:msg_feedback
   (&optional __msg_feedback)
   (if __msg_feedback (setq _msg_feedback __msg_feedback)) _msg_feedback)
  (:serialization-length
   ()
   (+
    ;; string _msg_feedback
    4 (length _msg_feedback)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msg_feedback
       (write-long (length _msg_feedback) s) (princ _msg_feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msg_feedback
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msg_feedback (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ball_casher::DriveToTarget
  :super ros::object
  :slots ())

(setf (get ball_casher::DriveToTarget :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_casher::DriveToTarget :datatype-) "ball_casher/DriveToTarget")
(setf (get ball_casher::DriveToTarget :request) ball_casher::DriveToTargetRequest)
(setf (get ball_casher::DriveToTarget :response) ball_casher::DriveToTargetResponse)

(defmethod ball_casher::DriveToTargetRequest
  (:response () (instance ball_casher::DriveToTargetResponse :init)))

(setf (get ball_casher::DriveToTargetRequest :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_casher::DriveToTargetRequest :datatype-) "ball_casher/DriveToTargetRequest")
(setf (get ball_casher::DriveToTargetRequest :definition-)
      "float64 linear_x
float64 angular_z
---
string msg_feedback

")

(setf (get ball_casher::DriveToTargetResponse :md5sum-) "c8652349d2a34a90a09475339e2a93d9")
(setf (get ball_casher::DriveToTargetResponse :datatype-) "ball_casher/DriveToTargetResponse")
(setf (get ball_casher::DriveToTargetResponse :definition-)
      "float64 linear_x
float64 angular_z
---
string msg_feedback

")



(provide :ball_casher/DriveToTarget "c8652349d2a34a90a09475339e2a93d9")


