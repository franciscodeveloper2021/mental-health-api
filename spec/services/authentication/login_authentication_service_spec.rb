require 'rails_helper'

RSpec.describe Authentication::LoginAuthenticationService do
  describe '#perform' do
    let!(:psychologist) { create(:psychologist, name: 'test_psychologist', password: 'password123') }
    let(:service) { described_class.new }

    context 'when valid credentials are provided' do
      it 'returns a token' do
        result = service.perform('test_psychologist', 'password123')
        expect(result).to have_key(:token)
      end
    end

    context 'when invalid credentials are provided' do
      it 'returns an error message' do
        result = service.perform('test_psychologist', 'wrong_password')
        expect(result).to have_key(:error)
      end
    end

    context 'when the psychologist does not exist' do
      it 'returns an error message' do
        result = service.perform('non_existent_psychologist', 'password123')
        expect(result).to have_key(:error)
      end
    end
  end
end
