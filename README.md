# vim

In order to get these plugins to work, you're going to need to install a package manager called [Vundle.](https://github.com/VundleVim/Vundle.vim). So click that and do what it says (it's not that bad).

Now you're going to have to clone this repo and replace your .vimrc with mine. In your shell, type the following:

    $ git clone http://github.com/agcollins/vim_agc.git ./ && cp ./vim_agc/.vimrc ~/.vimrc 

Just as in the Vundle installation README, you're going to open vim and do :PluginInstall (if you have previously installed plugins with vundle, run a :PluginClean before you install).

One quick note:
  If you'd like to use my session options, assuming you're using bash, you're going to need to add an alias to your .bashrc (usually located at ~/.bashrc). 

  Add the following line:

    alias vims='vim -S ~/.vim/agc_session.vim'

  Now, to have bash reflect the changes in the .bashrc file, from your terminal, type
    
    $ bash

  From this point forward, if you'd like to exit from vim, save all of your current buffers and write all of that to a session, press leader (the ',' key) z.

  To restore that session you're going to type

    $ vims

  Instead of 

    $ vim

  At your terminal. This alias just opens that session you just created with leader z

#Now enjoy my .vimrc!
