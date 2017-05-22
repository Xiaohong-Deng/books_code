# autorun is required to access Minitest::Test
require "minitest/autorun"

class ExampleTest < Minitest::Test
  def test_truth
    assert true
  end
end
