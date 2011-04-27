class Company < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  include Contact

  validates_presence_of :name
end
