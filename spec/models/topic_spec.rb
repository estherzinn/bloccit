require 'rails_helper'

describe Topic do
  describe "scopes" do

    before do 
      @public_topic = Topic.create(public: true) #default is public
      @private_topic = Topic.create(public: false) # default is public
    end

    describe "public" do
      it "returns a relation of all public topics" do
        expect(Topic.is_public).to eq( [@public_topic] )
      end
    end

    describe "private" do
      it "returns a relation of all private topics" do
        expect(Topic.is_private).to eq( [@private_topic])
      end
    end

    describe "visible_to(user)" do
      it "returns all specs if the user is present" do
        user = true
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end

      it "returns only public specs if user is nil" do
        expect(Topic.visible_to(nil)).to eq(Topic.is_public.first)
      end
    end
  end
end

