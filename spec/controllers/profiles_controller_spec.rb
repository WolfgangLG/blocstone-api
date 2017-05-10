require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #show" do
    before(:each) do
      sign_in user
    end

    it "assigns the current user as @user" do
      get :show, params: {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end
end
