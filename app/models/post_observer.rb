class PostObserver
  def after_save(post)
    Slug[article.slug] = article.id.to_s
    return true
  end
end