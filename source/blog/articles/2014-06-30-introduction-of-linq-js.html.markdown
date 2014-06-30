---
title: "linq.jsを触ってみた"
published: true
date: 2014-06-30 21:36
comments: true
tags: javascript, linq.js
---

## 概要

[linq.js](http://linqjs.codeplex.com/)という、データを汎用的に処理するクエリ機能を試してみました。

## 前置き

先日から`vue.js`という`MVVM`ライクな実装を可能にするライブラリを触っています。
`MVVM`といえば`Silverlight`や`WPF`。
元々Microsoftが流行らせようとしたパターンです。

そのMicrosoftが開発したもう1つの便利ツールがあります。

`LINQ`です。
あまりご存知でない方のために簡単に説明しますと、データの形態を気にせずに、汎用的に使えることを目指した強力なクエリ機能です。

[統合言語クエリ (LINQ: Language-Integrated Query)](http://msdn.microsoft.com/ja-jp/library/bb397926.aspx)

この`LINQ`、`C#`や`VisualBasic`向けなんですが、
有志が雰囲気そのままに`JavaScript`へ移植していることは以前から知っていました。

今回`MVVM`もやるんだし、ちょうど良い機会だろうということで実際に触ってみることにしました。


## 導入方法

* //cdnjs.cloudflare.com/ajax/libs/linq.js/2.2.0.2/jquery.linq.min.js
* //cdnjs.cloudflare.com/ajax/libs/linq.js/2.2.0.2/linq.min.js

上記2ライブラリを組み込むのがとりあえず触るには簡単かと思います。

---

## 使い方


### JSON

~~~coffee
demo = Enumerable.From(json)
  .Where((x) -> isSameMonth(date, new Date(x.date)))
  .Where((x) -> checkedMenu.indexOf(x.menu) >= 0)
  .Select((x) -> x.name)
  .ToArray()
~~~

* `Enumerable.From()`で`json`形式のオブジェクトを取り込むことが出来ます。
* `Where()`は条件節。該当するデータのみ次へ送ります。
* `Select()`は出力対象を指定します。
* `ToArray()`で実際に処理が実行されます。`LINQ`は遅延処理

### DOM

~~~coffee
checked = $("input[id^=check]").toEnumerable()
  .Where("$.attr('checked') == 'checked'")
  .ToArray()
~~~

* `toEnumerable()`で`jQuery`のセレクタを取り込めます。
* `Where()`の中のような表現で書くことも出来ます。

### 注意点: クエリは遅延実行

上にもさらっと書きましたが、`LINQ`は実行されるまではただのクエリです。

`ToArray()`などで呼び出すことで、実際に処理が行われます。

~~~coffee
# ただのクエリ。処理はまだ行われない
query = Enumerable.From(json)
  .Where((x) -> x.price >= 500)

# ここで初めて処理が実行される
arr = query.ToArray()

# やはり、まだ処理は行われない
query2 = query.OrderBy((x) -> x.price)

arr2 = query2.Select((x) -> { name: x.name, price: x.price })
         .ToArray() # ここで処理が行われる
~~~

---

## クエリの種類

その数なんと90種類！
`LINQ`にあるものは大抵用意されているようです。独自のものもあります。

少しだけ紹介します。

### GroupBy

~~~coffee
Enumerable.From(json)
  .GroupBy("$.menu", null,
    "{ y: $$.Count(), name: $}")
  .ToArray()
~~~

`GroupBy()`は集計用によく用いられる関数です。

* 第1引数はキー
* 第2引数は中間データを加工する際に使用？
* 第3引数で出力データを指定。`$$`は集計関数用

### Join

~~~coffee
Enumerable.From(jsonA)
  .Join(jsonB, "$.id", "$.id", "{idA: $.id, valA: $.val, valB: $$.val}")
  .ToArray()
~~~

2つのデータを紐付けする関数です。

* 第1引数に別データ
* 第2引数と第3引数にキー
* 第4引数に出力形式。`$$`は2番めのデータ。

### OrderBy

~~~coffee
Enumerable.From(json)
  .OrderByDescending("$.y")
  .ToArray()
~~~

これはわかりますよね。順序付けを行う関数です。`OrderByDescending()`は降順。

### Take

~~~coffee
Enumerable.From(json)
  .Take(10)
  .ToArray()
~~~

先頭から指定件数だけ取得する関数です。

### その他

公式サイトにもサンプルがあるので、そちらもどうぞ。

[http://linqjs.codeplex.com/wikipage?title=linq.js%20Samples](http://linqjs.codeplex.com/wikipage?title=linq.js%20Samples)

## 感想

さらっと上辺をなぞっただけですが、いかがでしたでしょうか。
`JavaScript`上でのデータ操作や集計が、とても簡単になりそうな印象を受けました。
`LINQ`自体に慣れ親しんでいる方からすると、
割りと直感的に使えるのではないかと思います。

`linq.js`、なかなかオススメです。
