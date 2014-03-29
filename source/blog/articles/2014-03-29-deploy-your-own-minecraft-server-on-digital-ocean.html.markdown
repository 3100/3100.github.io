---
title: "DigitalOceanにMinecraftサーバを建てる"
published: false
date: 2014-03-29 22:00
comments: true
tags: digitalocean, minecraft
---

![Minecraft画像](/blog/2014/03/29/deploy-your-own-minecraft-server-on-digital-ocean/minecraft.png)

## 概要

急にMinecraftで遊びたくなることがあるのですが、複数PCにデータが散ってしまっていて、どこに目的のワールドがあるのかわかりません。
そこで、これを機にどのマシンからでも同じワールドにアクセスできるようにしようと思いました。

今回は最近お世話になっているDigitalOcean上にMinecraftサーバを構築してみます。契約プランは最安($5/月)です。だいたい5人程度までなら遊べるそうです。

## 手順

### dropletの作成

まずDigitalOceanで新しいdropletを作成します。自分が選択したのは`Arch Linux 2013.05 x64`ですが、
jreが導入できればなんでも良いと思います。

### サーバの初期設定

rootのままではセキュリティ上懸念も多いので、専用ユーザを作ると良いでしょう。

* sshdの設定ファイルを弄ってパスワードログインをやめ、鍵交換方式にする
* sshのポートをデフォルトポートから変更しておく
* 必要なポート以外閉じる

といったことをしておくと良いのではないかと思います。

### jreの導入

大抵のLinuxには公式リポジトリからjreパッケージが利用可能になっているのではないかと思います。

Archの場合は、以下で利用可能です。

~~~
sudo pacman -Sy
sudo pacman -S jre7-openjdk
~~~

### minecraftサーバ用ソフトの導入

サーバ用ファイルは現時点の最新版を利用しました。

[https://s3.amazonaws.com/Minecraft.Download/versions/1.7.5/minecraft_server.1.7.5.jar](https://s3.amazonaws.com/Minecraft.Download/versions/1.7.5/minecraft_server.1.7.5.jar)

上記ファイルを適当なフォルダに配置し、以下のコマンドでMinecraftサーバが起動します。(-d64オプションで64bit版Javaも指定可能)

~~~
java -Xms512M -Xmx512M -jar minecraft_server.1.7.5.jar
~~~

* 最小確保メモリが512MB
* 最大確保メモリも512MB

の設定ですが、構成によって変えて良いと思います。

毎回このコマンドを実行するのは面倒くさいので、適当なshファイルに上記コマンドをコピペします。(たとえばstart_server.sh)

~~~
chmod +x start_server.sh
~~~

これで、start_serverと呼ぶだけでMinecraftサーバが立ち上がるようになりました。

### スワップ領域の作成

DigitalOceanの最小構成プランではこのままだと不安定なので、別途スワップ領域を作成する必要があります。

メモリが不足した場合にSSDを仮想メモリとみなすように設定していきます。/swapfileをスワップ領域として最大512MB確保できるようにします。

~~~
sudo fallocate -l 512M /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
~~~

また、`/etc/fstab`を編集し、以下を追加します。

~~~
/swapfile none  swap  defaults  0 0
~~~

ここまででスワップ領域が利用可能になりました。
このままでも良いですが、メモリが余っている時にスワップ領域を使い続けることはパフォーマンス上あまり嬉しくないので、そのあたりもいい感じに設定します。

~~~
sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50
~~~

## Minecraftサーバ設定

特定ユーザを管理者登録するなどの設定は公式他、日本語の情報がたくさんあるので割愛します。自分は以下のサイトを参考にしました。

[【サルでもわかる！初めてのマインクラフト講座】- サーバ設定 - なす探！](http://nasutan.net/minecraft/server-win/serverproperties/)

## まとめ

意外と簡単にMinecraftサーバを建てることが出来ました。DigitalOceanは転送料制限がある(超えると課金される)ので心配をしていましたが、Minecraftの通信料は気にするほどではなさそうです。

まだ同時接続人数が2人以上を経験していませんが、CPU使用率は30%程度です。参考にした記事にも5人から8人くらいが限度と書かれていましたが、だいたいそのくらいの人数までは遊ぶことができそうです。

$5/月くらいなら仲間うちで割り勘しても良いくらいのコストですし、Minecraftサーバ、結構オススメです。

## 参考

[Host your own Minecraft server for $5/month](http://otoris.com/host-your-own-minecraft-and-mumble-server-for-5month/)

[How to Add a Swap File on an Arch Linux Cloud Server - DigitalOcean](https://www.digitalocean.com/community/articles/how-to-add-a-swap-file-on-an-arch-linux-cloud-server)

