(require 'prettier-js)
(require 'flow-minor-mode)
(require 'tide)
(require 'company)
(defun set-up-tide-mode ()
  (interactive)
  (tide-setup)
  ;; (setq flycheck-check-syntax-automatically '(save mode-enbled))
  (push 'company-tide company-backends)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  )

(defvar add-node-modules-path-debug nil)
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
(add-hook! (rjsx-mode js2-mode)
     #'(prettier-js-mode set-up-tide-mode flow-minor-enable-automatically add-node-modules-path))
;; (add-hook! js2-mode
;;      #'(prettier-js-mode set-up-tide flow-minor-enable-automatically add-node-modules-path))
