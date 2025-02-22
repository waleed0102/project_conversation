require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one) # Assuming you have a fixture for users
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should require name" do
    @user.name = nil
    assert_not @user.valid?
  end

  test "should require email" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    assert_not duplicate_user.valid?
  end

  test "should have many comments" do
    assert_respond_to @user, :comments
  end

  test "should have many status histories" do
    assert_respond_to @user, :status_histories
  end
end
