class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :time_vote
      t.string  :campaign
      t.string  :validity
      t.string  :choice
      t.timestamps
    end
  end
end
