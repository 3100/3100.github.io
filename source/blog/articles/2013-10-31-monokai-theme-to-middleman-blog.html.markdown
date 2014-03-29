---
title: "middleman-blogのハイライトにMonokaiテーマを使う"
published: true
date: 2013-10-31
comments: true
tags: middleman, monokai
categories: middleman
---
middleman-blogには、コードをシンタックスハイライトする機能があります。
middleman-syntaxをGemfileに加えて、必要な設定をconfig.rbに書くだけです。

[middleman/middleman-syntax](https://github.com/middleman/middleman-syntax)

kramdownを使う場合は

~~~ ruby
set :markdown_engine, :kramdown
~~~

redcarpetなら

~~~ ruby
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
~~~

ですかね。

middleman-syntaxは内部でrougeというruby製pygmentsを目指しているハイライトパーサを使用しています。

[jayferd/rouge](https://github.com/jayferd/rouge)

これを利用して、rougeに用意されているハイライトテーマを利用することができるようです。具体的には

* ThankfulEyes
* Colorful
* Github
* Base16
* Base16::Solarized (Octopress風らしいです)
* Base16::Monokai

があります。(Base16::Monokaiは基本色を使っているせいか？地味です。。)

これをmiddlemanで利用するには、stylesheets/highlight.css.erbなどというcss生成ファイルを作って以下のように書き込み

~~~ ruby
<%= Rouge::Themes::Github.render(:scope => '.highlight') %>
~~~

あとはHTML上でhighlight.cssを読み込むようにします。

### ところで(割りと無駄話)

ざっと見た感じ、あまりいい感じのハイライトが見つかりません。
そこで、pygments-cssを参考にして作ったMonokaiをrougeに加えてもらいました。
何気に内輪じゃないOSSへは初のプルリクでしたが、無事取り込まれました。

まだ、gemには反映されていなので、middleman-syntaxをフォークして中のGemfileを修正する必要があります。

~~~ ruby
gem "rouge", :git => "git://github.com/jayferd/rouge.git"
~~~

これをさらに、middlemanのGemfileで指定します。

~~~ ruby
gem "middleman-syntax", :git => "git://github.com/<あなたのid>/middleman-syntax.git"
~~~

あとはbundle updateすれば良いはずです。これで無事Monokaiを使えるようになりました。

~~~ ruby
<%= Rouge::Themes::Monokai.render(:scope => '.highlight') %>
~~~

### もっとシンプルな方法

実はmiddleman-syntaxはpygments用cssファイルを取り込めるらしいです。
ですので、stylesheets/highlight.css.erbを作る代わりに、
目的のテーマ用cssを直接HTMLから指定するだけで済むようです。

試してはいませんが、monokai.cssというものも見つかりました。若干直せば使えそうに見えます。

[pygments-css/monokai.css at master · richleland/pygments-css](https://github.com/richleland/pygments-css/blob/master/monokai.css)

### というわけで

以下、Monokaiのサンプルになります。

~~~ ruby
# The Greeter class
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "Hello #{@name}!"
  end
end

# Create a new object
g = Greeter.new("world")

# Output "Hello World!"
g.salute
~~~

Happy highlighting!

### 余談

元々SublimeText2風のテーマが欲しくてMonokaiに辿り着いたのですが、
よく見ると色パレットは似ていても配色パターンが違いますね。。
個人的にはhighlight.jsのmonokaiがST2っぽいなと思っています。
これは、ST2風も作るべきか。。
