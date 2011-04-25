class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :person_id

  belongs_to :person

  validates_presence_of :number
  validates_numericality_of :number

  #validates_format_of :number, :with => /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
  #validates_format_of :number, :with => /^[0-9]*/

end
