---
title: "martiniとgin"
published: true
date: 2014-07-03 22:00
comments: true
tags: golang, martini, gin
---

## 概要

[martini](https://github.com/go-martini/martini)という`Go`向けのWebアプリケーションフレームワーク(WAF)があります。
最近リリースされて、すぐに`Go`コミュニティ界隈で話題になりましたね。

また、[gin](https://github.com/gin-gonic/gin)という別のWAFも出て、
こちらは`martini`より40倍以上も速いぜと主張しています。

どちらか迷った挙句、速さは正義ということで、`gin`を触ってみたのですが
結局`martini`を使うことにしました。

## martiniについて

`martini`は機能拡張を容易にするため、DIを利用しています。
この実装として、リフレクションを利用しています。

一方、`Go`の`net/http`パッケージはそうした実装にはなっていません。
リフレクションを利用することはパフォーマンス的にも2桁近く遅くなることがある他、
ランタイムエラーの原因にもなるなどから、一部で批判を受けました。
(そもそもDIは`Java`での古き悪しきイメージが強いのかもしれません。)

[Three reasons you should not use Martini - Stephen Searles](https://stephensearles.com/?p=254)

開発者の[@codegangsta](https://twitter.com/codegangsta)ことJeremy Saenzはこうした批判に対して記事を書いていて、
`martini`のDI実装が完璧ではないことを率直に認め、
[negroni](https://github.com/codegangsta/negroni)という別のアプローチも試みるよと書いています。

[My Thoughts on Martini - Code Gangsta](http://codegangsta.io/blog/2014/05/19/my-thoughts-on-martini/)

既に`martini`を使っている人向けには、ぜひ今後とも使い続けて欲しい、とコメントしています。

## ginについて

`martini`が批判を受け、かつそれより高速で同じように記述できる`gin`が出てきた今
`martini`は無用の長物なのでしょうか。

[Show HN: Gin – Golang Martini-like web framework - Hacker News](https://news.ycombinator.com/item?id=7966700)

`gin`が登場すると、すぐにHacker News上などで反応がありましたが、
実装はかなり薄くなっているため、その部分をどう捉えるかという選択の問題になりそうだなという感想を抱きました。
(ささっと簡単なWebAPIを用意するくらいだったら、高速な`gin`のが良いかもしれません。)

`Go`黎明期から積極的にブログなどで情報公開している@mattnさんも、以下のようにツイートしています。

<blockquote class="twitter-tweet" lang="ja"><p>gin が martini の40倍速いって話、コードを軽く読んだ感じだと gin は martini の rack like middleware 層を排除している反面、機能を最少しか持ってない。足りない感じもしなくないので同じ土俵で40倍速いってのはフェアじゃない気もする。</p>&mdash; mattn (@mattn_jp) <a href="https://twitter.com/mattn_jp/statuses/483778677197373441">2014, 7月 1</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

また、個人的に使ってみた感想としては、

* まだ連携ライブラリが少ない(逆に言えば貢献のチャンス？)
* まだまだ実装が変わりそう

な印象を受けました。

例えば、`redis`と連携しようとして、[redigo](https://github.com/garyburd/redigo)なんかを使おうとした場合、
`martini`ではMap機能があるので簡単に取り込んで利用できますが
`gin`ではそういった機能は用意されていません。(あくまで現時点では。)

もっとも、連携機能については、PRもあがっていて、それほど時間はかからずに、改善されるのではないかと思います。

[Wrap http.ResponseWriter to greatly increase middleware/logging accesibilty by zmarcantel · Pull Request #16 · gin-gonic/gin](https://github.com/gin-gonic/gin/pull/16)

あまり重要なポイントではないかもしれませんが、
ルーティング用メソッドが`Get`や`Post`じゃなくて、`GET`や`POST`だというのも、気持ち悪いかもしれません。。

## まとめ

将来的に`gin`がどうなっていくのかは楽しみですが、現時点では`martini`を使うのが、開発時には楽である気がします。

さらに、身も蓋もないことを書きますと、自分自身がそこまで高速であることが求められるようなプロジェクトに携われていません。

とはいえ、たとえば`redis`が数万クエリ/秒を捌けるのに比べて`gin`は約1500リクエスト/秒、`martini`は約300リクエスト/秒(`rails`とか`node.js`級？)ですから、
WAFが高速化すると嬉しい部分はまだまだありそうです。

今後`gin`が高機能になった時点で、再度検討したいなと思います。

## おまけ

日本でも最近は`rebuild.fm`に代表されるような開発者向けpodcastが増えてきましたが、
割りと古くからある`The Changelog`でも少し前に`martini`を取り上げ、
@codegangstaがゲストとして、なぜこういった実装になったか、その思想を語っています。

[#117: Go, Martini and Gophercasts with Jeremy Saenz - The Changelog](http://thechangelog.com/117/)

あとは、どうしてそんなHNになったのかとか、どうでもいい話題もあって楽しめます。

そんなに話す速度も速くないし、割りと日本の英語教育でも学ぶような言い回しが多いので、
`martini`が気になっている方は聴いてみると良いかもしれません。
