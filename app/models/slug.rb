class Slug
  class << self

    def [](slug)
      redis.hget(hash, slug)
    end

    def []=(slug, id)
      if old = self[slug]
        redis.srem(set(old), slug)
      end
      redis.hset(hash, slug, id)
      redis.sadd(set(id), slug)
    end

    private

    def redis
      $redis
    end

    def hash
      "article_ids"
    end
  end
end