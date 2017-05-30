require 'rails_helper'

describe 'GlassdoorService API Request' do
  let(:my_user) { create(:user, glassdoor_partner_id: ENV["glassdoor_partner_id"], glassdoor_key: ENV["glassdoor_key"])}
  it 'returns a glassdoor employer' do
    employer = GlassdoorService.new(my_user)
    response = employer.find_employer("Masonite")

    expect(response).to be_an_instance_of(Array )
    expect(response.size).not_to be nil
  end
end
