require 'rails_helper'

describe 'GlassdoorService API Request' do
  let(:my_user) { create(:user, glassdoor_partner_id: ENV["glassdoor_partner_id"], glassdoor_key: ENV["glassdoor_key"])}
  let(:employer_response) { { 'name' => 'ACME, Inc.',
                              'employer_id' => 1,
                              'website' => 'www.acme.com',
                              'industry' => 'Manufacturing'
  } }
  # it 'returns a glassdoor employer' do
  #   employer = GlassdoorService.new(my_user)
  #   response = employer.find_employer("Masonite")
  #
  #   expect(response).to be_an_instance_of(Array )
  #   expect(response.size).not_to be nil
  # end

  it 'returns a glassdoor employer' do

    employer = GlassdoorService.new(my_user)
    allow(employer).to receive(:find_employer).and_return(employer_response)

    response = employer.find_employer("ACME")

    expect(response).to eq employer_response
  end

  it 'returns a glassdoor employer' do
    employer = double
    allow(employer).to receive(:find_employer).with("ACME").and_return(employer_response)

    response = employer.find_employer("ACME")
    expect(response).to eq employer_response
  end
end
