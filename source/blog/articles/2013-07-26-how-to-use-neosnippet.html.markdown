---
title: "NeoSnippetを使ってみた"
published: true
date: 2013-07-26 18:15
comments: true
tags: vim
categories: vim
---
OctopressのCodeblockの構文が結構気持ち悪い感じです。

~~~
{% raw %}
{% codeblock lang:<lang> %}
<content>
{% endcodeblock %}
{% endraw %}
~~~

こんなのを毎回書いていられないので、[Shougo/neosnippet.vim](https://github.com/Shougo/neosnippet.vim)を使ってみました。
インストールや設定については公式のREADMEを参照。

markdown用のスニペットファイルを作成するには、以下のコマンドを実行します。(実際には適当なキーにマッピングしてます。)

```
:NeoSnippetEdit markdown
```

すると、スニペットフォルダにmarkdown.snipが作られるので、ここにスニペットを記述していきます。

今回は3つのスニペットを試しに加えてみました。

* シンプルなCodeblock
* ハイライト用のCodeblock
* ハイパーリンク

~~~vim
{% raw %}
snippet codeblock
abbr cb
alias code cb
options head
    {% codeblock %}
    ${1}
    {% endcodeblock %}

snippet codeblocklang
abbr cbl
alias codel cbl
options head
    {% codeblock lang:${1} %}
    ${2}
    {% endcodeblock %}

snippet hyperlink
abbr hl
alias hl
    [${1:text}](${2:url})
{% endraw %}
~~~

~~~ruby
class hoge
  def initialize
    [1..10].each do |x|
      p x
    end
    p "end"
  end
end
~~~

* ${1}などとあるのは、スニペット展開時に<C-k>(公式設定コピペの場合)を押す度にカーソルが当たる場所です。

これでmarkdownファイルの編集時にcodeなどと入力すると、NeoComplCacheがスニペットを含む候補一覧を表示してくれます。<C-k>(同上)を入力することで展開されます。

Octopressは他にも似たような構文があるので、よく使いそうなものからどんどん追加してこうかと思います。
