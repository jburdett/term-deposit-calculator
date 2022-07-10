class TermDeposit
  MONTHS_IN_YEAR = 12.0

  def initialize(start_amount:, interest_rate:, investment_term:, interest_frequency:)
    @start_amount = start_amount
    @interest_rate = interest_rate
    @investment_term = investment_term
    @interest_frequency = interest_frequency
  end

  def final_balance
    result = if @interest_frequency == :at_maturity
               @start_amount * (1 + interest_rate_decimal * investment_term_years)
             else
               @start_amount * (1 + interest_rate_decimal / compounding_frequency) ** (compounding_frequency * investment_term_years)
             end
    result.round()
  end

  def compounding_frequency
    case @interest_frequency
    when :monthly
      12
    when :quarterly
      4
    else
      1
    end
  end

  def investment_term_years
    @investment_term / MONTHS_IN_YEAR
  end

  def interest_rate_decimal
    @interest_rate / 100.0
  end
end
