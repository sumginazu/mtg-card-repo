require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '.create_from_name' do
    context 'when the card is Research'
      let(:name) {'Research'}
      it 'returns a valid card object' do
        card = Card.create_from_name name
      end
      it 'returns the correct card info' do

      end
    end
    context 'when the card is Tireless Tracker'
      let(:name) {'Tireless Tracker'}
      it 'returns a valid card object' do
        card = Card.create_from_name name
      end
      it 'returns the correct card info' do

      end
    end
    context 'when the card is nil'
      let(:name) {nil}
      it 'raises NoSuchCardException' do
        card = Card.create_from_name name
      end
    end
    context 'when the card does not exist'
      let(:name) {'Tired Tracker'}
      it 'raises NoSuchCardException' do
        card = Card.create_from_name name
      end
    end
  end
end
