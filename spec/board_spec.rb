require_relative '../lib/board'

RSpec.describe Board do 
  let(:board) { Board.new }

  context 'correctly validates inputs:' do
    it 'is invalid input nil' do
      expect(board.valid(nil)).to be false
    end

    it 'is invalid input number less than 1' do
      expect(board.valid(0)).to be false
    end

    it 'is invalid input number greater than 9' do
      expect(board.valid(10)).to be false
    end

    it 'is invalid input string' do
      expect(board.valid('1')).to be false
    end

    it 'is valid input' do
      expect(board.valid(1)).to be true
    end
  end

  context 'correctly updates state:' do
    it 'is initially numbered from 1 - 9' do
      expected = ' 1 | 2 | 3 ',
                 '---+---+---',
                 ' 4 | 5 | 6 ',
                 '---+---+---',
                 ' 7 | 8 | 9 '

      expect(board.display).to eq expected
    end

    it 'updates on valid input' do
      board.update(5, 'X')
      expected = ' 1 | 2 | 3 ',
                 '---+---+---',
                 ' 4 | X | 6 ',
                 '---+---+---',
                 ' 7 | 8 | 9 '

      expect(board.display).to eq expected
    end
  end

  context 'verify if board is full' do
    it 'verfies an empty board' do
      expect(board.full).to be false
    end
    it 'verifies a partially full board' do
      board.update(2, 'X')
      expect(board.full).to be false
    end
    it 'verifies a completely full board' do
      (1..9).each { |i| board.update(i, 'X') }
      expect(board.full).to be true
    end
  end

  context 'correctly verifies winner' do
    it 'verifies an empty board' do
      expect(board.verify).to be false
    end
    it 'verifies a winner horizontally' do
      [1, 2, 3].each { |i| board.update(i, 'X') }
      expect(board.verify).to be true
    end
    it 'verifies a winner vertically' do
      [1, 4, 7].each { |i| board.update(i, 'X') }
      expect(board.verify).to be true
    end
    it 'verifies a winner diagonally' do
      [1, 5, 9].each { |i| board.update(i, 'X') }
      expect(board.verify).to be true
    end
  end
end
