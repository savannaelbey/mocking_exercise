require 'dockingstation'

describe DockingStation do
  let(:working_bike) {double('working_bike', working?: true)}
  let(:broken_bike) {double('broken_bike', working?: false)}

  describe '#working_bike_count' do
    context '1 working bike' do
      it "returns 1" do
        bikes = []
        bikes << working_bike
        docking_station = DockingStation.new(bikes)

        expect(docking_station.working_bike_count).to eq(1)
      end
    end

    context '1 working bike, 1 broken bike' do
      it "returns 1" do
        bikes = []
        bikes << working_bike
        bikes << broken_bike
        docking_station = DockingStation.new(bikes)
        expect(docking_station.working_bike_count).to eq(1)
      end
    end
  end

  describe '#random_bike_working?' do
    context 'random bike is working' do
      it 'returns true' do
        bikes = [working_bike, broken_bike]
        docking_station = DockingStation.new(bikes)
        allow(bikes).to receive(:sample) {working_bike}
        expect(docking_station.random_bike_working?).to eq(true)
      end
    end

    context 'random bike is broken' do
      it 'returns false' do
        bikes = [working_bike, broken_bike]
        docking_station = DockingStation.new(bikes)
        allow(bikes).to receive(:sample){broken_bike}
        expect(docking_station.random_bike_working?).to eq(false)
      end
    end
  end
end
