class VotesController < ApplicationController
  def index
    @campaignes =  Vote.all.map(&:campaign).uniq
  end
end
