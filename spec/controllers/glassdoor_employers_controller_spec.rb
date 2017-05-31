require 'rails_helper'

RSpec.describe GlassdoorEmployersController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_glassdoor_employer) { create(:glassdoor_employer) }

  let(:new_glassdoor_employer_attributes) { {
    name:                           my_glassdoor_employer.name,
    employer_id:                    my_glassdoor_employer.employer_id,
    website:                        my_glassdoor_employer.website,
    industry:                       my_glassdoor_employer.industry,
    squareLogo:                     my_glassdoor_employer.squareLogo,
    numberOfRatings:                my_glassdoor_employer.numberOfRatings,
    overallRating:                  my_glassdoor_employer.overallRating,
    ratingDescription:              my_glassdoor_employer.ratingDescription,
    cultureAndValuesRating:         my_glassdoor_employer.cultureAndValuesRating,
    seniorLeadershipRating:         my_glassdoor_employer.seniorLeadershipRating,
    compensationAndBenefitsRating:  my_glassdoor_employer.compensationAndBenefitsRating,
    careerOpportunitiesRating:      my_glassdoor_employer.careerOpportunitiesRating,
    workLifeBalanceRating:          my_glassdoor_employer.workLifeBalanceRating
  } }

  context "guest user" do
    # describe "GET #new" do
    #   it "redirects unauthenticated users" do
    #     glassdoor_employer = GlassdoorEmployer.create( new_glassdoor_employer_attributes)
    #     get :new
    #     expect(response).to redirect_to(new_user_session_path)
    #   end
    # end
    #
    # describe "POST #create" do
    #   it "redirects unauthenticated users" do
    #     post :create, glassdoor_employer: new_glassdoor_employer_attributes
    #     expect(response).to redirect_to(new_user_session_path)
    #   end
    # end
  end

end
