require_relative './term_deposit'
require 'tty-prompt'

class InputManager
  def initialize(prompt: nil)
    @prompt = prompt
  end

  def query_start_amount
    prompt.ask("Please choose a starting amount (between $1000 - $1,000,000)", convert: :int) do |answer|
      answer.in("1000-1000000")
    end
  end

  def query_interest_rate
    prompt.ask("Please choose an interest rate (between 0% - 5%)", convert: :float) do |answer|
      answer.in("0-5")
    end
  end

  def query_investment_term
    prompt.ask("Please choose an investment term (between 3 - 60 months)", convert: :float) do |answer|
      answer.in("3-60")
    end
  end

  def query_interest_frequency
    choice = prompt.select("Please slect when interest should be paid", TermDeposit::INTEREST_FREQUENCY_MAP.keys)
    TermDeposit::INTEREST_FREQUENCY_MAP[choice]
  end

  def prompt
    @prompt ||= TTY::Prompt.new
  end
end
