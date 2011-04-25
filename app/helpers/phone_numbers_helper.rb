module PhoneNumbersHelper

  def print_numbers(numbers)
    numbers.collect {|num| num.number }.join(", ")
  end
end
