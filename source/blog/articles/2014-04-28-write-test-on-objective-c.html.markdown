---
title: "Objective-cでのテスト: Kiwi"
published: false
date: 2014-04-28 22:00
comments: true
tags: objective-c, tdd, bdd, kiwi
---

## 概要

iOSアプリを開発する際に、テストをどのように書いていけば良いのか調べてみたところ、
デフォルトで`XCTest`が用意されている他、`Kiwi`というBDDフレームワークもあることがわかりました。
その他にも`GHUnit`がありましたが、導入が若干面倒そうだったので、今回はKiwiに触れてみようと思います。

## 導入

Kiwiは`RSpec`風にかけるテストフレームワークです。導入には`CocoaPods`を使用するのが簡単だそうです。

### CocoaPodsの導入

[CocoaPods](http://cocoapods.org/)はRubyでいうところの`Bundler`のようなもので、
各プロジェクトごとに必要なライブラリを管理しやすくします。
あらかじめRubyが必要ですので導入しておきましょう。
[rbenv](https://github.com/sstephenson/rbenv)を利用するのが個人的にはオススメです。

Rubyを導入後、

~~~bash
gem install cocoapods
pod setup
~~~

で導入します。

### Kiwi導入

続いて、目的のXCodeプロジェクトフォルダ内ルートで

~~~bash
pod init
~~~

し、生成された`Podfile`を編集します。

~~~ruby
# Uncomment this line to define a global platform for your project
# platform :ios, "6.0"

target "MyApp" do

end

target "MyAppTests" do
  # ここに追加
  pod "Kiwi"
  pod "Kiwi/XCTest"
end
~~~

Podfileを編集したら

~~~
pod install
~~~

で該当プロジェクトにKiwiを導入します。

### 参考

[Getting Started with Kiwi 2.0 · allending/Kiwi Wiki](https://github.com/allending/Kiwi/wiki/Getting-Started-with-Kiwi-2.0)
