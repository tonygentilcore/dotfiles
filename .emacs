;;; Dotfile -- Tony Gentilcore's emacs config

;;; Commentary:

;;; Code:

;; https://code.google.com/p/chromium/wiki/Emacs
(add-hook 'c-mode-common-hook (function (lambda () (local-set-key (kbd "TAB") 'clang-format-region))))

(setq dart-enable-analysis-server t)
(add-hook 'dart-mode-hook 'flycheck-mode)

(require 'ido)
(ido-mode t)
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
(setq ido-auto-merge-work-directories-length -1)

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; turn on font-lock mode
(global-font-lock-mode t)

;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

;; discard trailing whitespace on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; make startup cleaner
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(color-theme-selection "Black" nil (color-theme))
 '(column-number-mode t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(put 'set-goal-column 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(setq-default indent-tabs-mode nil)
(setq-default standard-indent 2)
(setq-default js-indent-level 2)

;; TG 1/30/15 - Set default window size.
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (>= (x-display-pixel-width) 1200)
            (add-to-list 'default-frame-alist (cons 'width 160))
            (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
         (cons 'height (/ (x-display-pixel-height)
                           (frame-char-height)))))))

(set-frame-size-according-to-resolution)

;; Not ready to learn how to use rebase mode yet.
(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
                              auto-mode-alist))

(provide '.emacs)
;;; .emacs ends here
