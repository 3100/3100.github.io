---
title: "MoinMoin WikiをNginxで動かす"
published: true
date: 2013-11-16
comments: true
tags: moin, nginx
categories: moin
---

さくらVPSで動かしていた[MoinMoin Wiki](http://moinmo.in/)を[DigitalOcean](https://www.digitalocean.com/)に移行することにしました。
これを機に、WebサーバもApacheからNginxに移行しました。

DigitalOceanのdroplet(仮想インスタンス)はArch Linux 64bit版です。とりあえず使うだけなら、512MBで問題ないでしょう。

## MoinMoinのインストール

まずMoinMoinをインストールします。公式サイトからソースを落としてきてもいいですが、
今回は以下のパッケージを利用しました。

[Arch Linux - moinmoin 1.9.7-1 (any)](https://www.archlinux.org/packages/community/any/moinmoin/)

~~~
$ sudo pacman -S moin
~~~

デフォルトのインストール先は/usr/share/moinになります。

## Nginxのインストール

同様にNginxもインストールします。

~~~
$ sudo pacman -S nginx
~~~


## uWSGIのインストール

今回、MoinMoinはWSGIを利用します。
[uWSGI](http://projects.unbit.it/uwsgi/)をNginxと組み合わせることで、MoinMoinをNginx上で動かすことができるようになります。

uWSGIについてもう少し知りたい方は以下のブログ記事が参考になります。

[便利で超強力なWSGIサーバー uWSGI を使ってみよう - 檜山正幸のキマイラ飼育記](http://d.hatena.ne.jp/m-hiyama/20120312/1331513519)

話を戻して、uWSGIをインストールします。

~~~
$ sudo pacman -S uwsgi uwsgi-plugin-python
~~~

## 設定

### uWSGI

まず、uWSGIの設定を行います。uWSGIはini、xml、json等の形式で設定ファイルを記述できますが、今回はini形式で書きました。
/etc/uwsgi/moin.iniに下記のような設定を記述しています。

~~~ini
[uwsgi]
plugins = python2
ignore-script-name
processes = 4
limit-as = 256
wsgi-file = /usr/share/moin/server/moin.wsgi
socket = /tmp/moin.sock
chmod-socket = 777
~~~

chmod-socketのパーミションを777にしているのは、実行時にパーミションエラーが発生したためです。。
もし、より良い解決法がある場合は、教えていただけると幸いです。

この設定をもとにuwsgiを立ち上げます。

~~~
$ sudo systemctl enable uwsgi@moin.service
$ sudo systemctl start uwsgi@moin.service
~~~

### Nginx

続いて、Nginxの設定です。/etc/nginx/nginx.confを編集します。

~~~nginx
location / {
    include uwsgi_params;
    uwsgi_modifier1 30;
    uwsgi_pass unix:/tmp/moin.sock;
}

location /moin_static197/ {
    alias /usr/share/moin/htdocs;
}
~~~

実際にはExpiresやCache-Control、Gzipなどの設定も必要でしょうが、とりあえず動かすだけならこれでよいと思います。

以下で、サービスを開始できるようになります。

~~~
$ sudo systemctl enable nginx
$ sudo systemctl start nginx
~~~

### MoinMoin

あとはMoinMoinの設定をお好みに応じて変更するだけです。

/usr/share/moin/config/wikiconfig.pyを編集します。

とりあえず、以下だけ修正しておけば良いのではないでしょうか。

~~~python
sitename = u'Your Wiki'
log_reverse_dns_lookups = False
tz_offset = 9.0
~~~

以下のページも読むと、どういったことを設定可能かわかりやすいでしょう。

[HelpOnConfiguration - MoinMoin](http://moinmo.in/HelpOnConfiguration)

wikiconfig.pyを編集した場合は、uwsgiを再起動することで、反映されます。

## おわり

ここまでで、無事にMoinMoinが立ち上がっていることと思います。
最初のLanguageSetupを行うために、ユーザ登録をして、
そのユーザ名をwikiconfig.pyに登録して、uwsgiを再起動することになります。

LanguageSetupも完了すれば、あとはMoinMoinを好きに弄っていくだけです！

尚、初期状態ではMoinの検索エンジンは遅いので、Xapianを導入するのも良いでしょう。
これについてもそのうち記事を書きたいと思います。

お疲れ様でした。
