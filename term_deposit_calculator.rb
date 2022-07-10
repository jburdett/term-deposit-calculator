require_relative 'lib/term_deposit'
require_relative 'lib/input_manager'

class TermDepositCalculator
  def self.run
    input_manager = InputManager.new
    term_deposit = TermDeposit.new(
      start_amount: input_manager.query_start_amount, 
      interest_rate: input_manager.query_interest_rate, 
      investment_term: input_manager.query_investment_term, 
      interest_frequency: input_manager.query_interest_frequency
    )
    puts "Projected final balance is: #{term_deposit.final_balance}"
  end
end
