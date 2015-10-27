require 'spec_helper'

describe 'import votes' do


  it 'scenario #1 import correct string' do
    str = "VOTE 1168123287 Campaign:ssss_uk_02A Validity:during Choice:Antony CONN:MIG01XU MSISDN:00777779989999 GUID:029DBA7C-26E7-4F82-BAE9-2DEC2C665F6B Shortcode:63334"
    vote =  VotesImporter.new.perform(str.split)
    expect(vote.time_vote).to eq(1168123287)
  end

  it 'scenario #2 import incorrect string' do
    str= "VOTE 1168123287 Campaign:ssss_uk_02A Validity:during Choice:Antony CONN:MIG01XU MSISDN:00777779989999 GUID:029DBA7C-26E7-4F82-BAE9-2DEC2C665F6B Shortcode:63334�"
    vote =  VotesImporter.new.perform(str.split)
    expect(vote.time_vote).to eq(1168123287)
  end

end