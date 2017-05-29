class GlassdoorEmployersController < ApplicationController

  # # GET /glassdoor_employers
  def index
    gd_api = GlassdoorService.new(current_user)
    @glassdoor_employers = gd_api.find_employer(params[:name])
  end
  #
  # # GET /glassdoor_employers/1
  def show
    gd_api = GlassdoorService.new(current_user)
    @glassdoor_employer = gd_api.find_employer(params[:name])
  end

  # # POST /glassdoor_employers
  # def create
  #   gd_api = GlassdoorService.new(current_user)
  #   gd_employer = gd_api.find_employer(glassdoor_employer_params)
  #
  #   @glassdoor_employer = GlassdoorEmployer.new(gd_employer)
  #
  #   @glassdoor_employer.save!
  # end

  # # DELETE /glassdoor_employers/1
  # def destroy
  #   @glassdoor_employer.destroy
  #   redirect_to glassdoor_employers_url, notice: 'Glassdoor employer was successfully destroyed.'
  # end
end
