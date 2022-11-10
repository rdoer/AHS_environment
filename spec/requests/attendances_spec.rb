require 'rails_helper'

# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to test the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator. If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails. There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/attendances", type: :request do
  
    #   # This should return the minimal set of attributes required to create a valid
    #   # Attendance. As you add validations to Attendance, be sure to
    #   # adjust the attributes here as well.
      let(:valid_attributes) {
        {
            user_id: 1,
            event_id: 1,
            points: 1,
            password: "Test"
        }
      }
      let(:new_attributes) {
        {
            user_id: 1,
            event_id: 1,
            points: 10,
            password: "Test"
        }
      }
      let(:invalid_attributes1) { #password fail
        {
            user_id: 1,
            event_id: 1,
            points: 1,
            password: "Fail1"
        }
      }
      let(:invalid_attributes2) { #user id fail
        {
            user_id: 120,
            event_id: 1,
            points: 2,
            password: "Fail2"
        }
      }
    
      let(:invalid_attributes3) { # event id fail
        {
            user_id: 1,
            event_id: 121,
            points: 3,
            password: "Fail3"
        }
      }
    
      let!(:testuser) {
        {
            first_name: 'test', 
            last_name: 'test', 
            email: 'test@gmail.com', 
            password: 'test', 
            is_admin: true
        }
      }
      let!(:nonadmin) {
        {
          first_name: 'tester', 
            last_name: 'tester', 
            email: 'tester@gmail.com', 
            password: 'tester', 
            is_admin: false
        }
      }
    
      let!(:test_event) {
        {
            event_title: '1st Meeting', 
            event_description: 'General Meeting', 
            event_points: 5, 
            event_passcode: 'Test',
            event_location: 'ZACH-350',
            event_start: DateTime.new(2022, 9, 18, 8, 10),
            event_end: DateTime.new(2022, 9, 18, 9, 0)
        }
      }
      before(:each) do
        post users_url, params: {user: testuser} # is an admin
        post events_url, params: {event: test_event}
        valid_attributes[:user_id] = User.last.id
        valid_attributes[:event_id] = Event.last.id
      end
    describe "GET /index" do
      it "renders a successful response" do
          Attendance.create! valid_attributes
          get attendances_url
          expect(response).to be_successful
      end
      it "user fails to render" do
          post users_url, params: {user: nonadmin}
          Attendance.create! valid_attributes
          get attendances_url
          expect(response).to redirect_to(
            events_path
            )
      end
        
    end
    

  describe "GET /show" do
    it "renders a successful response" do
      attendance = Attendance.create! valid_attributes
      get attendance_url(attendance)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_attendance_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      attendance = Attendance.create! valid_attributes
      get edit_attendance_url(attendance)
      expect(response).to be_successful
    end
    it "user fails to render" do
      post users_url, params: {user: nonadmin}
      attendance = Attendance.create! valid_attributes
      get edit_attendance_url(attendance)
      expect(response).to redirect_to(
        events_path
        )
  end
  end

  describe "POST /create" do
    context "with valid parameters" do
        it "creates a new Attendance, then tries to recreate it" do
          post attendances_url, params: {attendance: valid_attributes }
          expect(response).to redirect_to(attendance_url(Attendance.last))
          post attendances_url, params: {attendance: valid_attributes }
          expect(response).to redirect_to(events_path)
          
        end       
      end
    context "with invlaid parameters" do
        it "Fails because of user_id" do

          post attendances_url, params: {attendance: invalid_attributes2 }
          expect(response).to redirect_to(
            events_path
            )

        end

        it "Fails because of event_id" do
          post attendances_url, params: {attendance: invalid_attributes3 }
          expect(response).to redirect_to(
            events_path
            )

        end
        it "Fails because of incorrect password" do
          post attendances_url, params: {attendance: invalid_attributes1 }
          expect(response).to redirect_to(
            events_path
            )
        end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "Updates attendance as admin" do
        attendance = Attendance.create! valid_attributes
        put attendance_url(attendance), params: {attendance: new_attributes}
        attendance.reload
        expect(attendance.points).to eq(1)
      end
      it "Fails ?" do
        post users_url, params: {user: nonadmin}
        attendance = Attendance.create! valid_attributes
        patch attendance_url(attendance), params: {attendance: new_attributes}
        attendance.reload
        expect(attendance.points).not_to eq(10)
      end
    end
  end

  describe "Delete /update" do
    context "with valid parameters" do
      it "Deletes attendance as admin" do
        attendance = Attendance.create! valid_attributes
        delete attendance_url(attendance)
        expect(attendance).to be_valid
      end
      it "Fails ?" do
        post users_url, params: {user: nonadmin}
        attendance = Attendance.create! valid_attributes
        delete attendance_url(attendance)
        expect(attendance).to be_valid
      end
    end
  end

end
