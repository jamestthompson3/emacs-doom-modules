;;; private/tt/+bindings.el -*- lexical-binding: t; -*-


(evil-define-key 'insert global-map (kbd "M-f") 'evil-normal-state)
(evil-define-key 'normal tide-mode-map "R" 'tide-references)
(evil-define-key 'normal tide-mode-map "Q" 'rjsx-rename-tag-at-point)
(eval-after-load "flow-minor-mode"
     '(define-key flow-minor-mode-map (kbd "C-S-f") 'flow-minor-status))
(map! (:leader
       :desc "Jump to definition" :n "g" #'dumb-jump-go))
(global-set-key (kbd "C-S-g") 'web-mode-element-wrap)
