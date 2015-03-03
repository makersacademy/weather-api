require 'spec_helper'

describe "getting a temperature", :type => :feature do
  it "can get recoginise a city" do
    visit '/temperature?city=london'
    expect(page).to have_content 'city":"london"'
  end

  it "won't recognise unless we give it a city" do
    visit '/temperature'
    expect(page).to have_content 'no city given'
  end

  it "won't recognise a bad city" do
    visit '/temperature?city=megatown'
    expect(page).to have_content 'invalid city'
  end
end
