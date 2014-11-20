---
title: "Arch LinuxからODBC経由でMS SQLServerにアクセスする"
published: true
date: 2014-11-20 16:00
comments: true
tags: arch, odbc, r, sql server
categories:
---
# 概要

今の仕事では
データを格納しているDBが`Microsoft SQL Server`(以下SQLServer)というのが主な理由で
`R`スクリプトの実装をWindows上で行っています。
(`R`とSQLServerの連携自体は`ODBC`を利用しています。)

しかし、`cygwin`にだんだん嫌気が差してきたので
`arch`でODBCの設定を行い、
各スクリプトをarch上で使えるようにしてみました。

SQLServer 2012で検証していますが、それ以外でも大丈夫かと思います。

# ODBCの準備

まず`FreeTDS`というライブラリを導入します。
これはSQLServerやSybaseなどと通信するためのライブラリ群です。

~~~
# pacman -S freetds
~~~

# ODBCの設定

続いて、設定ファイルの編集してきます。

/etc/odbcinst.ini

~~~
[FreeTDS]
Driver      = /usr/lib/libtdsodbc.so
UsageCount  = 1
~~~

/etc/odbc.ini

~~~
[your_server_name]
Driver      = FreeTDS
Servername  = your_server_name
Database    = your_db_name
~~~

/etc/freetds/freetds.conf

~~~
[your_server_name]
host            = xxx.xxx.xxx.xxx # Host name or IP
port            = xxxxx           # Default: 1433
tds version     = 7.1
client charset  = UTF-8
~~~

# 接続テスト

Rのスクリプト例です。
`RODBC`パッケージを使って接続するのが簡単でしょうか。

もちろん、他の言語からも利用可能なはずです。

~~~r
# your_server_name: ODBCの設定名(上と同じ名前)
# user: ユーザ名
# password: パスワード
# library(RODBC)
sql <- 'SELECT column1, column2 FROM your_db.dbo.table1'
con <- odbcConnect(your_server_name, user, password)
df <- as.data.frame(sqlQuery(con, sql))
odbcClose(con)
~~~

エラーが出る場合などは

~~~r
options(error = recover)
~~~

などで追い詰めると良いかもです。

# 参考

[Odbc - ArchWiki](https://wiki.archlinux.org/index.php/odbc)
