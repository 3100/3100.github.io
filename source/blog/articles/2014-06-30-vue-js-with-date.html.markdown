---
title: "vue.jsとDate"
published: true
date: 2014-06-30 01:50
comments: true
tags: vue.js, javascript
---

最近[vue.js](http://vuejs.org/)が良いと聞いたので、サンプルサイトを作って遊んでいます。

`vue.js`は所謂ViewModel的なオブジェクトを生成してあげるのですが
そこで管理するデータは`json`で表現できるものでなければなりません。

それで困ったのがjavascriptの`Date`。
そのままDateオブジェクトを管理しようとすると、うまくいきませんでした。

そこで、以下のように一旦ミリ秒(int)として管理して
必要な値を`computed`(必要なときに計算する)として持つようにしました。

~~~coffee
sample = new Vue
  el: '#sample'
  data:
    # うまくいかない
    #date: new Date()
    # 代わりにミリ秒で管理
    dateMs: Date.now()
  computed:
    year: () ->
      new Date(@dateMs).getFullYear()
    month: () ->
      new Date(@dateMs).getMonth() + 1
    ym: () ->
      # これはうまくいかない
      # "#{@year}年#{@month}月"
      date = new Date(@dateMs)
      m = date.getMonth()+1
      if m < 10
        m = '0' + m;
      "#{date.getFullYear()}年#{m}月"
  methods:
    nextMonth: () ->
      date = new Date @dateMs
      date.setMonth(date.getMonth()+1)
      @dateMs = date.getTime()
    prevMonth: () ->
      date = new Date @dateMs
      date.setMonth(date.getMonth()-1)
      @dateMs = date.getTime()
~~~

すごい間抜け感があります。。

[Moment.js](http://momentjs.com/)とか使えばもう少し綺麗になるかもしれないけど
これだけのことに10kb近いライブラリを使いするのもどうかな。。

今回の例に関して言えば、使っているのは年と月だけなので、以下のほうが良かったかもですね。(拡張には弱そう)

~~~coffee
sample = new Vue
  el: '#sample'
  data:
    year: new Date().getFullYear()
    month: new Date().getMonth() + 1
  computed:
    ym: () ->
      "#{@year}年#{@month}月"
  methods:
    nextMonth: () ->
      if @month == 12
        @year += 1
        @month = 1
      else
        @month += 1
    prevMonth: () ->
      if @month == 1
        @year -= 1
        @month = 12
      else
        @month -= 1
~~~

なんかもっとスマートな方法はないものか。。
