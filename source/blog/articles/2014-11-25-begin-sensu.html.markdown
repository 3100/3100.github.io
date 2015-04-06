---
title: "Sensuを導入してみる"
published: false
date: 2014-11-25 22:00
comments: true
tags: sensu
---
## 導入

`Sensu`は各コンポーネント間の通信に`SSL`を用いることを推奨しているようです。

まず`openssl`が入っていることを確認します。

~~~shell
$ which openssl
/usr/bin/openssl
$ openssl version
OpenSSL 0.9.8za 5 Jun 2014
~~~

`OSX`標準のOpenSSLって0.9.8系なんですね。1.0系じゃないのか。

続いて、認証局を作成し、証明書を生成します。

~~~shell
$ cd /tmp
$ wget http://sensuapp.org/docs/0.16/tools/ssl_certs.tar
$ tar -xvf ssl_certs.tar
$ cd ssl_certs
$ ./ssl_certs.sh generate
Generating SSL certificates for Sensu ...
Generating a 2048 bit RSA private key
...............+++
................+++
writing new private key to './private/cakey.pem'
-----
Generating RSA private key, 2048 bit long modulus
............................+++
.....................................................................................+++
e is 65537 (0x10001)
Using configuration from openssl.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
commonName            :PRINTABLE:'sensu'
organizationName      :PRINTABLE:'server'
Certificate is to be certified until Nov 24 13:29:20 2019 GMT (1825 days)

Write out database with 1 new entries
Data Base Updated
Generating RSA private key, 2048 bit long modulus
..........................+++
..............................................................+++
e is 65537 (0x10001)
Using configuration from openssl.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
commonName            :PRINTABLE:'sensu'
organizationName      :PRINTABLE:'client'
Certificate is to be certified until Nov 24 13:29:20 2019 GMT (1825 days)

Write out database with 1 new entries
Data Base Updated
~~~

本当は確固の接続毎に異なる証明書を用意して、個別に認証／解除できるのが望ましいのですが
現時点ではそうなっていないということです。

[SSL Client certificates · Issue #434 · sensu/sensu](https://github.com/sensu/sensu/issues/434)

[SSL certificates - Sensu](http://sensuapp.org/docs/0.16/certificates)

## RabbitMQの導入

`RabbitMQ`はいわゆるMQの1つです。MQは最近の分散環境ではよく使われる仕組みですね。
同期プログラミングのような制御をせずともデータを送りっぱなしにできるので、
実装がシンプルになりますし、データも遅延こそあれど確実に届きます。

さて、`OS X`で`Homebrew`が導入済みなら簡単そうです。

~~~
brew update
brew install rabbitmq
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/rabbitmq-3.4.1.yosemite.bottle.tar.gz
######################################################################## 100.0%
==> Pouring rabbitmq-3.4.1.yosemite.bottle.tar.gz
==> Caveats
Management Plugin enabled by default at http://localhost:15672

Bash completion has been installed to:
  /usr/local/etc/bash_completion.d

To have launchd start rabbitmq at login:
    ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents
Then to load rabbitmq now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
Or, if you don't want/need launchctl, you can just run:
    rabbitmq-server

WARNING: launchctl will fail when run under tmux.
==> Summary
🍺  /usr/local/Cellar/rabbitmq/3.4.1: 1031 files, 27M
~~~

なんか`tmux`関連の警告が出ていますが、とりあえずは気にしないでおきます。。

それ以外の環境については公式を参照ですね。

[RabbitMQ - Downloading and Installing RabbitMQ](https://www.rabbitmq.com/download.html)

## Redisの導入

こちらもHomebrewで導入が可能です。

~~~shell
$ brew install redis
==> Downloading http://download.redis.io/releases/redis-2.8.17.tar.gz
######################################################################## 100.0%
==> make -C /private/tmp/redis-wPsi2r/redis-2.8.17/src CC=clang
==> Caveats
To have launchd start redis at login:
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
Then to load redis now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
Or, if you don't want/need launchctl, you can just run:
    redis-server /usr/local/etc/redis.conf

WARNING: launchctl will fail when run under tmux.
==> Summary
🍺  /usr/local/Cellar/redis/2.8.17: 10 files, 1.4M, built in 15 seconds
~~~

