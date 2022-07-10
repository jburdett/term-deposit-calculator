class TermDeposit
  MONTHS_IN_YEAR = 12.0

  def initialize(start_amount:, interest_rate:, investment_term:, interest_frequency:)
    @start_amount = start_amount
    @interest_rate = interest_rate
    @investment_term = investment_term
    @interest_frequency = interest_frequency
  end

  def final_balance
    total_interest = 0
    reinvestment_cycles = @investment_term / reinvestment_length
    reinvestment_period = MONTHS_IN_YEAR / reinvestment_length
    reinvestment_cycles.times do
      total_interest += (@start_amount + total_interest) * (@interest_rate / 100) / reinvestment_period
    end
    @start_amount + total_interest.round()
  end

  def reinvestment_length
    case @interest_frequency
    when :monthly
      1
    when :quarterly
      3
    when :annually
      12
    else
      @investment_term
    end
  end
end
