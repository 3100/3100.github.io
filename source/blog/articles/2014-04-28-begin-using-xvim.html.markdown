---
title: "XVimをXCodeに導入した"
published: true
date: 2014-04-28 22:00
comments: true
tags: vim, xcode
---

## 概要

XCodeを触っていると、いつもの癖でVim用のキーを入力してしまい、なかなか慣れません。
どうしたものかと調べてみたところ、`XVim`なるものがあるらしいと知り、早速導入してみました。

## 導入

[https://github.com/Jugglershu/XVim](https://github.com/Jugglershu/XVim)

導入の仕方は上記URLに書いてある通りです。
一見するとmasterブランチの更新が止まっているように見えますが、XCode5向けの開発はブランチで行われているようです。
XCode5向けに導入する場合は、ブランチを変更するなどの操作が必要となりますので注意して読みましょう。

設定ファイルは$HOME/.xvimrcになるようです。.vimrcと100%互換があるわけではなく、使用可能な書式は制限されています。
が、とりあえずvim風に使えるようになったことでも、満足です。
VisualStudioの`VsVim`と同様に、欠かせないプラグインになりそうです。

尚、XVimについては、以下の記事で知りました。

[XVim を Xcode 5.1 にインストール - Unmotivated](http://blog.lciel.jp/blog/2014/03/17/installation-of-xvim/)

## おまけ(XVimで満足できない方向け)

[Vim for iOS developers](http://ap4y.github.io/2013/11/10/vim-for-ios-developers.html)

Rakeなどを用いてvim上で全部やろうという記事です。去年の11月に書かれたものなので、そんなに古くなさそうです。
ざっと目を通した感じ、`Dash`なんかも`dash.vim`を使ったり、補完もclang向けのライブラリを使ったり、`ag.vim`まで持ち出したりと
結構ガチな内容です。

そこまで試せていませんが、とことん突き詰めたい方向けの記事なのではないかと思います。
誰もはてブしてないので、とりあえずしておきました。
