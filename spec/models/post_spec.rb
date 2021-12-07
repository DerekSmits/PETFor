require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'write a title of the post' do
  expect(Post.new()).to_not be_valid
  end
end
