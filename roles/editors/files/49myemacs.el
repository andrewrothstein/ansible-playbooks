;;; terminal
(load-theme 'tango)

;;; shortcuts
(global-set-key "\M-g" 'goto-line)

;;; Also highlight parens
(setq show-paren-delay 0
       show-paren-style 'parenthesis)
(show-paren-mode 1)

(defun match-paren (arg)
    "Go to the matching parenthesis if on parenthesis otherwise insert %."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
          ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
          (t (self-insert-command (or arg 1)))))

(global-set-key "%" 'match-paren)

;;; dark colors bad for my eyes. tango is brighter
(load-theme 'tango)
