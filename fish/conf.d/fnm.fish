
# fnm
set FNM_PATH "/home/tido/.local/share/fnm"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env --use-on-cd --version-file-strategy=recursive | source
end
