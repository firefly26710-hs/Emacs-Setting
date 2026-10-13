(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(setq package-check-signature nil)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


(use-package rust-mode
  :ensure t)


(require 'compile)
(require 'ansi-color)
(setq compilation-scroll-output t)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'term-exec-hook (lambda () (compilation-shell-minor-mode 1)))
(add-hook 'rust-mode-hook
          (lambda ()
            (setq-local compile-command "cargo run --color=always")))


(defun my/toggle-compile-right ()
  (interactive)
  (let* ((buf (get-buffer "*compilation*"))
         (win (and buf (get-buffer-window buf))))
    (if win
        (delete-window win)
      (let ((display-buffer-overriding-action
             '((display-buffer-in-side-window)
               (side . bottom)
               (window-height . 0.5))))
        (call-interactively 'compile)))))

(global-set-key (kbd "<f5>") 'my/toggle-compile-right)
(global-set-key (kbd "<S-f5>") 'recompile)



(load-theme 'gruber-darker t)
(set-face-attribute 'default nil
		    :family "JetBrains Mono"
		    :height 200)



(setq default-directory "~/.emacs.d/projects")
(advice-add 'find-file-read-args :before
            (lambda (&rest _)
              (setq default-directory "~/.emacs.d/projects")))


(defun my-image-logo-screen ()
  (let ((buf (get-buffer-create "*Welcome*"))
        (img-path "~/.emacs.d/logo.png")
        (img-height 1000)    
        (padding-left 12)) 
    (with-current-buffer buf
      (read-only-mode -1)
      (erase-buffer)
      (setq-local display-line-numbers nil)
      
      (insert "\n\n\n")
      
      (if (file-exists-p img-path)
          (let ((img (create-image img-path nil nil :max-height img-height)))
            (insert (make-string padding-left ?\s))
            (insert-image img)
            (insert "\n\n"))
        (insert "  [!] 找不到圖片檔，請檢查 img-path 路徑設定！\n"))
      
      (insert "\n\n\n")
      (read-only-mode 1))
    buf))
(setq initial-buffer-choice 'my-image-logo-screen)


(setq package-native-compile t)

(global-display-line-numbers-mode 1)

(add-to-list 'default-frame-alist '(fullscreen . maximized))


(setq warning-minimum-level :error)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(savehist-mode 1)

(electric-pair-mode 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)





;;--------------KEYBOARD SITTING---------------

(defun back-to-indentation-or-beginning-of-line ()
  "Move point to indentation, or to the beginning of line if already there."
  (interactive)
  (let ((p (point)))
    (back-to-indentation)
    (when (= p (point))
      (move-beginning-of-line 1))))

(global-set-key (kbd "S-<left>") 'back-to-indentation-or-beginning-of-line)
(global-set-key (kbd "S-<right>") 'move-end-of-line)


(defun move-line-up ()
  "Move current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(global-set-key (kbd "S-<up>") 'move-line-up)

(defun move-line-down ()
  "Move current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "S-<down>") 'move-line-down)

(cua-mode 1)


(defun select-current-line ()
  (interactive)
  (beginning-of-line)
  (set-mark (point))
  (forward-line 1))

(global-set-key (kbd "<C-S-tab>") 'forward-word-and-mark)

(defun delete-whole-line-no-kill ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (let ((inhibit-read-only t))
      (delete-region (point) (progn (forward-line 1) (point))))))

(global-set-key (kbd "C-d") 'delete-whole-line-no-kill)

(defun delete-word-no-kill ()
  (interactive)
  (delete-region (point) (progn (forward-word) (point))))

(global-set-key (kbd "C-w") 'delete-word-no-kill)

(global-set-key (kbd "C-w") 'delete-char)

;; 防止 C 模式與 Java 模式等的 Major Mode 覆蓋這個快捷鍵
(with-eval-after-load 'cc-mode
  (define-key c-mode-map (kbd "C-w") 'delete-char)
  (define-key java-mode-map (kbd "C-w") 'delete-char))


(defun goto-relative-line (arg)
  "Move point ARG lines forward (or backward if negative)."
  (interactive "nGoto relative line (+/-): ")
  (forward-line arg))

(global-set-key (kbd "M-s") 'goto-relative-line)


(global-set-key (kbd "C-<down>") 'scroll-up-line)

(global-set-key (kbd "C-<up>") 'scroll-down-line)


(global-set-key (kbd "S-;") 'execute-extended-command)

(global-set-key (kbd "<f12>") 'save-buffer)

(global-set-key (kbd "<f3>") 'find-file)

(global-set-key (kbd "<f1>") 'kill-current-buffer)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(gruber-darker-theme pack rust-mode zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
