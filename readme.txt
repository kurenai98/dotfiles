gkgc[rep]
git clone git://github.com/kurenai98/dotfiles.git

vim proc
.vim/bundle/vimproc/
make -f make_unix.mx

[commit]
git add .
git commit -m "initial commit"
git remote add origin git@github.com:kurenai98/dotfiles.git
git push -u origin master

[install after]
git submodule init
git submodule update

[submodule update]
git rm --cashed ./vim/.bundle/
git submodule update


--- PHP ---
/var/www/html/

--- Ricty ----

cd /tmp
wget http://levien.com/type/myfonts/Inconsolata.otf
wget http://iij.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-1m-20130617.zip
unzip migu-1m-20130617.zip
git clone https://github.com/yascentur/Ricty.git

cd Ricty
./ricty_generator.sh ~/tmp/Inconsolata.otf ~/tmp/migu-1m-20130617/migu-1m-regular.ttf ~/tmp/migu-1m-    20130617/migu-1m-bold.ttf

mv Ricty*.ttf ~/.fonts
fc-cache -fv


