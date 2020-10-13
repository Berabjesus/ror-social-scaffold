require 'rails_helper'

RSpec.describe Post do
  let(:test_user) { User.create(name: 'Example User', email: 'test@example.com', password: 'password') }
  let(:subject) do
    described_class.new(
      content: 'new job offer',
      user_id: test_user.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'Content cannot be longer than 1,000' do
      subject.content = '0' * 1001
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
  end
end
