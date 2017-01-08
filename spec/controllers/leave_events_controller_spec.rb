require 'rails_helper'

RSpec.describe LeaveEventsController do
  describe "GET index" do
    it "assigns @leave_events and render template when current user is admin" do

      user = create(:user)
      sign_in user

      le1 = create(:leave_event)
      le2 = create(:leave_event)

      get :index

      expect(assigns[:leave_events]).to eq([le1, le2])
    end

    it "render template" do

      user = create(:user)
      sign_in user

      le1 = create(:leave_event)
      le2 = create(:leave_event)

      get :index

      expect(assigns[:leave_events]).to eq([le1, le2])
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @leave_events" do
      user = create(:user)
      sign_in user

      leave_event = create(:leave_event)

      get :show, params: { id: leave_event.id }

      expect(assigns[:leave_event]).to eq(leave_event)
    end

    it "render template" do
      user = create(:user)
      sign_in user

      leave_event = create(:leave_event)

      get :show, params: { id: leave_event.id }

      expect(response).to render_template("show")
    end
  end


  describe "GET new" do
    it "assign @leave_event" do
      user = create(:user)
      sign_in user
      leave_event = build(:leave_event)

      get :new

      expect(assigns(:leave_event)).to be_a_new(LeaveEvent)
    end

    it "render template" do
      user = create(:user)
      sign_in user

      leave_event = build(:leave_event)

      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "create a new leave_event record" do
      user = create(:user)
      sign_in user

      leave_event = build(:leave_event)

      expect do
        post :create, params: { :leave_event => attributes_for(:leave_event) }
      end.to change{ LeaveEvent.count }.by(1)
    end

    it "redirects to leave_events_path" do
      user = create(:user)
      sign_in user

      leave_event = build(:leave_event)

      post :create, params: { :leave_event => attributes_for(:leave_event) }

      expect(response).to redirect_to leave_events_path
    end
  end
end
