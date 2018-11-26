class OneWeekUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.one_week_email(user).deliver_later
  end
end
