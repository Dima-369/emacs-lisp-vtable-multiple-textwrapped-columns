(defun dima-python-text-wrap (string column-length)
  "Return a string wrapped to COLUMN-LENGTH based on STRING.

The returned string is stripped of whitespace."
  (subp-with (subp-call "python3" (f-expand "~/wrap-text.py") string
                        (number-to-string column-length))
    (s-trim stdout)))

(defun dima-flip-list (list)
  "Flip columns and rows in LIST."
  (apply #'mapcar* #'list list))

(defun dima-vtable-columns (models)
  "Pass MODELS as a list of plists with keys: name, response"
  (nope
   (progn
     (switch-to-buffer (generate-new-buffer "yo"))
     ;; (org-mode)
     (let ((content (f-read "~/Developer/chatgpt-multi/sessions/2acd049ab8795dc7c66943e16adb4abc711a003f-Claude by Cookie.txt")))
       (dima-vtable-columns `(
                              (:name "a" :response ,content)
                              (:name "a" :response ,content)
                              (:name "a" :response ,content))))))

  ;; TODO return on text to open in new buffer?
  ;; TODO return code block to copy?
  ;; TODO bind g and r to jump between columns and return on codeblock?
  ;; TODO use `vtable-current-column' to find out which model we are currently on
  ;; TODO create multiple vtables
  (let ((columns-names (--map
                        (-let [(&plist :name) it]
                          name)
                        models))
        objects-lists)
    (--each models
      (-let [(&plist :response) it]
        (push (s-lines (dima-python-text-wrap response 90)) objects-lists)))
    (make-vtable
     :columns columns-names
     ;; TODO create columns as new objects here with big background color
     :objects (dima-flip-list objects-lists)))

  (setq-local header-line-format nil))
