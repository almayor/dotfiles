Bashmarks {#readmeTitle}
=====

Bashmarks is a shell script that allows you to save and jump to commonly used directories with tab completion. Also works with zsh
{#description}

Extra Features
--------------

* default directory when using `go - default `$HOME`.
* Allows placing commands after the the letter e.g `go webfolder ls` would go the webfolder bookmark then perform `ls`
* `go -` Goes to the previous directory.
* `o command` to open the bookmark in Finder (Mac OS X Only).
* `tab command` to open the bookmark in a new tab (Mac OS X Only).
* the `tab command` works with Terminal and ITerm2

Install
-------

1. git clone this repo
2. make install  (or just put bashmarks.sh in your $PATH and source `it`  )
3. **source ~/.local/bin/bashmarks.sh** from within your **~.bash\_profile** or **~/.bashrc** file

Shell Commands
--------------

# save <bookmark_name>      - Saves the current directory as "bookmark_name"
# go <bookmark_name>        - Goes (cd) to the directory associated with "bookmark_name"
# delete <bookmark_name>    - Deletes the bookmark
# bookmarks <bookmark_name> - Lists the specified bookmark associated with "bookmark_name"
# bookmarks                 - Lists all available bookmarks
# save                      - Saves the default directory
# go                        - Goes to the default directory
# go -                      - Goes to the previous directory
# _p <bookmark_name>        - Prints the directory associated with "bookmark_name"

# Mac only 
# o <bookmark_name>    - Open the directory associated with "bookmark_name" in Finder
# tab <bookmark_name>  - Open the directory associated with "bookmark_name" in a new tab

Example Usage
-------------

	$ cd /var/www/
	$ save webfolder
	$ cd /usr/local/lib/
	$ save locallib
	$ bookmarks
		webfolder	 /var/www/
		locallib	 /usr/local/lib/
	$ go web<tab>
	$ go webfolder	  # cd to /var/www/
	$ o webfolder	  # Open in Finder if on mac
	$ bookmarks locallib
		locallib	 /usr/local/lib/
		
Options
-------

Set `BASHMARKS_ITERM_SESSION` to a session name to change the session that is launched when using `tab` in iTerm2 on `osx` 

        
Where Bashmarks are stored
--------------------------
    
All of your directory bookmarks are saved in a file called `.sdirs` in your `$HOME` directory.
