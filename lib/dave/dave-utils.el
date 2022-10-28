(defun dd/profile-it (&optional f)
  (interactive (list (read-extended-command)))
  (message "Profiling %s" f)
  (profiler-start 'cpu)
  (funcall (intern f))
  (profiler-stop))

(provide 'dave-utils)
