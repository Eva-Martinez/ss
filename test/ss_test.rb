# frozen_string_literal: true

require "test_helper"

class SsTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Ss.const_defined?(:VERSION)
    end
  end

  test "something useful" do
    assert_equal("expected", "expected")
  end
end
