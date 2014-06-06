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

