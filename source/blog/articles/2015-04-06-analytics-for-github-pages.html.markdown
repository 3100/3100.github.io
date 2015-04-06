---
title: "Github Pagesでリアルタイムアクセス解析を行う"
published: true
date: 2015-04-06 20:00
comments: true
tags: google-analytics, ga-beacon, github, middleman, hexo
---

先日、`hexo`という`Node.js`製静的サイト作成ツールを用いて[Npm Inside](http://npminside.github.io/)というブログを新たに始めました。
ついでに、遅ればせながらきちんとアクセス解析もしようと思い立ちました。
このブログは`middleman`で作っていますが、こちらも特に解析をしていませんでした。

早速調べたところ、`ga-beacon`というライブラリが良さそうだったので導入してみました。

[igrigorik/ga-beacon](https://github.com/igrigorik/ga-beacon)

## ga-beaconとは

<img src="https://camo.githubusercontent.com/56019dbde15bdf7303fa16e9860ba07787801b72/68747470733a2f2f6c68352e676f6f676c6575736572636f6e74656e742e636f6d2f2d5a753972396d37557630632f557353516c4a354f6f65492f414141414141414148776f2f6676485f6c7256555630772f77313030372d683436372d6e6f2f736b697463682e706e67" width="800px" />

`ga-beacon`は`MIT`ライセンスで公開されているツールで、`Google Analytics`と連携してリアルタイムにアクセス解析を行ってくれるものです。
`Google Analytics`の画面から現在どのページに何人アクセスしているのかを閲覧することができます。

元々、`Github Pages`用のアクセス解析は無いかと探していて、このツールにたどり着きました。

## 導入方法

導入は簡単です。事前に`Google Analytics`に登録をします。

- 新しいプロパティを作成します。
- `Website`を選択します。
- `Website name`に識別用の名前を入力します。
- `WebSite URL`の項目に`https://ga-beacon.appspot.com/`と入力します。
- `Get Tracking ID`をクリックし、`UA-XXXXX-X`というIDをコピーするかメモります。

`https://ga-beacon.appspot.com`のように外部URLを指定したくないという方は、自前でGAE上にインスタンスを建てることも可能です。

続いて、アクセス解析を行いたいページに以下のようなHTMLを追加します。ここに貼られた画像がいわゆるビーコンとしてアクセスを検知します。

~~~html
<a href="http://your.site.com/page-name">
  <img src="https://ga-beacon.appspot.com/UA-XXXXX-X/your.site.com/page-name" />
</a>
~~~

もし、ビーコン画像を表示したくない場合は、`img src`で指定したURLの最後に`?pixel`を付与しましょう。

実際のケースでは、これを全てのページに登録するのはとても骨の折れる作業です。
静的サイト作成ツールを利用している場合にはなんとか自動化しましょう。

### middlemanのケース

`middleman`を`middleman-blog`と共に利用している場合は、`source/_layouts/article.slim`にて

~~~slim
= link_to current_article
  = image_tag "https://ga-beacon.appspot.com/UA-XXXXX-X/#{current_article.url}?pixel"
~~~

を適当なところに埋め込むと良いでしょう。(`slim`の例)
デフォルトのテンプレートエンジンなら、以下の様な感じでしょうか。(違っていたらごめんなさい)

~~~erb
<% link_to current_article do %>
  <%= image_tag "https://ga-beacon.appspot.com/UA-XXXXX-X/#{current_article.url}?pixel" %>
<% end %>
~~~

### hexoのケース

`hexo`を利用している場合は、`themes/your-theme/layout/_partial/article.ejs`内の適当な箇所に

~~~html
<a href="<%- post.permalink %>">
  <img src="https://ga-beacon.appspot.com/UA-XXXXX-X/<%- post.path -%>?pixel" />
</a>
~~~

と追加すると良いかと思います。

## まとめ

以上のような感じで、リアルタイムにアクセス解析が実現します。
素晴らしいですね。
