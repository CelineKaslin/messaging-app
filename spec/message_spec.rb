require 'message'

describe Message do

  it "should create  message " do
    m = Message.create(content: "Hello")
    expect(m.content).to eq("Hello")
  end

end
