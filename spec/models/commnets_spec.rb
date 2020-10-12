require 'rails_helper'

RSpec.describe Comment do
  let(:user) { User.create(name: 'Example User', email: 'abc@example.com', password: 'abc') }
  let(:post) { Post.create(content: 'This is a test post', user_id: user.id) }
  let(:subject) do
    described_class.new(
      post_id: post.id,
      user_id: user.id,
      content: 'This is a test comment'
    )
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }

    it 'The content of the comment length < 200' do
      subject.content = '0' * 205
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
