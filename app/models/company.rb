class Company < ActiveRecord::Base
  attr_accessible :name

  def foo
    puts "Conflict!"
  end

  include Contact

  validates_presence_of :name
end
