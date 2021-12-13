require 'rails_helper'

RSpec.describe Post, type: :model do
  if "return if Post valid"
    expect(Post.create(title: "Title", body: "bubu")).to be_valid
  end
end
