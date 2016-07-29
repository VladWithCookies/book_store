require 'rails_helper'

RSpec.describe Country do
  subject { FactoryGirl.create(:country) }

  context "validations" do
    it "is invalid without name" do
      is_expected.to validate_presence_of(:name)
    end

    it "is has unique name" do
      is_expected.to validate_uniqueness_of(:name)
    end
  end
end
