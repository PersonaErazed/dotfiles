dotfile_root="$(pwd -P)"

install_user_scripts () {
  if [ -d ~/bin ]; then
    echo
    echo WARNING: bin exists in home already.
    echo Will attempt to soft link files if they do not exists.
    for file in $dotfile_root/bin/*
    do
      filename=${file##*/}
      if [ -e ~/bin/$filename ]; then
        echo
        echo WARNING: filename $filename exists in the bin directory in home. 
        echo Soft link for $file was not added.
      else
        echo
        echo Creating soft link from ~/bin/$filename to $file
        ln -sv $file ~/bin/$filename
      fi
    done
  else
    # soft link user scripts to bin in home dir
    ln -sv $dotfile_root/bin  ~/bin
  fi
}
install_rc () {
  for file in $dotfile_root/rc/* 
  do
    if [ -f $file ]; then
      filename=${file##*/}
      if [ -e ~/.$filename ]; then
        echo
        echo WARNING: filename .$filename exists in home directory. 
        echo Soft link for $file was not added.
      else
        echo
        echo Creating soft link from ~/bin/$filename to $file
        ln -sv $file ~/.$filename
      fi
    else
      echo
      echo WARNING: $file is not an runtime configuration file.
    fi
  done
}
install_files_with_sym_extension() {
  for file in $dotfile_root/*
  do
    filename=${file##*/}
    extension=${filename##*.}
    if [ $extension == sym ]
    then
      echo Creating soft link from ~/.${filename%.*} to $file
      ln -sv $file ~/.${filename%.*}
    fi
  done
}
install_user_scripts
install_rc
install_files_with_sym_extension
