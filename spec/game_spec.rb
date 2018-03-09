require 'game'

describe Game do
  let(:player_1) { double "player_1" }
  let(:player_2) { double "player_2" }
  subject(:subject) { Game.new(player_1, player_2)}
  describe '#initialize' do
    it 'should initialize class with two players' do
      expect(subject.player_1).to eq player_1
      expect(subject.player_2).to eq player_2
    end

  end


  describe '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:receive_damage)
      subject.attack(player_2) # here because 'attack' needs :receive_damage to work
    end
  end


end
