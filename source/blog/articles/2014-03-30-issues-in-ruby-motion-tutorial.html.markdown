---
title: "RubyMotionのチュートリアルでハマったところ"
published: true
date: 2014-03-30 22:00
comments: true
tags: rubymotion
---

## 概要

[RubyMotion](http://www.rubymotion.com/)の[チュートリアルサイト](http://tutorial.rubymotion.jp/)を進めています。
しかし、チュートリアルが書かれてからだいぶ経つせいか
ところどころハマりそうな部分がありましたので、ここにメモとして残しておきます。

## UILabelの背景色

7章でUILabelにModelの値変更を反映させるのですが、iOS7で変更があったのかどうなのか
指示どおりに作ってもラベルが見えません。

実は背景色が黒になっていることが原因なので、明示的に白を指定することで解決しました。

~~~ ruby
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    #..
    @name_label.backgroundColor = UIColor.whiteColor
    #..
    @email_label.backgroundColor = UIColor.whiteColor
    #..
    @id_label.backgroundColor = UIColor.whiteColor
    #..
~~~

## SpecでUIButtonのtapができない

こちらはよく原因がわからないのですが、8章でコントローラのspecを書く際に、
うまくタップイベントが発生してくれないという問題があります。

~~~ ruby
class ButtonController < UIViewController
  def viewDidLoad
    super

    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.setTitle "Test me title!", forState:UIControlStateNormal
    @button.accessibilityLabel = "Test me!"
    @button.sizeToFit
    @button.addTarget(self, action:'tapped', forControlEvents:UIControlEventTouchUpInside)

    self.view.addSubview @button
  end

  def tapped
    p "I'm tapped!"
    @was_tapped = true
  end
end
~~~

こうしたコントローラを作成し、

~~~ ruby
describe ButtonController do
    tests ButtonController

    it "changes instance variable when button is tapped" do
      tap 'Test me!'
      controller.instance_variable_get("@was_tapped").should == true
    end
  end
~~~

上記のようなspecがあったとします。ここで`rake spec`を実行すると、
controllerに`@was_tapped` がないと言われてしまいます。
(おそらくtapできていないため)

これについてはtwitterで公式アカウント(@RubyMotion)に質問している人もいました。が、解決になってないような。。

<div>
<blockquote class="twitter-tweet" lang="ja"><p><a href="https://twitter.com/gaelian">@gaelian</a> <a href="https://twitter.com/clayallsopp">@clayallsopp</a> <a href="https://twitter.com/alloy">@alloy</a> is working on it, setting app.deployment_target to &quot;6.1&quot; should work around the problem.</p>&mdash; RubyMotion (@RubyMotion) <a href="https://twitter.com/RubyMotion/statuses/409621868178857984">2013, 12月 8</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
</div>

また、PragProgのRubyMotion本に関するフォーラムでもこの問題は指摘されています。

[Pragmatic Forums - Section 6.2 Testing App UI and Controllers problem](http://forums.pragprog.com/forums/279/topics/11365)

いまいち根本的な解決には至っていないようですが、暫定的な対処法としてUIButtonのframeに以下のような設定をすると良いと書かれていました。

~~~ ruby
@button.frame = CGRect.new([10,70], @button.frame.size)
~~~

実際に試すと、本当にこれで問題が解決しました。

## まとめ

RubyMotionは書いていて楽しいですが、あまり情報が多くないためこういったハマりポイントがあると辛そうです。

