require "test_helper"

class PugCMS::VersionTest < Minitest::Test
  def setup
    @engine = PugCMS::BlogEngine.new
  end

  def test_that_it_has_a_version_number
    refute_nil PugCMS::VERSION
  end

  def test_posts
    assert @engine.posts != nil
  end

  def test_tags
    assert @engine.tags != nil
  end

  def test_categories
    assert @engine.categories != nil
  end

  def test_authors
    assert @engine.authors != nil
  end
end
