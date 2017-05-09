class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]

  # GET /profile
  def show
  end

  private
    def set_profile
      @user = current_user
    end
end
