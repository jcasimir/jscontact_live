class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :contact_type, :contact_id

  belongs_to :contact, :polymorphic => true

  validates_presence_of :number
  validates_numericality_of :number

  def self.new_from_params(params)
    if params[:person_id]
      contact = Person.find params[:person_id]
    elsif params[:company_id]
      contact = Company.find params[:company_id]
    else
      raise "Leave."
    end
    phone_number = contact.phone_numbers.new
    phone_number.number = params[:number] if params[:number]
    phone_number
  end
end
