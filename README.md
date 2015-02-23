# vim

In order to get these plugins to work, you're going to need to install Vundle. 

Vundle is a plugin manager for vim. To install it, you're going to need git (which I hope you have). If you don't have git, use: 
  sudo apt-get install git
  
Now that you have git, you're going to have to get Vundle. Use:
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  
Now open your .vimrc file (if you haven't edited this file before, it's going to create the file for you automatically):
  vim ~/.vimrc
  
Copy and paste the contents of my .vimrc file to yours. Go ahead and close vim with 
  ZZ 
or 
  :x 
or 
  :wq
or something else.
  
Now you're going to have to install Vundle. Open vim again with:
  vim
  
And type 
  :PluginInstall
  
This will open a new buffer that shows you the progress of the installation. Once it's done use
  ZZ
or 
  :bdelete
or 
  :x
or 
  :wq
  
Until vim is closed again. 
  
This should install the plugins for you and my vimrc settings should be applied.
