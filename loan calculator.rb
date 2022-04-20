# Mortgage/Car Loan Calculator
# mortgage formula:
# M = P * (J / (1 - (1 + J) ** (-N)))

def prompt(message)
  puts "#{message}"
end

def invalid
  puts "Invalid input. Please enter a positive number."
end

def loan_size_check(user_entry_loan)
  user_entry_loan > 0 && user_entry_loan <= 1000000
end 

# Main game loop #
loop do

loan_length_in_years = 0
apr = 0
loan_size = 0
monthly_payment = 0

loop do
  prompt("What is the duration of the loan (in years)")
  loan_length_in_years = gets.chomp.to_i
  break if loan_length_in_years.positive?
  invalid
end

loop do
  prompt("what is the APR rate")
  prompt("for 5% enter '5', for 1.5% enter '1.5'")
  apr = gets.chomp
  break if apr.to_i > 0
  invalid
end
 
apr = apr.to_f / 100

loop do
  prompt("What is the size of the loan?")
  loan_size = gets.chomp.to_i
  break if loan_size_check(loan_size)
  prompt("Invalid input. Please enter a positive number less then 1000000")
end


loan_length_in_months = loan_length_in_years * 12
monthly_interest_rate = apr / 12

monthly_payment = loan_size * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_length_in_months)))
interest = (monthly_payment * loan_length_in_months) - loan_size

prompt("Result! Your loan will last for #{loan_length_in_years} years or #{loan_length_in_months} in months. The
monthly payment will be £#{monthly_payment.round(2)} per month.") 
prompt("You will pay a total of £#{interest.round(2)} in interest!")

response = ''

loop do
prompt("Would you like to run the loan calculator again? (Yes or No)")
response = gets.chomp.downcase
break if ["y", "n", "yes", "no"].include?(response)
prompt("Invalid response")
end

break if ["n", "no"].include?(response)
end

prompt("Goodbye")

