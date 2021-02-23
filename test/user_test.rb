require "test_helper"

class UserTest < ActiveSupport::TestCase
    test "Nome é obrigatório" do
       user = User.new(name: nil)

       user.save

       assert user.errors[:name].any?
    end

    test "email é obrigatório e no formato válido" do
        user = User.new(name: nil)
        user.save
        assert user.errors[:name].any?

        user = User.new(email: "invalido")
        user.save
        assert user.errors[:email].any?

        user = User.new(email: "valido@exemplo.com")
        user.save

        refute user.errors[:email].any?
     end

     test "email é unico" do
        user = User.create!(name: "Darth", email: "vader@imperio.com", password: "secret", password_confirmation: "secret")

        other_user = User.create(email: "vader@imperio.com")
        
        assert other_user.errors[:email].any?
     end
end