require "test_helper"
require 'logger'

class PugCMS::VersionTest < Minitest::Test
  def setup
    @engine = PugCMS::BlogEngine
  end

  def test_that_it_has_a_version_number
    refute_nil PugCMS::VERSION
  end

  def test_posts
    refute_nil @engine.posts
  end

  def test_post
    post = @engine.post('first-post')
    refute_nil post
    assert_equal 'first-post', post.slug
  end

  def test_tags
    refute_nil @engine.tags
  end

  def test_categories
    refute_nil @engine.categories
  end

  def test_authors
    refute_nil @engine.authors
  end

  def test_author
    refute_nil @engine.author("author-one")
  end

  def test_can_set_logger
    @engine.logger= Logger.new(nil)
    @engine.logger = nil
  end

  def test_can_set_base_uri
    @engine.base_uri = "http://youtube.com"
    @engine.base_uri = nil
  end
end
