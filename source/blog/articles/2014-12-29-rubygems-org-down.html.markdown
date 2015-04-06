---
title: "rubygems.orgが正常に動いていない場合"
published: false
date: 2014-12-29 01:00
comments: true
tags: ruby, gems
---

要するに以下の質問への自分的なメモ。

[ruby - rubygems.orgにつながらない時 - スタック・オーバーフロー](http://ja.stackoverflow.com/questions/2750/rubygems-org%e3%81%ab%e3%81%a4%e3%81%aa%e3%81%8c%e3%82%89%e3%81%aa%e3%81%84%e6%99%82#2754)

## bundlerでの対応

上記質問への@kleafさんの回答のように`Gemfile`の`source`を変更するのが良い。候補は

* https://s3.amazonaws.com/production.s3.rubygems.org
* http://production.cf.rubygems.org

[tokyo-m.rubygems.org が落ちていて rubygems がインストールできない。 - Qiita](http://qiita.com/Dominion525/items/f4614f34eb2d868bdeeb)

でそれぞれ名前のあがっているミラーリポジトリですね。

## gemでの対応

`bundler`を導入する前だったり、全体として導入したい`gem`の場合には`gem install`したい。
その場合、`gem sources`でまず`rubygems.org`を削除してから、ミラーリポジトリを追加する。(手順は前後してもOK)

~~~
$ gem sources -r https://rubygems.org/
$ gem sources -a https://s3.amazonaws.com/production.s3.rubygems.org
~~~

[Command Reference - RubyGems Guides](http://guides.rubygems.org/command-reference/#gem-sources)
