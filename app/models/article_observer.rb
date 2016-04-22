class ArticleObserver
  def after_save(post)
    Slug[article.slug] = article.id
    return true
  end

  def after_destroy(post)
    Slug.destroy(post.id)
    return true
  end
end