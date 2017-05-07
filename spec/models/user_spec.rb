require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(username: user.username, email: user.email)
    end
  end
end
