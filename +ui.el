;;; +ui.el --- my UI -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq ns-use-proxy-icon nil)

(setq doom-font (font-spec :family "Pragmata Pro" :size 14))
(setq doom-variable-pitch-font (font-spec :family "Pragmata Pro"))
(setq doom-unicode-font (font-spec :family "Pragmata Pro"))
(setq doom-big-font (font-spec :family "Pragmata Pro" :size 22))

(setq doom-theme 'doom-opera)

(unless (display-graphic-p)
  (setq doom-theme nil))

(add-variable-watcher
 'posframe--frame
 (lambda (_sym frame op _where)
   (when (and (eq op 'set) frame)
     (with-selected-frame frame
       (setq-local whitespace-style nil)))))

(def-package! resize-window
  :commands  (resize-window))

(global-prettify-symbols-mode +1)

;; ; --------- ModeLine ------------------;
(def-package! spaceline
  :config (setq spaceline-org-clock-p nil
                spaceline-evil-p t)
)
(def-package! spaceline-all-the-icons
  :after spaceline
  :config (spaceline-all-the-icons-theme)
           (setq spaceline-all-the-icons-icon-set-modified 'circle
                 spaceline-all-the-icons-icon-set-flycheck-slim 'outline
                 spaceline-all-the-icons-separator-type 'none)
)

(provide '+ui)

;;; +ui.el ends here
