require 'term_deposit'

describe TermDeposit do
  let(:start_amount) { 10000 }
  let(:interest_rate) { 1.1 }
  let(:investment_term) { 36 }
  let(:interest_frequency) { :at_maturity }

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

    describe 'with different starting amount' do
      let(:start_amount) { 20000 }

      it 'still calculates the correct vaule' do
        expect(final_balance).to eql(20660)
      end
    end

    describe 'with different interest rate' do
      let(:interest_rate) { 1.0 }

      it 'still calculates the correct interest' do
        expect(final_balance).to eql(10300)
      end
    end

    describe 'with different investment term' do
      let(:investment_term) { 24 }

      it 'still calculates the correct interest' do
        expect(final_balance).to eql(10220)
      end
    end

    describe 'with different interest frequency' do
      let(:start_amount) { 100000 }

      describe 'at maturity frequency' do
        let(:interest_frequency) { :at_maturity }

        it 'still calculates the correct interest' do
          expect(final_balance).to eql(103300)
        end
      end

      describe 'monthly frequency' do
        let(:interest_frequency) { :monthly }

        it 'still calculates the correct interest' do
          expect(final_balance).to eql(103353)
        end
      end

      describe 'quarterly frequency' do
        let(:interest_frequency) { :quarterly }

        it 'still calculates the correct interest' do
          expect(final_balance).to eql(103350)
        end
      end

      describe 'annually frequency' do
        let(:interest_frequency) { :annually }

        it 'still calculates the correct interest' do
          expect(final_balance).to eql(103336)
        end
      end
    end
  end
end
