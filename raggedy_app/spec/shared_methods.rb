shared_context "signed in" do
  before do
    sign_in
  end
 
  def sign_in
	@user = FactoryGirl.create(:user, email:'example@example.com',password:'changeme')
	visit '/'
	click_link 'Login'
	fill_in 'Email', with: 'example@example.com'
	fill_in 'Password', with: 'changeme'
	click_button 'Sign in'
  end
 
  let(:user) { @user }
end
