require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = projects(:one) # Assuming you have a fixture for projects
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "should require status" do
    @project.status = nil
    assert_not @project.valid?
  end

  test "should include valid statuses" do
    valid_statuses = Project.statuses.keys
    valid_statuses.each do |status|
      @project.status = status
      assert @project.valid?, "#{status} should be a valid status"
    end
  end

  test "should have many comments" do
    assert_respond_to @project, :comments
  end

  test "should have many status histories" do
    assert_respond_to @project, :status_histories
  end
end
