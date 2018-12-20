class Message

  attr_reader :content, :time, :id

  def initialize(content, id = 0)
    @content = content
    @time = Time.now
    @id = id
  end
end
