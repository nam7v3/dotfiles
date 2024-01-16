;;;###autoload
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

;;;###autoload
(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun current-line-empty-p ()
  (string-match-p "\\`\\s-*$" (thing-at-point 'line)))

;;;###autoload
(defun fixup-whitespace-or-delete-blank-lines()
  (interactive)
  (if (current-line-empty-p)
      (delete-blank-lines)
    (fixup-whitespace)))
(provide 'function)
