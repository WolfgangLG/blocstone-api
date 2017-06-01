class GlassdoorEmployersController < ApplicationController

  # # GET /glassdoor_employers
  def index
    @glassdoor_employers = GlassdoorEmployer.all

    respond_to do |format|
      format.html
      format.csv { send_data @glassdoor_employers.to_csv, filename: "employers-#{Date.today}.csv" }
    end
  end

  # # GET /glassdoor_employers/1
  def show
    gd_api = GlassdoorService.new(current_user)
    @glassdoor_employer = gd_api.find_employer(params[:name])
  end

  # DELETE /glassdoor_employers/1
  def destroy
    @glassdoor_employer = GlassdoorEmployer.find(params[:id])
    if @glassdoor_employer.destroy
      flash[:notice] = "Employer number #{@glassdoor_employer.id} – \"#{@glassdoor_employer.name}\" was deleted successfully."
      redirect_to glassdoor_employers_path
    else
      flash.now[:alert] = "There was an error deleting the employer."
      render :show
    end
  end
end
