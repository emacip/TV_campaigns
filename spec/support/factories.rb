module FactoryHelpers

  def create_valid_ote(attrs = {})
    vote = new_valid_vote(attrs)
    vote.save
  end

  private

  def new_valid_vote(attrs = {})
    Vote.new(attrs)
  end

end


