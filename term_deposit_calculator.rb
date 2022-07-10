require_relative 'lib/term_deposit'

class TermDepositCalculator
  def self.run
    term_deposit = TermDeposit.new(start_amount: 10000, interest_rate: 1.1, investment_term: 36, interest_frequency: 'At Maturity')
    puts "Projected final balance is: #{term_deposit.final_balance}"
  end
end
