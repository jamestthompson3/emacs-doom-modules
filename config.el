;;; privateu/tt/config.el -*- lexical-binding: t; -*-
(load! +bindings)

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
;; ------------- Wakatime Mode -----------------
(require 'wakatime-mode)
(setq wakatime-api-key (getenv "WAKATIME"))
;; windows check
;; (setq wakatime-cli-path (eshell-command-result "which wakatime"))
;; (setq wakatime-cli-path "/opt/conda/bin/wakatime")
   (setq wakatime-cli-path "/usr/local/bin/wakatime")
(global-wakatime-mode)

;; --------- End Wakatime Mode ---------------------


;;; -------------- JS MODE CONFIG --------------
;; ----------- RJSX Mode ----------------
;; --------- Auto refresh buffers ----------------
(require 'ag)
(global-auto-revert-mode t)
(setq ag-highlight-search t)
(setq ag-reuse-window t)

(defun add-node-modules-path ()
  "Search the current buffer's parent directories for `node_modules/.bin`.
If it's found, then add it to the `exec-path'."
  (interactive)
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (path (and root
                    (expand-file-name "node_modules/.bin/" root))))
    (if root
        (progn
          (make-local-variable 'exec-path)
          (add-to-list 'exec-path path)
          (when add-node-modules-path-debug
            (message (concat "added " path  " to exec-path"))))
      (when add-node-modules-path-debug
        (message (concat "node_modules not found in " root))))))
;; (#'add-node-modules-path)
;; -------------- End Flycheck ----------------
 (setq js2-strict-missing-semi-warning nil)
 (setq js2-missing-semi-one-line-override nil)

;; (add-hook! 'rjsx-mode-hook #'( web-mode flow-minor-enable-automatically ))
(setq prettier-js-args '(
  "--trailing-comma" "none"
  "--parser" "flow"
  "--semi" "false"
  "single-quote" "true"
  ))
(package! tern :disable)

;;  --------------- End JS MODE CONFIG --------------------

;--------------{Set Font}--------------;
(setq casey-font "PragmataPro")
;; Font cosmetic edits
(add-to-list 'default-frame-alist '(font . "PragmataPro"))
(set-face-attribute 'default t :font "PragmataPro")
(global-prettify-symbols-mode +1)
;; (require 'challenger-deep-theme)
;; (load-theme 'challenger-deep t)
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
(require 'challenger-deep-theme)
(load-theme 'challenger-deep t)
;; ;------------{NO Scrollbar}------------;

;;------------- Line Numbers ----------------


;; Show all line numbering by default (you can turn this off if you would like)
;;(global-line-number-mode 1)
;; (global-linum-mode 1)

;; Adjust Spacing
;; (setq linum-format "%d  ")

;; -------- End Line Numbers ------------

;; ------------- Random Modes ------------------
(add-hook! 'before-save-hook 'delete-trailing-whitespace)

;;; .emacs ends here
