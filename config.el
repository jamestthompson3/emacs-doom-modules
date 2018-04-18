;;; privateu/tt/config.el -*- lexical-binding: t; -*-
(load! +bindings)
;; ------------- Code Intel / Language Server Protocol ------------
;; work to configure lsp with company-tide
;; (load! +lsp)
;; --------------------- JavaScript ----------------------------
(load! +javascript)
;; -------- Org Sync -------------------
;; (mapc 'load
;;       '("org-sync-bb" "org-sync-github" "org-sync-redmine"))

(setq projectile-globally-ignored-directories '("node_modules" ".happypack" "flow-typed"))
(setq grep-find-ignored-directories '("node_modules" ".happypack"))
;; set indentation
(setq-default tab-width 2
              tab-width 2
              c-basic-offset 2
              coffee-tab-width 2
              javascript-2-level 2
              js-2-level 2
              js2-basic-offset 2
              web-mode-markup-2-offset 2
              web-mode-css-2-offset 2
              web-mode-code-2-offset 2
              css-2-offset 2
              rust-indent-offset 2)

;; ------- Delete selected text -----------------
(delete-selection-mode 1)

(require 'dumb-jump)
(setq dumb-jump-prefer-searcher 'ag)
(require 'manage-minor-mode)


;; -------------- Company Stuff ----------------
(after! company
  (setq company-idle-delay 0.2
        company-echo-delay 0.0
        company-minimum-prefix-length 2
        company-tooltip-flip-when-above t
        company-dabbrev-downcase nil))

;; (def-package! company-box
;;   :when EMACS26+
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   (setq company-frontends nil
;;         company-box-icons-elisp
;;         (list (concat (all-the-icons-material "functions") " ")
;;               (concat (all-the-icons-material "check_circle") " ")
;;               (concat (all-the-icons-material "stars") " ")
;;               (concat (all-the-icons-material "format_paint") " "))
;;         company-box-icons-unknown (concat (all-the-icons-material "find_in_page") " ")
;;         company-box-backends-colors nil
;;         company-box-icons-yasnippet (concat (all-the-icons-material "short_text") " ")))

(setq doom-theme 'doom-vibrant)
;; ------------- Wakatime Mode -----------------
;; (require 'wakatime-mode)
;; (custom-set-variables '(wakatime-api-key (getenv "WAKATIME")))
;; windows check
;; (setq wakatime-cli-path (shell-command-to-string "which wakatime"))
;; (setq wakatime-cli-path "/opt/conda/bin/wakatime")
   ;; (setq wakatime-cli-path "/usr/local/bin/wakatime")
;; (global-wakatime-mode)

;; --------- End Wakatime Mode ---------------------


;; --------- Auto refresh buffers ----------------
(global-auto-revert-mode t)
;; ---------- Silver Searcher ------------------
(require 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-window t)


;;  --------------- End JS MODE CONFIG --------------------

;--------------{Set Font}--------------;
(setq casey-font "PragmataPro")
;; Font cosmetic edits
(add-to-list 'default-frame-alist '(font . "PragmataPro"))
(set-face-attribute 'default t :font "PragmataPro")
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
;; Make Spaceline look nice
(require 'challenger-deep-theme)
(load-theme 'challenger-deep t)

;; ------------- Random Modes ------------------
(add-hook! 'before-save-hook 'delete-trailing-whitespace)

;;; .emacs ends here
