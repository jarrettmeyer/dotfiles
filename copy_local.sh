files=( ".bash_profile" ".gitconfig" ".githelpers" ".vimrc" )
for file in "${files[@]}"
do
  echo "Copying '$file'..."
  cp ~/"${file}" .
done

