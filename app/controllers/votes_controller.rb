class VotesController < ApplicationController
  def index
    @campaignes =  Vote.all.map(&:campaign).uniq
  end

  def show
    @votes = (Vote.search query:{match: {campaign: params[:name]}},size: 12965)
    candidates = @votes.map(&:choice).uniq
    results = candidates.inject({}) do |hash, candidate|
      hash[candidate] = {}
      hash[candidate] = {"score" => query_by_scores(params[:name], candidate).count , "not_score" => query_by_not_scores(params[:name], candidate).count}
      hash
    end
    byebug
    adsads
  end

  private

  def query_by_scores(campaign, candidate)
    Vote.search(query:{
      bool: {
        must: [
            { match: { campaign: campaign }},
            { match: { choice: candidate }},
            { match: { validity: "during"  }}
        ]
      }
    },size: 12965)
  end

  def query_by_not_scores(campaign, candidate)
    Vote.search(query:{
        bool: {
            must: [
                { match: { campaign: campaign }},
                { match: { choice: candidate }}
            ],
            must_not:[{ match: { validity: "during"  }}]
        }
    },size: 12965)
  end

end
