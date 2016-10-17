require 'rails_helper'

RSpec.describe Coupon, :type => :model do
  subject { FactoryGirl.create(:coupon) }

  context "validation" do
    it "is invalid without code" do
      is_expected.to validate_presence_of(:code)
    end

    it "is has unique code" do
      is_expected.to validate_uniqueness_of(:code)
    end
  end
end
