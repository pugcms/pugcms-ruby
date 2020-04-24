require "test_helper"

class PugCMS::VersionTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil PugCMS::VERSION

    engine = PugCMS::BlogEngine.new

    assert engine.posts != nil
    assert engine.tags != nil
    assert engine.categories != nil
    assert engine.authors != nil
  end

  def test_it_does_something_useful
    assert false
  end
end
