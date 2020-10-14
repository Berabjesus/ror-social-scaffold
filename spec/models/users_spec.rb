require 'rails_helper'

RSpec.describe User do
  let(:subject) do
    described_class.new(
      name: 'user_example',
      email: 'user@email.com',
      password: 'password'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'The name of the user should exist' do
      subject.name = ''
      expect(subject).not_to be_valid
    end

    it 'The name of the user should not be longer than 20 characters' do
      subject.name = 'weiruwieruiowueriuioweuriuwioeurwioeriouiowerui'
      expect(subject).not_to be_valid
    end

    it 'The email should exist' do
      subject.email = ''
      expect(subject).not_to be_valid
    end

    it 'The email should have the right format' do
      subject.email = 'hello'
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:friendships) }
    it { is_expected.to have_many(:inverse_friendships) }
  end
end
