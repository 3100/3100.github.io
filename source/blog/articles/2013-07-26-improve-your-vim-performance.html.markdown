---
title: "vimの起動速度を改善する"
published: true
date: 2013-07-26 16:41
comments: true
tags: vim
categories:  vim
---
ふと気づいたら、vimの起動に2秒ほどかかるようになっていました。そこで、google先生を頼りに、原因の究明と解決策を調べてみました。

## 時間計測

### とりあえずvimの標準機能で

vimにはstartuptimeという実行時オプションがあります。これを使ってみましょう。

現在の起動時間を計測(hogeファイルにログ保存)

~~~
$ vim --startuptime hoge
~~~

Xサーバへの接続を行わせずに起動時間を計測

~~~
$ vim -X --startuptime hoge
~~~

空のvimrcファイルを用いて起動時間を計測

~~~
$ vim -u vimrc --noplugin --startuptime hoge
~~~

### プラグインを用いて

benchvimrc-vimというプラグインを用いると、各行にかかった時間を計測してくれます。

NeoBundleを利用している場合は

~~~
NeoBundle 'mattn/benchvimrc-vim'
~~~

あるいは

~~~
NeoBundleLazy 'mattn/benchvimrc-vim', {
  \ 'autoload': {
    \   'commands': ['BenchVimrc'],
      \  },
    \}
~~~

を$HOME/.vimrcなどに追加してください。インストール後、

~~~
:BenchVimrc
~~~

で測定します。

[.vimrcの各行ごとにどれくらい時間がかかっているかを測定できる。](https://github.com/mattn/benchvimrc-vim)

## 重い原因例

### setup clipboard

~~~
$ vim -X
~~~

で軽くなる場合は$HOME/.vimrcに

~~~
set clipboard=exclude:.*
~~~

と設定すれば同じ効果が得られます。自分の場合はほとんどこいつが原因でした。修正後、起動時間が100ミリ秒に短縮しました。

### inits 3

~~~
$ vim -i NONE
~~~

で改善する場合はviminfoファイルなどを生成しないようにするなどの対応で改善可能です。

viminfoの役割については以下などを参照しましょう。

[vimエディタが(勝手に)作成する、一見、不要に見えるファイルが何をしているか — 名無しのvim使い](http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html#viminfo)

### 特定プラグインの読み込みに時間がかかっている

NeoBundleを利用している前提ですが、NeoBundleLazyを検討しましょう。

例えば、上のほうで出てきたこの記述ですが

~~~
NeoBundle 'mattn/benchvimrc-vim'
~~~

以下のように書き換えることで、:BenchVimrcが呼び出されるまでプラグイン読み込みを遅延できます。

~~~
NeoBundleLazy 'mattn/benchvimrc-vim', {
  \ 'autoload': {
    \   'commands': ['BenchVimrc'],
      \  },
    \}
~~~

autoloadにはcommandsの他、filetypesを指定することもできます。その場合は該当拡張子のファイルが開かれる段階で、プラグイン読み込みが行われます。

[NeoBundleLazyをvimrcに導入した。 - Qiita ](http://qiita.com/rbtnn/items/600ac451ebb43b2c9c13)

# 参考

その他、以下の記事が役に立ちました。

[「立て！立つんだビムー！」 - sorry, unimplemented:](http://rhysd.hatenablog.com/entry/2012/12/19/001145)

[vim takes a very long time to start up - Stack Overflow](http://stackoverflow.com/questions/14635295/vim-takes-a-very-long-time-to-start-up)

[Big Sky :: vimrcのどこが重いのかを調べられるプラグイン書いた。](http://mattn.kaoriya.net/software/vim/20120315221158.htm)

