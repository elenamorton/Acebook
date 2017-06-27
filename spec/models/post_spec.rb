require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new(message: "New Post", created_at: DateTime.now) }

  it { is_expected.to be }

  it "shows that the message and time is valid" do
    expect(subject).to be_valid
  end

  

end
