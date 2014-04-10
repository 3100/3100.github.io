---
title: "Objective-Cへ入門"
published: true
date: 2014-04-10 23:00
comments: true
tags: objective-c
---

iOS用アプリ開発。
数年前に挑戦した時は、あまりの文法の気持ち悪さに断念しました。

しかし、RubyMotionを触っているうちに結局Objective-Cや
iOS SDKを勉強した方が良いなと思い始め、改めて再入門することにしました。
それにあたって、以下の本を購入しました。

## 継続的インテグレーション

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798040894/unplu-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/51dc8HfwK8L._SL160_.jpg" alt="iOSアプリ テスト自動化入門" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798040894/unplu-22/ref=nosim/" name="amazletlink" target="_blank">iOSアプリ テスト自動化入門</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 14.04.10</div></div><div class="amazlet-detail">長谷川 孝二 <br />秀和システム <br />売り上げランキング: 2,341<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798040894/unplu-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>

趣味のWebアプリならともかくも、普段の仕事ではテストの自動化が片手間でしかなくて、そういった部分が嫌なのでiOSアプリを作るなら最低でもTDDでやりたいと思っています。

この本はテスト自動化について簡単な概念から始まって、CIやBDDのフレームワーク紹介なんかも取り扱っています。各ライブラリについては使っているうちに別途詳しく調べる必要が出てくるだろうけれど、最近の開発スタイルについて俯瞰するのには良い1冊な気がしました。

とりあえず数時間で読んでしまえるくらいの記述量で、通勤時間のお供にも良いかもしれません。

## iOSへの入門書

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4800710227/unplu-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/5108ukII8yL._SL160_.jpg" alt="詳細! Objective-C iPhoneアプリ開発 入門ノート Xcode5+iOS7対応" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4800710227/unplu-22/ref=nosim/" name="amazletlink" target="_blank">詳細! Objective-C iPhoneアプリ開発 入門ノート Xcode5+iOS7対応</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 14.04.10</div></div><div class="amazlet-detail">大重 美幸 <br />ソーテック社 <br />売り上げランキング: 2,726<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4800710227/unplu-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>

後述のObjective-C本に比べて図が大きく見やすいです。こうした入門書はあまり好きではないのですが、苦手意識がある場合には大変心強いです。
ざっくり目を通した感じでは、文法部分は必要最低限といった感じで、どちらかというとXCodeを使って実際に簡単なアプリを作っていくことで、基礎力をつけられる構成になっています。

プログラム初心者向けにも見えるけど、そんなに概念を掘り下げて説明しないので、完全な初心者には少し厳しいかもしれないです。他の言語で開発している人なら問題ないでしょう。

きちんと手を動かしていくことが大事ですが、1週間あれば1周できるくらいの量ではないかと思います。

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4774163856/unplu-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/618Wj6bBw1L._SL160_.jpg" alt="iOSアプリエンジニア養成読本[クリエイティブな開発のための技術力/デザイン力/マインドを養う! ] (Software Design plus)" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4774163856/unplu-22/ref=nosim/" name="amazletlink" target="_blank">iOSアプリエンジニア養成読本[クリエイティブな開発のための技術力/デザイン力/マインドを養う! ] (Software Design plus)</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 14.04.10</div></div><div class="amazlet-detail">高橋 俊光 諏訪 悠紀 湯村 翼 平屋 真吾 平井 祐樹 <br />技術評論社 <br />売り上げランキング: 464<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4774163856/unplu-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>

開発を始める前に読むべき、といった取り扱いをされているので買ってみました。良くも悪くも各要素のつまみ食いといった感じで、必ずしも必要ではないのではないかと感じました。
特にgitやjenkins、travis-ciなんかを普段から使っている開発者の方は、他の本で知識を補えば立ち読みでも十分だと思います。

内容自体は面白いしタメになりそうな記事もあるので、開発が進んでいくにつれてふと気楽に読み直すというスタンスが良さそうです。(あるいは新人教育への需要があるのかもしれません。明日までに読んでおけ、的な)

売り上げランキングはさすがといった感じで、今回購入した中で最も人気の1冊でした。

## Objective-C

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4797368276/unplu-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/41VdFg9YqsL._SL160_.jpg" alt="詳解 Objective-C 2.0 第3版" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4797368276/unplu-22/ref=nosim/" name="amazletlink" target="_blank">詳解 Objective-C 2.0 第3版</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 14.04.10</div></div><div class="amazlet-detail">荻原 剛志 <br />ソフトバンククリエイティブ <br />売り上げランキング: 9,586<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4797368276/unplu-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>

通称萩原本？第2版は持っていますが、せっかくなので買い直しました。Objective-C
の文法について日本語で最も詳しい書籍なのではないでしょうか。
これから事あるごとに参照することになりそうです。じっくり取り組むべき本。

iOS5に向けて書かれた本ですし、個人的にはそろそろ第4版が出るのではないかとも思っています。(過去の更新間隔的にも。。)

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798134198/unplu-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/51BbaG2KA1L._SL160_.jpg" alt="Effective Objective-C 2.0" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798134198/unplu-22/ref=nosim/" name="amazletlink" target="_blank">Effective Objective-C 2.0</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 14.04.10</div></div><div class="amazlet-detail">Matt Galloway <br />翔泳社 <br />売り上げランキング: 15,587<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798134198/unplu-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>

手を出すのが早過ぎるかもしれませんが、こちらも少しずつ読んでいこうと思います。他言語版を見ても、Effectiveシリーズは実務の上で必須となるようなテクニックを扱っている良書という認識です。

事前に手を出しておくことで、知っていることで避けられた実装上の問題について後悔するリスクを減らしたいですね。

人気(あるいは売れなさすぎ？)のせいか発送が1日遅れで、まだ手元に届いていません。

## さらなる高み

<div class="amazlet-box" style="margin-bottom:0px;"><div class="amazlet-image" style="float:left;margin:0px 12px 1px 0px;"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798039799/unplu-22/ref=nosim/" name="amazletlink" target="_blank"><img src="http://ecx.images-amazon.com/images/I/41l4NOjbb8L._SL160_.jpg" alt="iOS Core Data徹底入門" style="border: none;" /></a></div><div class="amazlet-info" style="line-height:120%; margin-bottom: 10px"><div class="amazlet-name" style="margin-bottom:10px;line-height:120%"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798039799/unplu-22/ref=nosim/" name="amazletlink" target="_blank">iOS Core Data徹底入門</a><div class="amazlet-powered-date" style="font-size:80%;margin-top:5px;line-height:120%">posted with <a href="http://www.amazlet.com/" title="amazlet" target="_blank">amazlet</a> at 14.04.10</div></div><div class="amazlet-detail">國居 貴浩 <br />秀和システム <br />売り上げランキング: 19,650<br /></div><div class="amazlet-sub-info" style="float: left;"><div class="amazlet-link" style="margin-top: 5px"><a href="http://www.amazon.co.jp/exec/obidos/ASIN/4798039799/unplu-22/ref=nosim/" name="amazletlink" target="_blank">Amazon.co.jpで詳細を見る</a></div></div></div><div class="amazlet-footer" style="clear: left"></div></div>

iOSの永続層に関する1冊。正直まだ不要なのではないかと思うのですが、作りたいアプリや自分の普段の興味分野から考えると、いずれ必要になる本であることは間違いないです。

Amazonレビューを読んだ感じではちょっと敷居の高そうな本ですが、ぱらぱらとめくった感じではわかりやすそうな印象を受けました。一応初級者向けの本であるということです。

## まとめ

一番最初に紹介した『[テスト自動化入門](http://www.amazon.co.jp/exec/obidos/ASIN/4798040894/unplu-22/ref=nosim/)』は出たばかりということもありまだレビューも少ないですが、割りと推しの1冊でした。
これと『[iPhoneアプリ開発入門ノート](http://www.amazon.co.jp/exec/obidos/ASIN/4800710227/unplu-22/ref=nosim/)』があれば、とりあえず簡単なアプリケーションは開発できるようになるのではないかなと思います。

自分も試行錯誤しながら開発手法を検討していきたいなと思いました。
