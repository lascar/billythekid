require 'rails_helper'

RSpec.describe "Bills Feature", type: :feature do
  let!(:bill1) {create(:bill_with_bill_lines)}
  let!(:bill2) {create(:bill_with_bill_lines)}

  describe "GET #index" do
    # TEST as a anonymous user
    # TEST when the list of bills is asked for
    # TEST then all bills are showed
    describe "as an anonymous user" do
      before :each do
        visit bills_url
      end

      it "presentes only approved bills that are product attached to the user" do
        expect(page).to have_content(I18n.t("views.bills.title_plural"))
        expect(page).to have_content(bill1.bill_lines.first.concept)
      end
    end
  end
end
