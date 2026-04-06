class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def to_s
    token
  end
end
