require "test_helper"

class FirstTest < ActiveSupport::TestCase
    test "Primeiro teste" do
        variavel = "Jorge"

        assert_equal "Jorge", variavel
    end
end