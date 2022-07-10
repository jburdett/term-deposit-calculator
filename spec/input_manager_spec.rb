require 'input_manager'
require 'tty-prompt'

describe InputManager do
  let(:prompt) { double }
  let(:input_manager) { InputManager.new(prompt: prompt) }
  let(:answer) { double }

  describe '#query_start_amount' do
    let(:query_start_amount) { input_manager.query_start_amount }

    it 'prompts the user for input' do
      expect(prompt).to receive(:ask).and_return(answer)
      expect(query_start_amount).to eql(answer)
    end
  end

  describe '#query_interest_rate' do
    let(:query_interest_rate) { input_manager.query_interest_rate }

    it 'prompts the user for input' do
      expect(prompt).to receive(:ask).and_return(answer)
      expect(query_interest_rate).to eql(answer)
    end
  end

  describe '#query_investment_term' do
    let(:query_investment_term) { input_manager.query_investment_term }

    it 'prompts the user for input' do
      expect(prompt).to receive(:ask).and_return(answer)
      expect(query_investment_term).to eql(answer)
    end
  end

  describe '#query_interest_frequency' do
    let(:query_interest_frequency) { input_manager.query_interest_frequency }

    describe 'monthly frequency' do
      let(:answer) { 'Monthly' }

      it 'prompts the user for input' do
        expect(prompt).to receive(:select).and_return(answer)
        expect(query_interest_frequency).to eql(:monthly)
      end
    end

    describe 'quarterly frequency' do
      let(:answer) { 'Quarterly' }

      it 'prompts the user for input' do
        expect(prompt).to receive(:select).and_return(answer)
        expect(query_interest_frequency).to eql(:quarterly)
      end
    end

    describe 'quarterly frequency' do
      let(:answer) { 'Annually' }

      it 'prompts the user for input' do
        expect(prompt).to receive(:select).and_return(answer)
        expect(query_interest_frequency).to eql(:annually)
      end
    end

    describe 'quarterly frequency' do
      let(:answer) { 'At Maturity' }

      it 'prompts the user for input' do
        expect(prompt).to receive(:select).and_return(answer)
        expect(query_interest_frequency).to eql(:at_maturity)
      end
    end
  end
end
