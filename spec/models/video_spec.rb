# spec/models/video_spec.rb

require 'rails_helper'

RSpec.describe Video, :type => :model do
  subject { described_class.new (
     )
  }
  it "is valid with valid attributes" do
    seller =
       User.create(:email => "jane@a.com", :password => "pw1234")

    subject.video_url = "https://www.youtube.com"
    subject.user_id = seller.id
    expect(subject).to be_valid
  end

  it "is not valid without a video url" do
    subject.video_url = nil
    expect(subject).to_not be_valid
  end
end
