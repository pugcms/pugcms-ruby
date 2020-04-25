require 'pugcms/version'
require 'httparty'

module PugCMS
  class BlogEngine
    class << self
      attr_accessor :base_uri
      attr_accessor :logger
    end

    def self.logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = "PugCMS"
      end
    end

    def self.base_uri
      @base_uri ||= "http://localhost:3000/api/v1"
    end

    # TODO: Add caching here
    def self.get(path)
      full_path = self.base_uri + "/" + path

      self.logger.debug(full_path)
      result = HTTParty.get(full_path)

      if result.code == 200
        JSON.parse(result.body, object_class: OpenStruct)
      else
        raise ArgumentError, "Error de-serializing result from #{full_path}"
      end
    end

    def self.posts
      self.get('/blog_posts')
    end

    def self.post(slug)
      self.get("/blog_posts/#{slug}")
    end

    def self.authors
      self.get('/blog_authors')
    end

    def self.author(slug)
      self.get("/blog_authors/#{slug}")
    end

    def self.tags
      self.get('/blog_tags')
    end

    def self.categories
      self.get('/blog_categories')
    end
  end
end
