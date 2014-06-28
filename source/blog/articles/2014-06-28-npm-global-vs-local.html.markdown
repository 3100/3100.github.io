---
title: "npm:globalとlocal"
published: true
date: 2014-06-28 11:07
comments: true
tags: node.js
---

## 概要

`node.js`のパッケージ管理ツールである`npm`。
`package.json`などと併用すると非常に便利ですが
`-g`オプションの使い分けが気になりました。

## 資料

`node.js`の公式サイトに、`npm 1.0`が登場した時の記事があります。

[npm 1.0: Global vs Local installation](http://blog.nodejs.org/2011/03/23/npm-1-0-global-vs-local-installation)

## 基本機能

知っている人には今更かもしれませんが、おさらいです。

### global

* パッケージは`{prefix}/lib/node_modules`に置かれる
* 実行ファイルは`{prefix}/bin`に配置される
* manページがある場合は`{prefix}/share/man`に置かれる
* `{prefix}`は`/usr/local`など。

### local

* パッケージは現在のディレクトリ下、`./node_modules`に置かれる
* 実行ファイルは`./node_modules/bin`に配置される
* manページはインストールされない

## 使い分け

基本的には以下の方針に従えば良さそうです。

1. 今のプロジェクトで使いたいだけなら`require('whatever')`して、localにインストールする。
1. シェルやコマンドプロンプトなどから使いたい場合は`-g`オプションをつけてglobalにインストールする。

## CoffeescriptやExpressなど

こうしたパッケージはライブラリでもありますが、コマンドラインインターフェースも備えています。
こうした場合、2つの方法があるそうです。(前者がオススメされています。)

1. globalとlocal両方にインストールする。実質これで動くし、ディスクスペースを多少浪費するくらい。
1. globalにインストールしたあとで`npm link express`などとする。これでglobal側だけ更新していくようにすれば他のシンボリックリンクにも反映される。(Windowsではcygwinなどを使わない限り、この方法は取れない)

## その他

上記記事では子フォルダでさらに`npm install`する例も紹介されていますが、管理上面倒なことになりますし、あまり気にする必要はないでしょう。

また、localにインストールしてもPATHを通せばコマンドラインインターフェースも使用できるので、globalインストールを全く使わないという選択肢もありです。
