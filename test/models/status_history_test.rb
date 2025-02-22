require "test_helper"

class StatusHistoryTest < ActiveSupport::TestCase
  def setup
    @status_history = status_histories(:one) # Assuming you have a fixture for status histories
  end

  test "should be valid" do
    assert @status_history.valid?
  end

  test "should require old and new status" do
    @status_history.old_status = nil
    assert_not @status_history.valid?
    @status_history.new_status = nil
    assert_not @status_history.valid?
  end

  test "should include valid old and new statuses" do
    valid_old_statuses = StatusHistory.old_statuses.keys
    valid_new_statuses = StatusHistory.new_statuses.keys

    valid_old_statuses.each do |status|
      @status_history.old_status = status
      assert @status_history.valid?, "#{status} should be a valid old_status"
    end

    valid_new_statuses.each do |status|
      @status_history.new_status = status
      assert @status_history.valid?, "#{status} should be a valid new_status"
    end
  end

  test "should belong to a project" do
    assert_respond_to @status_history, :project
  end

  test "should belong to a user" do
    assert_respond_to @status_history, :user
  end
end
