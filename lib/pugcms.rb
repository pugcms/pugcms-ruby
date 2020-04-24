require 'pugcms/version'
require 'httparty'

module PugCMS
  class BlogEngine
    include HTTParty

    def initialize(url=nil)
      self.class.base_uri(url || 'http://localhost:3000/api/v1')
    end

    def posts
      self.class.get('/blog_posts')
    end

    def authors
      self.class.get('/blog_authors')
    end

    def tags
      self.class.get('/blog_tags')
    end

    def categories
      self.class.get('/blog_categories')
    end
  end
end
