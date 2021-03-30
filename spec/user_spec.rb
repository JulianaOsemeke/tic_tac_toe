require_relative '../lib/user'

describe User do
describe 'Correctly sets marker' do
let(:user) { User.new('name', 'O') }
it 'returns a non empty string when set' do
expect(user.mark).to eq('O')
end
end
end 