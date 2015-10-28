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
      rescue
        puts "error in this row"
      end

      if  !arr.nil? && arr.first == "VOTE"
        VotesImporter.perform_async(arr)
        puts line
      end
    end
    puts "Finish import"
    f.close
  end
end