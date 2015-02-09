require 'rails_helper'

describe Vote do

  

  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here
      end
    end
  end

  describe 'after_save' do
    it "calls `Post#update_rank` after save" do
      post = create(:post)
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end