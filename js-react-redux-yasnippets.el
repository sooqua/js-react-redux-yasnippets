;;; js-react-redux-yasnippets.el --- JavaScript,React,Redux yasnippets -*- lexical-binding: t; -*-
;; Copyright (C) 2015-2018 xabikos
;; Copyright (C) 2017-2019 EQuimper
;; Copyright (C) 2019 sooqua

;; Author: sooqua
;; Keywords: convenience,snippets
;; Version: 0.0.2
;; Url: https://github.com/sooqua/js-react-redux-yasnippets
;; Package-Requires: ((emacs "24.3") (yasnippet "0.8.0"))

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
;; JavaScript,React,Redux yasnippets

;;; Code:
(require 'yasnippet)

(defvar js-react-redux-yasnippets-dir (file-name-directory (or load-file-name (buffer-file-name))))

;;;###autoload
(defun js-react-redux-yasnippets-initialize ()
  "Initialize js-react-redux-yasnippets with yasnippet."
  (let ((snippets-dir (expand-file-name "snippets" js-react-redux-yasnippets-dir)))
    (when (boundp 'yas-snippet-dirs)
      (add-to-list 'yas-snippet-dirs snippets-dir nil #'eq))
    (yas-load-directory snippets-dir)))

(defvar js-react-redux-yasnippets-want-semicolon t)

;;;###autoload
(defun js-react-redux-yasnippets-semicolon ()
  "Return semicolon if js-react-redux-yasnippets-want-semicolon is t."
  (when (bound-and-true-p js-react-redux-yasnippets-want-semicolon)
    ";"))

;;;###autoload
(defun js-react-redux-yasnippets-toggle-semicolon ()
  "Toggle semicolon in js snippets."
  (interactive)
  (setq js-react-redux-yasnippets-want-semicolon
        (not (bound-and-true-p js-react-redux-yasnippets-want-semicolon))))

;;;###autoload
(defun js-react-redux-yasnippets-filename-base ()
  "Return buffer base file name, should not throw errors."
  (interactive)
  (when (buffer-file-name)
    (capitalize (file-name-base (buffer-file-name)))))

;;;###autoload
(eval-after-load 'yasnippet
  '(js-react-redux-yasnippets-initialize))

(provide 'js-react-redux-yasnippets)
;;; js-react-redux-yasnippets.el ends here
