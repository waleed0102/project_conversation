require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:one) # Assuming you have a fixture for comments
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "should require content" do
    @comment.content = nil
    assert_not @comment.valid?
  end

  test "should belong to a project" do
    assert_respond_to @comment, :project
  end

  test "should belong to a user" do
    assert_respond_to @comment, :user
  end
end