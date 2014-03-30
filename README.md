The website of 3100
----
[![Build Status](https://travis-ci.org/3100/3100.github.io.svg?branch=middleman)](https://travis-ci.org/3100/3100.github.io)

http://3100.github.io

## Environments

* `Ruby 2.0.0`
* `Middleman`

## Setup

~~~
$ git clone git://github.com/3100/3100.github.com.git
$ cd 3100.github.com
$ bundle install
~~~

## Boot

~~~
$ bundle exec middleman server
~~~

## Publish

`middleman` branch is for editing. `master` branch is automatically generated by `Travis CI`.

~~~
$ git commit -am "<message>"
$ git push origin middleman
~~~
