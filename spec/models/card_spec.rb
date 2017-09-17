require 'rails_helper'

RSpec.describe Card, type: :model do
  include Exceptions
  describe '.create_from_name' do
    context 'when the card is Research' do
      let(:name) {'Research'}
      let(:card) { Card.create_from_name name }
      it 'returns a valid card object' do
        expect(card).to be_instance_of Card
      end
      it 'returns the correct card info' do
        expect(card.name).to eq 'Research'
        expect(card.names).to eq ['Research', 'Development']
        expect(card.type_line).to eq 'Instant'
      end
    end
    context 'when the card is Tireless Tracker' do
      let(:name) {'Tireless Tracker'}
      let(:card) { Card.create_from_name name }
      it 'returns a valid card object' do
        expect(card).to be_instance_of Card
      end
      it 'returns the correct card info' do
        expect(card.name).to eq name
        expect(card.types).to eq ['Creature']
        expect(card.power).to eq '3'
        expect(card.toughness).to eq '2'
      end
    end
    context 'when the card is nil' do
      let(:name) {nil}
      it 'raises NoSuchCardException' do
        expect do
          Card.create_from_name name
        end.to raise_error(Exceptions::NoSuchCardException)
      end
    end
    context 'when the card does not exist' do
      let(:name) {'Tired Tracker'}
      it 'raises NoSuchCardException' do
        expect do
          Card.create_from_name name
        end.to raise_error(Exceptions::NoSuchCardException)
      end
    end
  end

  describe '.update_db' do
    let(:name) {'Tireless Tracker'}
    it 'populates the db' do
      expect(Card.find_by_name name).to be_nil

      Card.update_db cards: [name] # create
      expect(Card).to exist name: name

      Card.update_db cards: [name] # overwrite
      expect(Card).to exist name: name
    end
  end
end
