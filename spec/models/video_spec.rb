# spec/models/video_spec.rb

require 'rails_helper'

RSpec.describe Video, :type => :model do
  subject { described_class.new (
     )
  }
  let(:user) {User.create!(email: "2@2.com", password: "123456")}
  it "is valid with valid attributes" do

    pp user.id
    subject.video_url = "https://www.youtube.com"
    subject.user_id = user.id
    expect(subject).to be_valid
  end

  it "is not valid without a video url" do
    subject.video_url = nil
    expect(subject).to_not be_valid
  end
end
