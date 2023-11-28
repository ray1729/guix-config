;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
	     (gnu home services)
             (gnu home services shells))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
 (packages (specifications->packages (list
				      "clojure"
				      "clojure-tools"
				      "curl"
				      "emacs"
				      "emacs-auto-complete"
				      "emacs-cider"
				      "emacs-clojure-mode"
				      "emacs-dockerfile-mode"
				      "emacs-flycheck"
				      "emacs-geiser"
				      "emacs-geiser-guile"
				      "emacs-git-modes"
				      "emacs-go-mode"
				      "emacs-magit"
				      "emacs-markdown-mode"
				      "emacs-paredit"
				      "emacs-rainbow-delimiters"
				      "emacs-systemd-mode"
				      "git"
				      "git-crypt"
				      "git-lfs"
				      "glibc-locales"
				      "gnucash"
				      "nss-certs"
				      "openjdk"
				      "password-store"
				      "recutils")))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (list (service home-bash-service-type
                  (home-bash-configuration
                   (aliases '(("egrep" . "egrep --color=auto")
                              ("fgrep" . "fgrep --color=auto")
                              ("grep" . "grep --color=auto")
                              ("l" . "ls -CF")
                              ("la" . "ls -A")
                              ("ll" . "ls -alF")
                              ("ls" . "ls --color=auto")))
                   (bashrc (list (local-file "dotfiles/bashrc"
                                             "bashrc")))
                   (bash-logout (list (local-file
                                       "dotfiles/bash_logout"
                                       "bash_logout")))))
	 (simple-service 'my-dotfiles
			 home-files-service-type
			 `((".emacs" ,(local-file "dotfiles/emacs"))
			   (".gitconfig" ,(local-file "dotfiles/gitconfig")))))))
