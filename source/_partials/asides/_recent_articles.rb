article#recent_articles
  h3 Recent Articles
  ul
    - blog.articles[0...5].each do |article|
      li
        = link_to article.title, article
        = partial "date", locals: {date: article.date}

