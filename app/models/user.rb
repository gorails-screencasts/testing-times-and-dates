class User < ApplicationRecord
  before_create do
    self.trial_ends_at = 7.days.from_now
  end

  def on_trial?
    Time.current < trial_ends_at
  end
end
