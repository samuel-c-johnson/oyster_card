require 'journey'

describe Journey do
  let(:station) {double(:my_station, name: 'name')}
  subject(:journey) {described_class.new}

  it 'should record the origin of the journey' do
    journey.start(station)
    expect(journey.start_point).to eq 'name'
  end

  it 'should record the finishing point of the journey' do
    journey.start(station)
    journey.finish(station)
    expect(journey.end_point).to eq 'name'
  end

  it 'should respond to #fare' do
    expect(journey).to respond_to(:fare)
  end

  it 'should be able to set journey status to complete' do
    journey.start(station)
    journey.finish(station)
    expect(journey.complete?).to be true
  end

end
