class AddApiTokensToUsers < ActiveRecord::Migration
  def change
    add_column :users, :g2_crowd_api_token, :string
    add_column :users, :mattermark_api_token, :string
    add_column :users, :glassdoor_api_token, :string
  end
end
