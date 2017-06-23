require 'rails_helper'

RSpec.describe GlassdoorEmployersController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_glassdoor_employer) { create(:glassdoor_employer) }

  let(:new_glassdoor_employer_attributes) { {
    id:                             my_glassdoor_employer.id,
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
    workLifeBalanceRating:          my_glassdoor_employer.workLifeBalanceRating,
    created_at:                     my_glassdoor_employer.created_at,
    updated_at:                     my_glassdoor_employer.updated_at
  } }

  context "guest user" do
    describe "GET #index" do
      it "redirects unauthenticated users" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #show" do
      it "redirects unauthenticated users" do
        get :show, id: my_glassdoor_employer.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE #destroy" do
      it "redirects unauthenticated users" do
        delete :destroy, id: my_glassdoor_employer.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context "authenticated user" do
    describe "GET #index" do
      before(:each) do
        sign_in my_user
      end

      it "assigns all glassdoor_employers as @glassdoor_employers" do
        get :index
        glassdoor_employer = GlassdoorEmployer.create(new_glassdoor_employer_attributes)
        expect(assigns(:glassdoor_employers).last).to eq(glassdoor_employer)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "GET #index generate CSV" do
      before :each do
        sign_in my_user
        get :index, format: :csv
      end

      it "generates a CSV" do
        expect(response.header['Content-Type']).to include 'text/csv'
      end

      it "contains the correct attributes" do
        first_employer = response.body.first

        attributes = %w{id name website industry numberOfRatings overallRating ratingDescription cultureAndValuesRating seniorLeadershipRating
                          compensationAndBenefitsRating careerOpportunitiesRating workLifeBalanceRating }

        attributes.each do |attr|
          expect(response.body).to include(attr)
          expect(response.body).to include(first_employer[attr].to_s)
        end
      end

    end

    describe "GET #show" do
      before(:each) do
        sign_in my_user
      end

      it "returns http success" do
        glassdoor_employer = GlassdoorEmployer.create(new_glassdoor_employer_attributes )
        get :show, id: glassdoor_employer.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        glassdoor_employer = GlassdoorEmployer.create(new_glassdoor_employer_attributes )
        get :show, id: glassdoor_employer.id
        expect(response).to render_template :show
      end

      it "assigns glassdoor_employer to @glassdoor_employer" do
        glassdoor_employer = GlassdoorEmployer.create(new_glassdoor_employer_attributes )
        get :show, id: glassdoor_employer.id
        expect(assigns(:glassdoor_employer)).to eq(glassdoor_employer)
      end
    end

    describe "GET #search" do
      before(:each) do
        sign_in my_user
      end

      it "returns a glassdoor employer" do
        employer = double
        allow(employer).to receive(:find_employer).with("ACME").and_return(new_glassdoor_employer_attributes)

        response = employer.find_employer("ACME")
        expect(response).to eq new_glassdoor_employer_attributes
      end
    end

    describe "DELETE #destroy" do
      before(:each) do
        sign_in my_user
      end

      it "destroys the requested glassdoor_employer" do
        glassdoor_employer = GlassdoorEmployer.create(new_glassdoor_employer_attributes)
        delete :destroy, id: my_glassdoor_employer.id
        count = GlassdoorEmployer.where({id: my_glassdoor_employer.id}).size
        expect(count).to eq 0
      end

      it "redirects to the registered_applications list" do
        glassdoor_employer = GlassdoorEmployer.create(new_glassdoor_employer_attributes)
        delete :destroy, id: my_glassdoor_employer.id
        expect(response).to redirect_to(glassdoor_employers_path)
      end
    end
  end
end
