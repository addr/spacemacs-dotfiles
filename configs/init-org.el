;; (when (< emacs-major-version 24)
;;   (require-package 'org))
;; (require-package 'org-fstree)
(require 'org-habit)
;; (when *is-a-mac*
;;   (require-package 'org-mac-link)
;;   (autoload 'org-mac-grab-link "org-mac-link" nil t)
;;   (require-package 'org-mac-iCal))

;; (define-key global-map (kbd "C-c l") 'org-store-link)
;; (define-key global-map (kbd "C-c a") 'org-agenda)

;; Enable mode line display of org clock for spacemacs
(setq spaceline-org-clock-p t)

;; Org mode key bindings from doc.norang.ca/org-mode.html
(global-set-key (kbd "<f12>") 'org-agenda)
;; (global-set-key (kbd "<f5>") 'bh/org-todo)
;; (global-set-key (kbd "<S-f5>") 'bh/widen)
;; (global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
;; (global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
;; (global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
;; (global-set-key (kbd "<f9> b") 'bbdb)
;; (global-set-key (kbd "<f9> c") 'calendar)
;; (global-set-key (kbd "<f9> f") 'boxquote-insert-file)
;; (global-set-key (kbd "<f9> g") 'gnus)
;; (global-set-key (kbd "<f9> h") 'bh/hide-other)
;; (global-set-key (kbd "<f9> n") 'bh/toggle-next-task-display)

;; (global-set-key (kbd "<f9> I") 'bh/punch-in)
;; (global-set-key (kbd "<f9> O") 'bh/punch-out)

;; (global-set-key (kbd "<f9> o") 'bh/make-org-scratch)

;; (global-set-key (kbd "<f9> r") 'boxquote-region)
;; (global-set-key (kbd "<f9> s") 'bh/switch-to-scratch)

;; (global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
;; (global-set-key (kbd "<f9> T") 'bh/toggle-insert-inactive-timestamp)

;; (global-set-key (kbd "<f9> v") 'visible-mode)
;; (global-set-key (kbd "<f9> l") 'org-toggle-link-display)
;; (global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
;; (global-set-key (kbd "C-<f9>") 'previous-buffer)
;; (global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
;; (global-set-key (kbd "C-x n r") 'narrow-to-region)
;; (global-set-key (kbd "C-<f10>") 'next-buffer)
;; (global-set-key (kbd "<f11>") 'org-clock-goto)
;; (global-set-key (kbd "C-<f11>") 'org-clock-in)
;; (global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
;; (global-set-key (kbd "C-c c") 'org-capture)

;; (defun bh/hide-other ()
;;   (interactive)
;;   (save-excursion
;;     (org-back-to-heading 'invisible-ok)
;;     (hide-other)
;;     (org-cycle)
;;     (org-cycle)
;;     (org-cycle)))

;; (defun bh/set-truncate-lines ()
;;   "Toggle value of truncate-lines and refresh window display."
;;   (interactive)
;;   (setq truncate-lines (not truncate-lines))
;;   ;; now refresh window display (an idiom from simple.el):
;;   (save-excursion
;;     (set-window-start (selected-window)
;;                       (window-start (selected-window)))))

;; (defun bh/make-org-scratch ()
;;   (interactive)
;;   (find-file "/tmp/publish/scratch.org")
;;   (gnus-make-directory "/tmp/publish"))

;; (defun bh/switch-to-scratch ()
;;   (interactive)
;;   (switch-to-buffer "*scratch*"))

;; Various preferences
;; (setq org-log-done t
;;       org-completion-use-ido t
;;       org-edit-timestamp-down-means-later t
;;       org-archive-mark-done nil
;;       org-catch-invisible-edits 'show
;;       org-export-coding-system 'utf-8
;;       org-fast-tag-selection-single-key 'expert
;;       org-html-validation-link nil
;;       org-export-kill-product-buffer-when-displayed t
;;       org-tags-column 80)


;; ;; Lots of stuff from http://doc.norang.ca/org-mode.html

;; (defun sanityinc/grab-ditaa (url jar-name)
;;   "Download URL and extract JAR-NAME as `org-ditaa-jar-path'."
;;   ;; TODO: handle errors
;;   (message "Grabbing " jar-name " for org.")
;;   (let ((zip-temp (make-temp-name "emacs-ditaa")))
;;     (unwind-protect
;;         (progn
;;           (when (executable-find "unzip")
;;             (url-copy-file url zip-temp)
;;             (shell-command (concat "unzip -p " (shell-quote-argument zip-temp)
;;                                    " " (shell-quote-argument jar-name) " > "
;;                                    (shell-quote-argument org-ditaa-jar-path)))))
;;       (when (file-exists-p zip-temp)
;;         (delete-file zip-temp)))))

;; (after-load 'ob-ditaa
;;   (unless (file-exists-p org-ditaa-jar-path)
;;     (let ((jar-name "ditaa0_9.jar")
;;           (url "http://softlayer-ams.dl.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip"))
;;       (setq org-ditaa-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
;;       (unless (file-exists-p org-ditaa-jar-path)
;;         (sanityinc/grab-ditaa url jar-name)))))


;; (define-minor-mode prose-mode
;;   "Set up a buffer for prose editing.
;; This enables or modifies a number of settings so that the
;; experience of editing prose is a little more like that of a
;; typical word processor."
;;   nil " Prose" nil
;;   (if prose-mode
;;       (progn
;;         (setq truncate-lines nil)
;;         (setq word-wrap t)
;;         (setq cursor-type 'bar)
;;         (when (eq major-mode 'org)
;;           (kill-local-variable 'buffer-face-mode-face))
;;         (buffer-face-mode 1)
;;         ;;(delete-selection-mode 1)
;;         (set (make-local-variable 'blink-cursor-interval) 0.6)
;;         (set (make-local-variable 'show-trailing-whitespace) nil)
;;         (flyspell-mode 1)
;;         (when (fboundp 'visual-line-mode)
;;           (visual-line-mode 1)))
;;     (kill-local-variable 'truncate-lines)
;;     (kill-local-variable 'word-wrap)
;;     (kill-local-variable 'cursor-type)
;;     (kill-local-variable 'show-trailing-whitespace)
;;     (buffer-face-mode -1)
;;     ;; (delete-selection-mode -1)
;;     (flyspell-mode -1)
;;     (when (fboundp 'visual-line-mode)
;;       (visual-line-mode -1))))

;; ;;(add-hook 'org-mode-hook 'buffer-face-mode)


;; (setq org-support-shift-select t)

;; ;;; Capturing
(setq org-directory "~/Documents")
(setq org-default-notes-file "~/Documents/Meta Work/journal.org")

;; ;; (global-set-key (kbd "C-c c") 'org-capture)

;; ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Documents/Meta Work/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/Documents/Meta Work/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/Documents/Meta Work/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/Documents/Meta Work/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/Documents/Meta Work/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/Documents/Meta Work/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/Documents/Meta Work/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/Documents/Meta Work/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;; ;;; Refiling

;; (setq org-refile-use-cache nil)

;;                                         ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
;; (setq org-refile-targets '((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9)))

;; (after-load 'org-agenda
;;   (add-to-list 'org-agenda-after-show-hook 'org-show-entry))

;; ;; Exclude DONE state tasks from refile targets
;; (defun sanityinc/verify-refile-target ()
;;   "Exclude todo keywords with a done state from refile targets."
;;   (not (member (nth 2 (org-heading-components)) org-done-keywords)))
;; (setq org-refile-target-verify-function 'sanityinc/verify-refile-target)

;; Targets start with the file name - allows creating level 1 tasks
;;(setq org-refile-use-outline-path (quote file))
;; (setq org-refile-use-outline-path t)
;; (setq org-outline-path-complete-in-steps nil)

;; ;; Allow refile to create parent tasks with confirmation
;; (setq org-refile-allow-creating-parent-nodes 'confirm)

;; ;; Use full outline paths for refile targets - we file directly with IDO
;; (setq org-refile-use-outline-path t)

;; ;; ;; Targets complete directly with IDO
;; ;; (setq org-outline-path-complete-in-steps nil)

;; ;;                                         ; Use IDO for both buffer and file completion and ido-everywhere to t
;; ;; (setq org-completion-use-ido t)
;; ;; (setq ido-everywhere t)
;; ;; (setq ido-max-directory-size 100000)
;; ;; (ido-mode (quote both))
;; ;;                                         ; Use the current window when visiting files and buffers with ido
;; ;; (setq ido-default-file-method 'selected-window)
;; ;; (setq ido-default-buffer-method 'selected-window)
;; ;;                                         ; Use the current window for indirect buffer display
;; ;; (setq org-indirect-buffer-display 'current-window)

;; 
;; ;;; To-do settings

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "OUTCOME(o)" "|" "DONE(d!/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "HOLD(h)" "SOMEDAY(s)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "green" :weight bold)
              ("DONE" :foreground "blue" :weight bold)
              ("OUTCOME" :foreground "cyan" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "purple" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("SOMEDAY" :foreground "pink" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("OUTCOME" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))


;;; Load agenda files - see http://osdir.com/ml/emacs-orgmode-gnu/2014-04/msg00470.html
(load-library "find-lisp")

;;; Search for all files recursively in my documents folder
(add-hook 'org-agenda-mode-hook (lambda ()
                                  (setq org-agenda-files (find-lisp-find-files "~/Documents" "\.org$"))
                                  ))
;; Agenda views

;; ;; Include diary in agenda
(setq org-agenda-include-diary t)

;; ;; Agenda view for week or day
(setq org-agenda-span 'day)
;; ;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; ;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header (concat "Project Next Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Standalone Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|SOMEDAY|HOLD/!"
                           ((org-agenda-overriding-header (concat "Waiting, Someday, and Postponed Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil))))


;; ;; define "R" as the prefix key for reviewing what happened in various
;; ;; time periods
;; (add-to-list 'org-agenda-custom-commands
;;              '("R" . "Review" )
;;              )

;; ;; Common settings for all reviews
;; (setq efs/org-agenda-review-settings
;;       '((org-agenda-files '("~/org/notes.org"
;;                             "~/org/projects.org"
;;                             ))
;;         (org-agenda-show-all-dates t)
;;         (org-agenda-start-with-log-mode t)
;;         (org-agenda-start-with-clockreport-mode t)
;;         (org-agenda-archives-mode t)
;;         ;; I don't care if an entry was archived
;;         (org-agenda-hide-tags-regexp
;;          (concat org-agenda-hide-tags-regexp
;;                  "\\|ARCHIVE"))
;;         ))
;; ;; Show the agenda with the log turn on, the clock table show and
;; ;; archived entries shown.  These commands are all the same exept for
;; ;; the time period.
;; (add-to-list 'org-agenda-custom-commands
;;              `("Rw" "Week in review"
;;                agenda ""
;;                ;; agenda settings
;;                ,(append
;;                  efs/org-agenda-review-settings
;;                  '((org-agenda-span 'week)
;;                    (org-agenda-start-on-weekday 0)
;;                    (org-agenda-overriding-header "Week in Review"))
;;                  )
;;                ("~/org/review/week.html")
;;                ))


;; (add-to-list 'org-agenda-custom-commands
;;              `("Rd" "Day in review"
;;                agenda ""
;;                ;; agenda settings
;;                ,(append
;;                  efs/org-agenda-review-settings
;;                  '((org-agenda-span 'day)
;;                    (org-agenda-overriding-header "Week in Review"))
;;                  )
;;                ("~/org/review/day.html")
;;                ))

;; (add-to-list 'org-agenda-custom-commands
;;              `("Rm" "Month in review"
;;                agenda ""
;;                ;; agenda settings
;;                ,(append
;;                  efs/org-agenda-review-settings
;;                  '((org-agenda-span 'month)
;;                    (org-agenda-start-day "01")
;;                    (org-read-date-prefer-future nil)
;;                    (org-agenda-overriding-header "Month in Review"))
;;                  )
;;                ("~/org/review/month.html")
;;                ))

;; ;; Helper functions defined for projects which are used by agenda views (again from doc.norang.ca/org-mode.html)
(defun bh/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun bh/is-project-subtree-p ()
  "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
  (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                              (point))))
    (save-excursion
      (bh/find-project-task)
      (if (equal (point) task)
          nil
        t))))

(defun bh/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun bh/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))

(defun bh/list-sublevels-for-projects-indented ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels 'indented)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defun bh/list-sublevels-for-projects ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels t)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defvar bh/hide-scheduled-and-waiting-next-tasks t)

(defun bh/toggle-next-task-display ()
  (interactive)
  (setq bh/hide-scheduled-and-waiting-next-tasks (not bh/hide-scheduled-and-waiting-next-tasks))
  (when  (equal major-mode 'org-agenda-mode)
    (org-agenda-redo))
  (message "%s WAITING and SCHEDULED NEXT Tasks" (if bh/hide-scheduled-and-waiting-next-tasks "Hide" "Show")))

(defun bh/skip-stuck-projects ()
  "Skip trees that are not stuck projects"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (bh/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next ))
            (save-excursion
              (forward-line 1)
              (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                (unless (member "WAITING" (org-get-tags-at))
                  (setq has-next t))))
            (if has-next
                nil
              next-headline)) ; a stuck project, has subtasks but no next task
        nil))))

(defun bh/skip-non-stuck-projects ()
  "Skip trees that are not stuck projects"
  ;; (bh/list-sublevels-for-projects-indented)
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (bh/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next ))
            (save-excursion
              (forward-line 1)
              (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                (unless (member "WAITING" (org-get-tags-at))
                  (setq has-next t))))
            (if has-next
                next-headline
              nil)) ; a stuck project, has subtasks but no next task
        next-headline))))

(defun bh/skip-non-projects ()
  "Skip trees that are not projects"
  ;; (bh/list-sublevels-for-projects-indented)
  (if (save-excursion (bh/skip-non-stuck-projects))
      (save-restriction
        (widen)
        (let ((subtree-end (save-excursion (org-end-of-subtree t))))
          (cond
           ((bh/is-project-p)
            nil)
           ((and (bh/is-project-subtree-p) (not (bh/is-task-p)))
            nil)
           (t
            subtree-end))))
    (save-excursion (org-end-of-subtree t))))

(defun bh/skip-project-trees-and-habits ()
  "Skip trees that are projects"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun bh/skip-projects-and-habits-and-single-tasks ()
  "Skip trees that are projects, tasks that are habits, single non-project tasks"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((org-is-habit-p)
        next-headline)
       ((and bh/hide-scheduled-and-waiting-next-tasks
             (member "WAITING" (org-get-tags-at))
             )
        next-headline)
       ((member "HOLD" (org-get-tags-at))
        next-headline)
       ((member "SOMEDAY" (org-get-tags-at))
        next-headline)
       ((bh/is-project-p)
        next-headline)
       ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
        next-headline)
       (t
        nil)))))

(defun bh/skip-project-tasks-maybe ()
  "Show tasks related to the current restriction.
When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
When not restricted, skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
           (next-headline (save-excursion (or (outline-next-heading) (point-max))))
           (limit-to-project (marker-buffer org-agenda-restrict-begin)))
      (cond
       ((bh/is-project-p)
        next-headline)
       ((org-is-habit-p)
        subtree-end)
       ((and (not limit-to-project)
             (bh/is-project-subtree-p))
        subtree-end)
       ((and limit-to-project
             (bh/is-project-subtree-p)
             (member (org-get-todo-state) (list "NEXT")))
        subtree-end)
       (t
        nil)))))

(defun bh/skip-project-tasks ()
  "Show non-project tasks.
Skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       ((bh/is-project-subtree-p)
        subtree-end)
       (t
        nil)))))

(defun bh/skip-non-project-tasks ()
  "Show project tasks.
Skip project and sub-project tasks, habits, and loose non-project tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
           (next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((bh/is-project-p)
        next-headline)
       ((org-is-habit-p)
        subtree-end)
       ((and (bh/is-project-subtree-p)
             (member (org-get-todo-state) (list "NEXT")))
        subtree-end)
       ((not (bh/is-project-subtree-p))
        subtree-end)
       (t
        nil)))))

(defun bh/skip-projects-and-habits ()
  "Skip trees that are projects and tasks that are habits"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun bh/skip-non-subprojects ()
  "Skip trees that are not projects"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (if (bh/is-subproject-p)
        nil
      next-headline)))

;; ;;; Org clock

;; ;; Save the running clock and all clock history when exiting Emacs, load it on startup
(org-clock-persistence-insinuate)
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Show lot of clocking history so it's easy to pick items off the C-F11 list
;; (setq org-clock-history-length 23)

;; ;; Change tasks to NEXT when clocking in
(setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
;; ;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))

;; ;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; ;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; ;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; ;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; ;; Do not prompt to resume an active clock
;; (setq org-clock-persist-query-resume nil)
;; ;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; ;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

(setq bh/keep-clock-running nil)

;; ;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

(defun bh/clock-in-to-next (kw)
  "Switch a task from TODO to NEXT when clocking in.
Skips capture tasks, projects, and subprojects.
Switch projects and subprojects from NEXT back to TODO"
  (when (not (and (boundp 'org-capture-mode) org-capture-mode))
    (cond
     ((and (member (org-get-todo-state) (list "TODO"))
           (bh/is-task-p))
      "NEXT")
     ((and (member (org-get-todo-state) (list "NEXT"))
           (bh/is-project-p))
      "TODO"))))

(defun bh/find-project-task ()
  "Move point to the parent (project) task if any"
  (save-restriction
    (widen)
    (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
      (while (org-up-heading-safe)
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq parent-task (point))))
      (goto-char parent-task)
      parent-task)))

(defun bh/punch-in (arg)
  "Start continuous clocking and set the default task to the
selected task.  If no task is selected set the Organization task
as the default task."
  (interactive "p")
  (setq bh/keep-clock-running t)
  (if (equal major-mode 'org-agenda-mode)
      ;;
      ;; We're in the agenda
      ;;
      (let* ((marker (org-get-at-bol 'org-hd-marker))
             (tags (org-with-point-at marker (org-get-tags-at))))
        (if (and (eq arg 4) tags)
            (org-agenda-clock-in '(16))
          (bh/clock-in-organization-task-as-default)))
    ;;
    ;; We are not in the agenda
    ;;
    (save-restriction
      (widen)
                                        ; Find the tags on the current task
      (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
          (org-clock-in '(16))
        (bh/clock-in-organization-task-as-default)))))

(defun bh/punch-out ()
  (interactive)
  (setq bh/keep-clock-running nil)
  (when (org-clock-is-active)
    (org-clock-out))
  (org-agenda-remove-restriction-lock))

(defun bh/clock-in-default-task ()
  (save-excursion
    (org-with-point-at org-clock-default-task
      (org-clock-in))))

(defun bh/clock-in-parent-task ()
  "Move point to the parent (project) task if any and clock in"
  (let ((parent-task))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (not parent-task) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (if parent-task
            (org-with-point-at parent-task
              (org-clock-in))
          (when bh/keep-clock-running
            (bh/clock-in-default-task)))))))

(defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")

(defun bh/clock-in-organization-task-as-default ()
  (interactive)
  (org-with-point-at (org-id-find bh/organization-task-id 'marker)
    (org-clock-in '(16))))

(defun bh/clock-out-maybe ()
  (when (and bh/keep-clock-running
             (not org-clock-clocking-in)
             (marker-buffer org-clock-default-task)
             (not org-clock-resolving-clocks-due-to-idleness))
    (bh/clock-in-parent-task)))

(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

;;; Show the clocked-in task - if any - in the header line
;; (defun sanityinc/show-org-clock-in-header-line ()

;;   (setq-default header-line-format '((" " org-mode-line-string " "))))

;; (defun sanityinc/hide-org-clock-from-header-line ()
;;   (setq-default header-line-format nil))

;; (add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
;; (add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
;; (add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

;; (after-load 'org-clock
;;   (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
;;   (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu))

;; 
;; ;; org-clock-statusbar app - activates a status bar when a task is clocked in or not
;; ;; (when (and *is-a-mac* (file-directory-p "/Applications/org-clock-statusbar.app"))
;; ;;   (add-hook 'org-clock-in-hook
;; ;;             (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e"
;; ;;                                 (concat "tell application \"org-clock-statusbar\" to clock in \"" org-clock-current-task "\""))))
;; ;;   (add-hook 'org-clock-out-hook
;; ;;             (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e"
;; ;;                                 "tell application \"org-clock-statusbar\" to clock out"))))


;; 
;; ;; Remove empty LOGBOOK drawers on clock out
(defun sanityinc/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at (point))))

(add-hook 'org-clock-out-hook 'sanityinc/remove-empty-drawer-on-clock-out 'append)



;; ;; TODO: warn about inconsistent items, e.g. TODO inside non-PROJECT
;; ;; TODO: nested projects!


;; 
;; ;;; Archiving

(setq org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archive")

(defun bh/skip-non-archivable-tasks ()
  "Skip trees that are not available for archiving"
  (save-restriction
    (widen)
    ;; Consider only tasks with done todo headings as archivable candidates
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
          (subtree-end (save-excursion (org-end-of-subtree t))))
      (if (member (org-get-todo-state) org-todo-keywords-1)
          (if (member (org-get-todo-state) org-done-keywords)
              (let* ((daynr (string-to-int (format-time-string "%d" (current-time))))
                     (a-month-ago (* 60 60 24 (+ daynr 1)))
                     (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                     (this-month (format-time-string "%Y-%m-" (current-time)))
                     (subtree-is-current (save-excursion
                                           (forward-line 1)
                                           (and (< (point) subtree-end)
                                                (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                (if subtree-is-current
                    subtree-end ; Has a date in this month or last month, skip it
                  nil))  ; available to archive
            (or subtree-end (point-max)))
        next-headline))))



;; ;; ;; Org pomodoro
;; (require-package 'org-pomodoro)
;; (setq org-pomodoro-keep-killed-pomodoro-time t)
;; (after-load 'org-agenda
;;   (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro))


;; ;; Show iCal calendars in the org agenda
;; (setq org-agenda-include-diary t)




;; ;; (add-hook 'org-agenda-cleanup-fancy-diary-hook
;; ;;           (lambda ()
;; ;;             (goto-char (point-min))
;; ;;             (save-excursion
;; ;;               (while (re-search-forward "^[a-z]" nil t)
;; ;;                 (goto-char (match-beginning 0))
;; ;;                 (insert "0:00-24:00 ")))
;; ;;             (while (re-search-forward "^ [a-z]" nil t)
;; ;;               (goto-char (match-beginning 0))
;; ;;               (save-excursion
;; ;;                 (re-search-backward "^[0-9]+:[0-9]+-[0-9]+:[0-9]+ " nil t))
;; ;;               (insert (match-string 0)))))

;; (after-load 'org
;;   (define-key org-mode-map (kbd "C-M-<up>") 'org-up-element)
;;   (when *is-a-mac*
;;     (define-key org-mode-map (kbd "M-h") nil)
;;     (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))

;; (after-load 'org
;;   (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '((R . t)
;;      (ditaa . t)
;;      (dot . t)
;;      (js . t)
;;      (emacs-lisp . t)
;;      (gnuplot . t)
;;      (haskell . nil)
;;      (latex . t)
;;      (ledger . t)
;;      (ocaml . nil)
;;      (octave . t)
;;      (python . t)
;;      (ruby . t)
;;      (screen . nil)
;;      (sh . t)
;;      (sql . nil)
;;      (sqlite . t))))

;; ;; ;; Mac Message to link to messages in Mail.app

;; ;; (setq org-mac-mail-account "Google")

;; ;; ;; Take all flagged messages from 'Google' account and put into refile.org under 'Flagged Mail' heading
;; ;; (defun my-mail-import ()
;; ;;   (let ((org-mac-mail-account "Google"))
;; ;;     (org-mac-message-insert-flagged '"refile.org" "Flagged mail")))

;; ;; ;; Custom agenda item to import flagged messages
;; ;; (setq org-agenda-custom-commands '(("F" "Import links to flagged mail" agenda ""
;; ;;                                     ((org-agenda-mode-hook (my-mail-import))))))

;; ; Tags with fast selection keys
;; (setq org-tag-alist (quote ((:startgroup)
;;                            ("@errand" . ?e)
;;                            ("@computer" . ?o)
;;                            ("@home" . ?H)
;;                            ("@office" . ?f)
;;                            (:endgroup)
;;                            ("WAITING" . ?w)
;;                            ("HOLD" . ?h)
;;                            ("PERSONAL" . ?P)
;;                            ("WORK" . ?W)
;;                            ("NOTE" . ?n)
;;                            ("CANCELLED" . ?c)
;;                            ("FLAGGED" . ??))))

;;                                         ; Allow setting single tags without the menu
;; (setq org-fast-tag-selection-single-key (quote expert))

;;                                         ; For tag searches ignore tasks with scheduled and deadline dates
;; (setq org-agenda-tags-todo-honor-ignore-options t)

;; ;; One way sync between Google calendars into diary on startup
;; ;; Taken from http://unix.stackexchange.com/questions/1850/emacs-sync-w-google-calendar-and-contacts
;;                                         ; (setq mark-diary-entries-in-calendar t)
;;                                         ; (defun getcal (url)
;;                                         ;   "Download ics file and add to diary"
;;                                         ;   (let ((tmpfile (url-file-local-copy url)))
;;                                         ;     (icalendar-import-file tmpfile "~/Documents/Meta Work/diary" t)
;;                                         ;     (kill-buffer (car (last (split-string tmpfile "/"))))
;;                                         ;     )
;;                                         ;   )
;;                                         ; (setq google-calendars '("https://www.google.com/calendar/ical/andydrice%40gmail.com/private-e79ad6279f85e7b04feb4719b779546c/basic.ics"))

;;                                         ; (defun getcals ()
;;                                         ;   (Find-file "~/Documents/Meta Work/diary")
;;                                         ;   (flush-lines "^[& ]")
;;                                         ;   (dolist (url google-calendars) (getcal url))
;;                                         ;   (kill-buffer "diary"))

;;                                         ; (getcals)
;; ;; Log overview for weekly review - set to custom keybinding
;; ;; See http://emacs.stackexchange.com/questions/909/how-can-i-have-an-agenda-timeline-view-of-multiple-files
;; ; (defun org-agenda-timeline-all (&optional arg)
;; ;   (interactive "P")
;; ;   (with-temp-buffer
;; ;     (dolist (org-agenda-file org-agenda-files)
;; ;       (insert-file-contents org-agenda-file nil)
;; ;       (end-of-buffer)
;; ;       (newline))
;; ;     (write-file "~/Documents/Meta Work/timeline.org")
;; ;     (org-agenda arg "L")))

;; ; (global-set-key "C-c t")
;; ; (define-key org-mode-map (kbd "C-c t") 'org-agenda-timeline-all)

(provide 'init-org)
