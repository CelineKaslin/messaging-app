feature "homepage" do
  scenario "user sees welcoming message" do
    visit('/')
    expect(page).to have_content "Welcome to Messaging World:"
  end

  scenario "Only the 20 first characters of the message are displayed" do
    post_message
    expect(page).to have_content("Hello, how are you t")
    expect(page).not_to have_content("oday ? Do you want to grab a drink tonight ?")
  end

  scenario 'takes you back on the homepage' do
    post_message
    click_link 'Hello, how are you t'
    click_link 'Homepage'
    expect(page).to have_current_path('/')
  end

end
