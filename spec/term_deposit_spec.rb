require 'term_deposit'

describe TermDeposit do
  let(:start_amount) { 10000 }
  let(:interest_rate) { 1.1 }
  let(:investment_term) { 36 }
  let(:interest_frequency) { 'At Maturity' }

  let(:term_deposit) do 
    TermDeposit.new(
      start_amount: start_amount, 
      interest_rate: interest_rate, 
      investment_term: investment_term, 
      interest_frequency: interest_frequency
    )
  end

  describe '#final_balance' do
    let(:final_balance) { term_deposit.final_balance }

    it 'calculates the correct value' do
      expect(final_balance).to eql(10330)
    end
  end
end
