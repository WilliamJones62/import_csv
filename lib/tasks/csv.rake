# require "csv"
# can be put in application.rb if csv is to be used in other places in the application. It will be used in the
# User model so it has be put in application.rb
namespace :import do
  task users: :environment do
    # :environment allows access to the User model in the database
    count = 0
    filename = File.join Rails.root, "importcsv.csv"
    CSV.foreach(filename, headers: true) do |row|
      # without headers
      # email, first_name, last_name, arrive_time, depart_time = row
      # user = User.create(email: email, first_name: first_name, last_name: last_name, arrive_time: arrive_time.to_datetime, depart_time: depart_time.to_datetime)
      # with headers that natch table column names
      user = User.create row.to_hash

      if user.errors.any?
        puts "#{user.email} - #{user.errors.full_messages.join(", ")}"
      else
        count += 1
      end
    end
    puts "Imported #{count} Users"
  end
end
