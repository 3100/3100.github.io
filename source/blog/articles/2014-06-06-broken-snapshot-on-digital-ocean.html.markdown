---
title: "DigitalOceanのSnapshotが壊れる？"
published: true
date: 2014-06-06 08:30
comments: true
tags: digitalocean
---

## 概要

[DigitalOcean](https://cloud.digitalocean.com/)で
`snapshot`から`droplet`を作ろうとしたら
うまくいっていないというお話。

## 経緯

DigitalOceanで動かしているMinecraftサーバーは
サンフランシスコリージョンにあります。
これをシンガポールに移したらネットワーク遅延が減って、
体感速度も速くならないかな？ということで
実際にスナップショットを取って試してみました。

## 試行1

スナップショットをリージョン転送して
新規にドロップレットを作成するだけの簡単なお仕事、のはず。
しかし、ドロップレット作成最後の15秒で何度やってもエラーとなりました。

もしかして`Power Off`を使うのはダメで、きちんと`shutdown`する必要があるのかな。。

[DigitalOcean - file content disappears after image and new droplet creation - Google グループ](https://groups.google.com/forum/#!topic/packer-tool/bSlP8dELiM)

尚、各処理にかかる時間ですが

* スナップショット作成は使い方にもよるだろうけど、今回は数分で完了。
* サンフランシスコからシンガポールへのスナップショット転送は、30分程度かかる。

## 試行2

今度はきちんとシャットダウンしてからスナップショットを作成し、現在リージョン転送中。

しかし、結果は変わらず。

## 試行3

生成先をサンフランシスコにして試してみた。ら、動きました。
どうやらスナップショットが壊れているわけではなさそうですね。

結局サポートからチケットを作成して、現在質問中。

## 正解(2014/06/18追記)

技術スタッフにイシュー投げとくと言われた後、ずっと放置だったのですが、2週間弱して反応がありました。

~~~
# touch /etc/network.d/ethernet-static
~~~

をしてから、再度スナップショットを作って、試して欲しい、と。

指示どおりに行ったところ、無事dropletの作成に成功しました。
しかし、`ssh`はできないので、Webコンソールから各種ネットワーク設定を見直します。その際には以下の記事が大いに役に立ちました。

[Network Configuration (日本語) - ArchWiki](https://wiki.archlinux.org/index.php/Network_Configuration_(%E6%97%A5%E6%9C%AC%E8%AA%9E))

今回のケースでは、`/etc/conf.d/network@eth0`の中身が古いIPのままだったので、これを最新のものに変更する必要がありました。
netmask値も24から18に変わったり。
このあたりはリージョンによるのか、dropletによるのか、興味深いです。

~~~
# systemctl restart network@eth0
~~~

以上で、無事に外部からも接続できるようになりました。
