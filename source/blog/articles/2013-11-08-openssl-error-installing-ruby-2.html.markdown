---
title: "rbenvでruby2.0を入れようとするとOpensslのエラーが出る"
published: true
date: 2013-11-08
comments: true
tags: ruby, os x, rbenv
categories: ruby
---
Marvericksを入れた後のMacでrbenvからRuby2.0を入れようとするとエラーになってしまいました。

~~~
$ gem install 2.0.0-p0
Downloading ruby-2.0.0-p0.tar.gz...
-> http://dqw8nmjcqpjn7.cloudfront.net/50d307c4dc9297ae59952527be4e755d
Installing ruby-2.0.0-p0...

BUILD FAILED

Inspect or clean up the working tree at /var/folders/8h/mdr7s3ns64sfnscg5c4h2w0c0000gn/T/ruby-build.20131108212415.26000
Results logged to /var/folders/8h/mdr7s3ns64sfnscg5c4h2w0c0000gn/T/ruby-build.20131108212415.26000.log

Last 10 log lines:
installing default gems:      /Users/zero/.rbenv/versions/2.0.0-p0/lib/ruby/gems/2.0.0 (build_info, cache, doc, gems, specifications)
                              bigdecimal 1.2.0
                              io-console 0.4.2
                              json 1.7.7
                              minitest 4.3.2
                              psych 2.0.0
                              rake 0.9.6
                              rdoc 4.0.0
                              test-unit 2.0.0.0
The Ruby openssl extension was not compiled. Missing the OpenSSL lib?
~~~

調べるとドンピシャな解答がStack Overflowにありました。

~~~
$ CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl`" rbenv install 2.0.0-p0
~~~

もちろん、openssl自体がインストールされていない環境ではあらかじめインストールしておく必要があります。Homebrewを利用しているなら

~~~
$ brew install openssl
~~~

ですね。

[homebrew - OpenSSL error installing ruby 2.0.0-p195 on Mac with rbenv - Stack Overflow](http://stackoverflow.com/questions/17181075/openssl-error-installing-ruby-2-0-0-p195-on-mac-with-rbenv)
