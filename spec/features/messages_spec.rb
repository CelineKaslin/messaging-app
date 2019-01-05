feature "homepage" do
  scenario "user sees welcoming message" do
    visit('/')
    expect(page).to have_content "Welcome to Messaging World:"
  end

  scenario "Only the 20 first characters of the message are displayed" do
    post_message
    expect(page).to have_content("Hello, how are you to")
    expect(page).not_to have_content("day ? Do you want to grab a drink tonight ?")
  end

  scenario 'takes you back on the homepage' do
    visit('/')
    fill_in :content, with: "Hi, this is my second test"
    click_button 'Submit'
    click_link 'Hi, this is my second'
    click_button 'Homepage'
    expect(page).to have_current_path('/')
  end

  scenario 'takes you back the selected_message page' do
    visit('/')
    fill_in :content, with: "Hi, this is my third test"
    click_button 'Submit'
    click_link 'Hi, this is my second'
    click_button 'Homepage'
    click_link 'Hi, this is my third'
    expect(page).to have_current_path('/selected-message/3')
  end

  scenario 'Edit a message' do
    visit('/')
    fill_in :content, with: 'I have no idea about what to write for this test'
    click_button 'Submit'
    click_link 'I have no idea about'
    click_button 'Edit'
    fill_in :content, with: 'I still have no more idea about what to write'
    click_button 'Submit'
    expect(page).to have_content('I still have no more idea about what to write')
  end

  scenario 'Delete a message' do
    visit('/')
    fill_in :content, with: 'It is the test I will use to delete my message'
    click_button 'Submit'
    click_link 'It is the test I will'
    click_button 'Delete'
    expect(page).not_to have_content('It is the test I will')
  end

end
