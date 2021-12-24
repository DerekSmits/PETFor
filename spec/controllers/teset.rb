require 'spec_helper'

describe User::SessionsController do
  login_admin

  describe "POST create" do
    it "should logout admin" do
      post :create, {:user => {:email => "admin@admin.com", :password => "123456"} }
      subject.current_user.should_not be_nil
      subject.current_admin.should be_nil
    end
  end
end