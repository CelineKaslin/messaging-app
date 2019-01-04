DEFAULT_MESSAGE = 'Hello, how are you today ? Do you want to grab a drink tonight ?'
def post_message(msg = DEFAULT_MESSAGE)
  visit('/')
  fill_in :content, with: msg
  click_button 'Submit'
end
