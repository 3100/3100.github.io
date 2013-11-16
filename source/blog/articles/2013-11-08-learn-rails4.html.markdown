---
title: "Rails4始めました"
published: false
date: 2013-11-08
comments: true
tags: rails, ruby
categories: rails
---

今まで毛嫌いしてきたけど、Rails4始めました。
参考にしているのは以下のサイトです。

[Ruby on Rails チュートリアル:実例を使って Rails を学ぼう](http://railstutorial.jp/)

以下、個人的なメモ書き。

何はともあれ、まずはインストール。

~~~
$ gem install rails
~~~

新しいプロジェクト。

~~~
$ rails new first_app
~~~

すぐさまの実行。

~~~
$ rails server
~~~

Herokuへのログインと新規プロジェクト作成

~~~
$ heroku login
$ heroku create
~~~

Herokuへのデプロイ(git使用時)

~~~
$ git push heroku master
$ heroku run rake db:migrate
~~~
