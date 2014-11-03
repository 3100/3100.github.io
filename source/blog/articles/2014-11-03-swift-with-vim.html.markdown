---
title: "SwiftをVimから叩きたい"
published: true
date: 2014-11-03 12:00
comments: true
tags: vim, swift
---
## 概要

最近仕事は`R`だし興味あるのは1.4β版で盛り上がってる`Go`だし、
覚える言語多すぎると挫折しそうなので、
今までこじらせて`RubyMotion`に逃げたりしたけど、
下の記事を読んで色々考えて、逆に`Swift`をやろうと思った。

cf. [Should my company choose RubyMotion or Swift? - The Frontier Group Journal](http://blog.thefrontiergroup.com.au/2014/09/should-my-company-choose-rubymotion-or-swift/)

まずは`Vim`から実行できるようにしました。
`vim-quickrun`を`Neobundle`あたりで導入済みというのが前提です。

## 準備

`Xcode6`はいずれにしても必要と思われるので、
事前に[AppStore](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)からインストールしておきます。

手元環境ではなぜかインストールしたのに`Xcode5`になってるという悲しい事態もありましたが
削除後再インストールで無事6が入りました。

## Swiftをコマンドラインから叩けるようにする

Webを見るとまだベータ版の頃の方法が多く見つかりますが、
現時点では以下のようにするとよいでしょう。

~~~
# xcode-select -switch /Applications/Xcode.app/Contents/Developer
~~~

とした後、

~~~
$ xrun swift
~~~

でREPL環境に入れるようになります。引数にswiftファイルを渡せば、結果を返します。

cf. [xcode - How can I use swift in Terminal? - Stack Overflow](http://stackoverflow.com/questions/24011120/how-can-i-use-swift-in-terminal)

## Vimの設定

* Swift用シンタックスハイライトとインデント
* [vim-quickrun](https://github.com/thinca/vim-quickrun)で動かせるようにする

`$HOME/.vimrc`に以下を追加します。

~~~sh
if has("mac")
   NeoBundle 'toyamarinyon/vim-swift'

   let g:quickrun_config['swift'] = {
   \ 'command': 'xcrun',
   \ 'cmdopt': 'swift',
   \ 'exec': '%c %o %s',
   \}
 endif
~~~

## 参考

[Swift をコマンドラインから使う - oooooooo](http://oooooooo.hatenablog.com/entry/2014/10/04/23532)

後から見つけたのだけど、`Quick`など周辺ツールについても書かれていてオススメです。
