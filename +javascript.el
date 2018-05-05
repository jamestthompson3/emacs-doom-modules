;; --------- Set namespace ----------
(require 'prettier-js)
(require 'flow-minor-mode)

(after! tide
  (setq tide-completion-detailed t
        tide-always-show-documentation t)
  )

(setq prettier-js-args '(
  "--trailing-comma" "none"
  "--parser" "flow"
  "--semi" "false"
  "single-quote" "true"
  ))
(add-hook! (rjsx-mode js2-mode)
     #'(prettier-js-mode flow-minor-enable-automatically))
