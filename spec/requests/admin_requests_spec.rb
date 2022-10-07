require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/admin_requests", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # AdminRequest. As you add validations to AdminRequest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      AdminRequest.create! valid_attributes
      get admin_requests_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      admin_request = AdminRequest.create! valid_attributes
      get admin_request_url(admin_request)
      expect(response).to be_successful
    end
  end

  # NOTE: need to figure out how this works???
  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_request_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      admin_request = AdminRequest.create! valid_attributes
      get edit_admin_request_url(admin_request)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new AdminRequest" do
        expect {
          post admin_requests_url, params: { admin_request: valid_attributes }
        }.to change(AdminRequest, :count).by(1)
      end

      it "redirects to the created admin_request" do
        post admin_requests_url, params: { admin_request: valid_attributes }
        expect(response).to redirect_to(admin_request_url(AdminRequest.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new AdminRequest" do
        expect {
          post admin_requests_url, params: { admin_request: invalid_attributes }
        }.to change(AdminRequest, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_requests_url, params: { admin_request: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_request" do
        admin_request = AdminRequest.create! valid_attributes
        patch admin_request_url(admin_request), params: { admin_request: new_attributes }
        admin_request.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_request" do
        admin_request = AdminRequest.create! valid_attributes
        patch admin_request_url(admin_request), params: { admin_request: new_attributes }
        admin_request.reload
        expect(response).to redirect_to(admin_request_url(admin_request))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        admin_request = AdminRequest.create! valid_attributes
        patch admin_request_url(admin_request), params: { admin_request: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_request" do
      admin_request = AdminRequest.create! valid_attributes
      expect {
        delete admin_request_url(admin_request)
      }.to change(AdminRequest, :count).by(-1)
    end

    it "redirects to the admin_requests list" do
      admin_request = AdminRequest.create! valid_attributes
      delete admin_request_url(admin_request)
      expect(response).to redirect_to(admin_requests_url)
    end
  end
end
