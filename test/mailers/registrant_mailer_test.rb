require 'test_helper'

class RegistrantMailerTest < ActionMailer::TestCase
  setup do
    @registrant = FactoryGirl.create(:registrant)
  end

  test "welcome" do
    email = RegistrantMailer.welcome_email(@registrant).deliver
    assert ActionMailer::Base.deliveries.any?
  end

  test "registrant_info" do
    email = RegistrantMailer.registrant_info(@registrant).deliver
    assert ActionMailer::Base.deliveries.any?
  end
end
