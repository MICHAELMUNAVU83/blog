require 'rails_helper'

RSpec.describe 'Home features' do
  it 'should have a home page' do
    visit root_path
    expect(page).to have_content('Welcome to the home page')
  end
end
