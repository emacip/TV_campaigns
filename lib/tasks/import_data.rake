require 'rake'

namespace :vote do
  desc 'Import votes from txt file'
  task :import  => :environment do
    #First delete the current customer table
    Vote.delete_all

    #Import the data from the votes.txt file
    f = File.open("#{Rails.public_path}/votes.txt", "r")
    f.each_line do |line|
      begin
        arr = line.split
        if not arr.nil?
          vote = Vote.new(time_vote: arr[1], campaign: arr[2].split(':')[1],
                          validity: arr[3].split(':')[1], choice: arr[4].split(':')[1])
          puts vote.time_vote.to_s
          vote.save!
        end
      rescue
        puts "error in this row"
      end
    end
    puts "Finish import"
    f.close
  end
end