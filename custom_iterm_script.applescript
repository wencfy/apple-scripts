-- a script reads path from Finder and opens with iterm

on run

  set finderSelection to ""
  set thePath to ""
  set defaultPath to (path to home folder as alias)

  tell application "Finder"
      set finderSelection to (get selection)
      if length of finderSelection is greater than 0 then
          set thePath to finderSelection
      else
          try
              set thePath to (folder of the front window as alias)
          on error
              set thePath to defaultPath
          end try
      end if

      tell application "iterm"
          open thePath as alias
      end tell
  end tell

end run