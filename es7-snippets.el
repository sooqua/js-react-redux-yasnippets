;;; es7-snippets.el --- ES7 Yasnippets -*- lexical-binding: t; -*-
;; Copyright (C) 2017-2019 EQuimper
;; Copyright (C) 2019 sooqua

;; Author: EQuimper
;; Keywords: lisp
;; Version: 0.0.1
;; Url: https://github.com/sooqua/es7-snippets

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; ES7 Snippets

;;; Code:
(require 'yasnippet)

(setq es7-snippets-dir (file-name-directory (or load-file-name (buffer-file-name))))

;;;###autoload
(defun es7-snippets-initialize ()
  (let ((snippets-dir (expand-file-name "snippets" es7-snippets-dir)))
    (when (boundp 'yas-snippet-dirs)
      (add-to-list 'yas-snippet-dirs snippets-dir nil #'eq))
    (yas-load-directory snippets-dir)))

(setq es7-snippets-want-semicolon t)

;;;###autoload
(defun es7-snippets-semicolon ()
  "Return semicolon if es7-snippets-want-semicolon is t"
  (when (bound-and-true-p es7-snippets-want-semicolon)
    ";"))

;;;###autoload
(defun es7-snippets-toggle-semicolon ()
  "Toggle semicolon in js snippets"
  (interactive)
  (setq es7-snippets-toggle-semicolon
        (not (bound-and-true-p es7-snippets-want-semicolon))))

;;;###autoload
(defun es7-snippets-filename-base ()
  (interactive)
  (when (buffer-file-name)
    (capitalize (file-name-base (buffer-file-name)))))

;;;###autoload
(with-eval-after-load 'yasnippet
  (es7-snippets-initialize))

(provide 'es7-snippets)
;;; es7-snippets.el ends here
