require 'rails_helper'

RSpec.feature "Unathenticated User", type: :feature do
  it "can view top 10 hot reads" do
    12.times { |x| Read.create(title: "#{x}", url: "http://#{x}.com", read_at: "time") }

    visit root_path


  end
end
