require 'rails_helper'

RSpec.feature "Unathenticated User", type: :feature do
  it "can view top 10 hot reads" do
    12.times do |x|
      Read.create( title: "#{x}",
                   url: "http://#{x}.com",
                   read_at: "#{x} hours" )
    end

    visit root_path

    expect(Read.count).to eq(12)
    expect(page).to have_content("Here are the latest top 10 reads:")
    within('.latest-reads') do
      expect(page).to have_selector('.hot-read', count: 10)
    end
  end

  it "can see top reads from last 24 hours" do

  end
end
