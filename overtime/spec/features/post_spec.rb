require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      user = User.create(email: "test@test.com", password: "hello123!", password_confirmation: "hello123!", first_name: "Tony", last_name: "Stark")
      login_as(user, scope: :user)
      post1 = Post.create!(date: DateTime.now, rationale: "FirstPost", user_id: user.id)
      post2 = Post.create!(date: DateTime.now, rationale: "SecondPost", user_id: user.id)
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a header with content Overtime Requests' do
      expect(page).to have_content(/Overtime Requests/)
    end

    it 'has a list of Posts' do
      expect(page).to have_content(/FirstPost|SecondPost/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com", password: "hello123!", password_confirmation: "hello123!", first_name: "Tony", last_name: "Stark")
      login_as(user, scope: :user)
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'I need time off'
      click_on 'Save'
      expect(page).to have_content('I need time off')
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User_Association'
      click_on 'Save'
      expect(User.last.posts.last.rationale).to eq('User_Association')
    end
  end
end
