class Player
  attr_reader :token

  def initialize(t)
    @token = t
  end

  def to_s
    token
  end
end