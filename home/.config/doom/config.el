;; Set your Roam directory
(setq org-roam-directory (file-truename "~/org-roam"))
(setq org-journal-dir "~/org-roam/journal")

(map! :leader
    (:prefix-map ("w" . "wiki")
    :desc "Open Index" "w" (lambda () (interactive) (find-file (expand-file-name "20260513000206-main_thing.org" org-roam-directory)))))

(setq display-line-numbers-type 'relative)
