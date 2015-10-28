# vimfiles

This is my presonal vim/gvim configuration. Feel free to clone it.

## How to use

Clone this repository into `~/vim` and install the plugins using (vundle)[https://github.com/gmarik].

    [ -d ~/.vim ] && mv ~/.vim ~/.vim.old
    [ -r ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old
    git clone https://github.com/duderamos/vimfiles.git ~/.vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ln -s ~/.vim/vimrc ~/.vimrc

Start `vim` and install the plugins with the following command:

    :PluginInstall

## Credits

Created and maintained by Eduardo Ramos

## License

**The MIT License (MIT)**

**Copyright (c) 2015 Eduardo Ramos**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
