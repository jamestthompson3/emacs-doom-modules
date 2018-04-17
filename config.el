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
;; ------------- Code Intel / Language Server Protocol ------------
(require 'lsp-mode)
(lsp-define-stdio-client
 lsp-javascript-typescript "javascript"
 (lsp-make-traverser #'(lambda (dir)
						 (directory-files
						  dir
						  nil
						  "package.json")))
   '("/usr/local/bin/javascript-typescript-langserver"))
;; -------------- Company Stuff ----------------
(require 'company-lsp)
(after! company
(push 'company-lsp company-backends)
  )
;; (def-package! company-box
;;   :hook (company-mode . company-box-mode))
(setq company-box-icons-unknown
      '((1 . fa_text_height) ;; Text
        (2 . (fa_tags :face font-lock-function-name-face)) ;; Method
        (3 . (fa_tag :face font-lock-function-name-face)) ;; Function
        (4 . (fa_tag :face font-lock-function-name-face)) ;; Constructor
        (5 . (fa_cog :foreground "#FF9800")) ;; Field
        (6 . (fa_cog :foreground "#FF9800")) ;; Variable
        (7 . (fa_cube :foreground "#7C4DFF")) ;; Class
        (8 . (fa_cube :foreground "#7C4DFF")) ;; Interface
        (9 . (fa_cube :foreground "#7C4DFF")) ;; Module
        (10 . (fa_cog :foreground "#FF9800")) ;; Property
        (11 . md_settings_system_daydream) ;; Unit
        (12 . (fa_cog :foreground "#FF9800")) ;; Value
        (13 . (md_storage :face font-lock-type-face)) ;; Enum
        (14 . (md_closed_caption :foreground "#009688")) ;; Keyword
        (15 . md_closed_caption) ;; Snippet
        (16 . (md_color_lens :face font-lock-doc-face)) ;; Color
        (17 . fa_file_text_o) ;; File
        (18 . md_refresh) ;; Reference
        (19 . fa_folder_open) ;; Folder
        (20 . (md_closed_caption :foreground "#009688")) ;; EnumMember
        (21 . (fa_square :face font-lock-constant-face)) ;; Constant
        (22 . (fa_cube :face font-lock-type-face)) ;; Struct
        (23 . fa_calendar) ;; Event
        (24 . fa_square_o) ;; Operator
        (25 . fa_arrows)) ;; TypeParameter
      )
;; ------------- Wakatime Mode -----------------
;; (require 'wakatime-mode)
;; (custom-set-variables '(wakatime-api-key (getenv "WAKATIME")))
;; windows check
;; (setq wakatime-cli-path (eshell-command-result "which wakatime"))
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
;; Make Spaceline look nice
(require 'challenger-deep-theme)
(load-theme 'challenger-deep t)

;; ------------- Random Modes ------------------
(add-hook! 'before-save-hook 'delete-trailing-whitespace)

;;; .emacs ends here
