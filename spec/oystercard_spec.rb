require './lib/oystercard.rb'

describe OysterCard do
  subject(:card) { described_class.new }

it 'will check that the balance of a new card is 0' do
  expect( card.balance).to eq(0)
end

end
