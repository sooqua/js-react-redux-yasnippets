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

(eval-and-compile
  (require 'yasnippet))

(defgroup js-react-redux-yasnippets nil
  "JavaScript,React,Redux yasnippets"
  :group 'yasnippet)

(defcustom js-react-redux-yasnippets-want-semicolon t
  "Whether snippets should insert semicolons as appropriate."
  :type 'boolean
  :group 'js-react-redux-yasnippets)

(defun js-react-redux-yasnippets-toggle-semicolon ()
  "Toggle semicolon in js snippets."
  (interactive)
  (setq js-react-redux-yasnippets-want-semicolon
        (not js-react-redux-yasnippets-want-semicolon)))

(defun js-react-redux-yasnippets-capitalize-first-char (&optional string)
  "Capitalize only the first character of the input STRING."
  (when (and string (> (length string) 0))
    (let ((first-char (substring string nil 1))
          (rest-str   (substring string 1)))
      (concat (capitalize first-char) rest-str))))

(defun js-react-redux-yasnippets-filename-base ()
  "Used in snippets. Return buffer base file name, should not throw errors."
  (when (buffer-file-name)
    (js-react-redux-yasnippets-capitalize-first-char (file-name-base (buffer-file-name)))))

(defun js-react-redux-yasnippets-semicolon ()
  "Used in snippets. Return semicolon if js-react-redux-yasnippets-want-semicolon is t."
  (when js-react-redux-yasnippets-want-semicolon
    ";"))

(defvar js-react-redux-yasnippets-dir
  (file-name-directory
   (file-truename
     (or
       (and load-file-name (concat (file-name-sans-extension load-file-name) ".el"))
       buffer-file-name))))

;;;###autoload
(defun js-react-redux-yasnippets-initialize ()
  "Initialize js-react-redux-yasnippets with yasnippet."
  (let ((snippets-dir (expand-file-name "snippets" js-react-redux-yasnippets-dir)))
    (add-to-list 'yas-snippet-dirs snippets-dir t #'string-equal)
    (yas-load-directory snippets-dir)))

;;;###autoload
(eval-after-load 'yasnippet
  '(js-react-redux-yasnippets-initialize))

(provide 'js-react-redux-yasnippets)
;;; js-react-redux-yasnippets.el ends here
