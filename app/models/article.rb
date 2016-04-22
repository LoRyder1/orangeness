class Article < ActiveRecord::Base
  # attr_accessible :title

  has_many :comments
  validates :title, presence: true, length: {minimum: 5}
  # validate :ensure_slug_uniqueness


  def slug
    title.downcase.gsub(" ", "-")
  end

  def to_param
    "#{id}-#{slug}"
  end

  protected

  # validate
  def ensure_slug_uniqueness
    
    # we also wnat to ensure teh slug is not blank
    if self.slug.blank?
      errors.add(:slug, "can't be blank")
    end

    # if this is a new article, the id is nil
    # otherwise, the slug should point to this article's id
    unless Slug[self.slug].nil? || Slug[self.slug] == self.id.to_s
      errors.add(:slug, "is already taken")
    end
  end
end
