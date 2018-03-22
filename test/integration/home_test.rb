class HomeTest < ActionDispatch::IntegrationTest
  test 'submits registration form' do
    visit root_path
    within '.registration-form' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: Faker::Internet.email
      page.find('.register-button').trigger 'click'
    end

    assert page.has_content?('Thank you'), "Should show success message"
  end

  test 'displays form errors' do
    visit root_path
    within '.registration-form' do
      page.find('.register-button').trigger 'click'
    end

    assert page.has_selector?('.registration-form .error.notice'),
           "Should show errors"
  end
end
