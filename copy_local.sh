files=( ".bash_profile" ".gitconfig" ".githelpers" ".git-prompt.sh" ".vimrc" )
for file in "${files[@]}"
do
  echo "Copying '$file'..."
  cp ~/"${file}" .
done

