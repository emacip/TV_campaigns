class VotesImporter
  include Sidekiq::Worker
  sidekiq_options  queue: :votes

  def perform(arr)
    vote = Vote.new(time_vote: arr[1], campaign: arr[2].split(':')[1],
                    validity: arr[3].split(':')[1], choice: arr[4].split(':')[1])
    vote.save!
    return vote
  end

end