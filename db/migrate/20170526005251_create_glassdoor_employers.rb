class CreateGlassdoorEmployers < ActiveRecord::Migration
  def change
    create_table :glassdoor_employers do |t|
      t.string  :name,                           null: false
      t.integer :employer_id,                    null: false
      t.string  :website,                        null: false, default: ""
      t.string  :industry,                       null: false, default: ""
      t.string  :squareLogo,                     null: false, default: ""
      t.integer :numberOfRatings,                null: false, default: 0
      t.integer :overallRating,                  null: false, default: 0
      t.string  :ratingDescription,              null: false, default: 'Not Applicable'
      t.string  :cultureAndValuesRating,         null: false, default: 'Not Applicable'
      t.string  :seniorLeadershipRating,         null: false, default: 'Not Applicable'
      t.string  :compensationsAndBenefitsRating, null: false, default: 'Not Applicable'
      t.string  :careerOpportunitiesRating,      null: false, default: 'Not Applicable'
      t.string  :workLifeBalanceRating,          null: false, default: 'Not Applicable'

      t.timestamps                               null: false
    end
  end
end
