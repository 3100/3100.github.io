---
title: "DigitalOceanがArchの提供をやめるらしい"
published: true
date: 2014-04-13 12:00
comments: true
tags: digitalocean, arch
---

![snap](/blog/2014/04/13/digitalocean-are-deprecating-arch/snapshot.png)

## 概要

[DigitalOcean](https://www.digitalocean.com/)が`Arch`イメージの提供を廃止予定だそうです。その理由ですが

* 使っているユーザがそれほど多くない
* ローリングアップデートに対応する労力を避けない

とのこと。`Arch`の素晴らしさが世間に十分認知されず、とても残念です。

## 私見

個人的には`Docker`が安定すればその上で`Arch`を動かせばいいやと思っているので、すぐ代替先を探そう！とはなりません。が、`Docker 0.10`では`systemd`がうまく動作しない問題があるため、そちらが早く治ってくれるといいなぁ。

* [running systemd inside docker arch container hangs or segfaults · Issue #3629 · dotcloud/docker](https://github.com/dotcloud/docker/issues/3629)

最近は複数の`Docker`コンテナでクラスタを構築できる`CoreOS`も気になってはいるので、そういうものも`DigitalOcean`上で動かしたい欲求があります。

独自イメージのアップロード機能や、`CoreOS`イメージの提供を求める声も多いのですが、その辺もあまり進捗はないみたいですね。

* [Allow Custom Images – Customer Feedback for Digital Ocean](
http://digitalocean.uservoice.com/forums/136585-digitalocean/suggestions/3276477-allow-custom-images)

* [Suport CoreOS as a deployment platform – Customer Feedback for Digital Ocean](http://digitalocean.uservoice.com/forums/136585-digital-ocean/suggestions/4250154-suport-coreos-as-a-deployment-platform)

一時期は`AWS`型の重厚なサービスではなく、`DigitalOcean`のような軽量なサービスこそ次の主流になる、と思っていたのですが、サービス品質や姿勢についてはまだまだこれからかなという印象を抱いています。それでも価格を考えれば良いものを提供していることはわかります。ぜひとも頑張って欲しいです。

それにしても、イメージファイルのメンテや追加ってそんなに大変なのだろうか。もしかすると提供速度やスケールメリットを活かした独自構成がその辺りを犠牲にしているのかもしれないですね。
