
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
	       ;; buffer position
               (side . bottom)
	       ;; buffer width
               (window-height . 0.5))))
        (call-interactively 'compile)))))

;; 按下 F5：未開啟時跳出指令，已開啟時一鍵關閉視窗
(global-set-key (kbd "<f5>") 'my/toggle-compile-right)

;; 按下 Shift+F5：快速重新編譯
(global-set-key (kbd "<S-f5>") 'recompile)



(load-theme 'gruber-darker t)
(set-face-attribute 'default nil
		    :family "JetBrains Mono"
		    :height 150)



(setq default-directory "C:/Users/User/.emacs.d/projects")
(advice-add 'find-file-read-args :before
            (lambda (&rest _)
              (setq default-directory "C:/Users/User/.emacs.d/projects")))


(defun my-image-logo-screen ()
  "建立一個包含高清圖片的啟動 Buffer，可手動微調大小與左右位置"
  (let ((buf (get-buffer-create "*Welcome*"))
        (img-path "C:/Users/User/.emacs.d/logo.png")
        ;; ---------------- 可自訂參數 ----------------
        (img-height 900)    ; 圖片高度（數字越大圖片越大，例如 500, 600, 800）
        (padding-left 16))  ; 離左邊的空格數（數字越大越往右推）
        ;; --------------------------------------------
    (with-current-buffer buf
      (read-only-mode -1)
      (erase-buffer)
      (setq-local display-line-numbers nil)
      
      ;; 垂直位置（上面的空行數，覺得太靠頂可以增加 \n）
      (insert "\n\n\n\n")
      
      (if (file-exists-p img-path)
          (let ((img (create-image img-path nil nil :max-height img-height)))
            ;; 插入指定數量的空格推位置
            (insert (make-string padding-left ?\s))
            (insert-image img)
            (insert "\n"))
        (insert "  [!] 找不到圖片檔，請檢查 img-path 路徑設定！\n"))
      
      (insert "\n\n")
      (read-only-mode 1))
    buf))
(setq initial-buffer-choice 'my-image-logo-screen)


;; Performance
(setq package-native-compile t)

;; Line Number
(global-display-line-numbers-mode 1)

;; 啟動時自動最大化視窗
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;;(Menu Bar)
(menu-bar-mode -1)

;; (Tool Bar)
(tool-bar-mode -1)

;; Scroll Bar
(scroll-bar-mode -1)

;;save command instruction
(savehist-mode 1)




;;--------------KEYBOARD SITTING---------------

;;Shift+左 第一次按跳到程式碼開頭，再按跳到絕對行首
(defun back-to-indentation-or-beginning-of-line ()
  "Move point to indentation, or to the beginning of line if already there."
  (interactive)
  (let ((p (point)))
    (back-to-indentation)
    (when (= p (point))
      (move-beginning-of-line 1))))

(global-set-key (kbd "S-<left>") 'back-to-indentation-or-beginning-of-line)
(global-set-key (kbd "S-<right>") 'move-end-of-line)
;; SHIFT + LEFT(該行最前面)

;; SHIFT + RIGHT(該行最後面)

(defun move-line-up ()
  "Move current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;; 綁定到 Shift + Up / Down
(global-set-key (kbd "S-<up>") 'move-line-up)
(global-set-key (kbd "S-<down>") 'move-line-down)


;; CUA Mode (Ctrl+C 複製、Ctrl + V 貼上、Ctrl+X 剪下、Ctrl+Z 復原)
(cua-mode 1)

;; Delete Line
(global-set-key (kbd "C-d") 'kill-whole-line)

;; Delete Word
(global-set-key (kbd "C-w") 'kill-word)

(global-set-key (kbd "C-<down>") 'scroll-up-line)

(global-set-key (kbd "C-<up>") 'scroll-down-line)



;; Execute Command Line
(global-set-key (kbd "S-;") 'execute-extended-command)

;; Save Buffer
(global-set-key (kbd "<f12>") 'save-buffer)

;; Find-file
(global-set-key (kbd "<f3>") 'find-file)

;; kill-current-buffer
(global-set-key (kbd "<f1>") 'kill-current-buffer)



;;-----------------------------------------------



