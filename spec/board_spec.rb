require_relative '../lib/board'

RSpec.describe Board do
  let(:board) { Board.new }

  context 'correctly validates inputs:' do
    xit 'is invalid input nil' do
      expect(board.valid(nil)).to be false
    end

    xit 'is invalid input number less than 1' do
      expect(board.valid(0)).to be false
    end

    xit 'is invalid input number greater than 9' do
      expect(board.valid(10)).to be false
    end

    xit 'is invalid input string' do
      expect(board.valid('1')).to be false
    end

    xit 'is valid input' do
      expect(board.valid(1)).to be true
    end
  end

  context 'correctly updates state:' do
    it 'is initially numbered from 1 - 9' do
      expected =  ' 1 | 2 | 3 ',
                  '---+---+---',
                  ' 4 | 5 | 6 ',
                  '---+---+---',
                  ' 7 | 8 | 9 '

      expect(board.display).to eq expected
    end

    it 'updates on valid input' do
      board.update(5, 'X')
      expected =  ' 1 | 2 | 3 ',
                  '---+---+---',
                  ' 4 | X | 6 ',
                  '---+---+---',
                  ' 7 | 8 | 9 '

      expect(board.display).to eq expected
    end
  end
end