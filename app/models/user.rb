class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :arrive_time, presence: true
  validates :depart_time, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create! row.to_hash
    end
  end
end
