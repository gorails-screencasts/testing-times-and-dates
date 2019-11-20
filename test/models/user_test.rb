require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "created timestamp should be set to the current time" do
    freeze_time
    assert_equal Time.current, User.create.created_at
  end

  test "has 7 day free trial" do
    travel 1.day do
      assert_equal 7.days.from_now, User.create.trial_ends_at
    end
  end

  test "on trial" do
    user = User.create
    assert user.on_trial?
  end

  test "off trial after trial period" do
    user = User.create
    travel_to 14.days.from_now
    assert_not user.on_trial?
  end

  test "stripe trial" do
  end
end
