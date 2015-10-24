class Vote < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks


  after_commit on: [:create] do
    __elasticsearch__.index_document
  end


  def as_indexed_json(options={})
    {
        campaign: campaign,
        validity: validity,
        choice: choice
    }
  end

end
