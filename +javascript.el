;; --------- Set namespace ----------
(require 'prettier-js)
(require 'flow-minor-mode)
;; -------------- End Flycheck ----------------
 (setq js2-strict-missing-semi-warning nil)
 (setq js2-missing-semi-one-line-override nil)

(setq prettier-js-args '(
  "--trailing-comma" "none"
  "--parser" "flow"
  "--semi" "false"
  "single-quote" "true"
  ))
(add-hook! (rjsx-mode js2-mode)
     #'(prettier-js-mode flow-minor-enable-automatically))
