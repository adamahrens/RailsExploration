require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'index' do
    before do
      @post1 = FactoryGirl.create(:first_post)
      @post2 = FactoryGirl.create(:second_post)

      # FactoryGirl creates a new User for each post that had a different id
      @post1.update(user_id: @user.id)
      @post2.update(user_id: @user.id)
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a header with content Overtime Requests' do
      expect(page).to have_content(/Overtime Requests/)
    end

    it 'has a list of Posts' do
      expect(page).to have_content(/#{@post1.rationale}|#{@post2.rationale}/)
    end

    it 'has a scope to only the current Users Posts appear' do
      # Two posts for the First User
      first_post = Post.create(date: Date.today, rationale: "Heading North", user_id: @user.id)
      second_post = Post.create(date: Date.today, rationale: "Heading South", user_id: @user.id)

      # One Post for Second User
      other_user = FactoryGirl.create(:user_other)
      other_user_post = Post.create(date: Date.tomorrow, rationale: "Blah Blah Blah", user_id: other_user.id)

      # Ensure First User Can't See Second User Posts
      visit posts_path
      expect(page).to have_content(/#{first_post.rationale}|#{second_post.rationale}/)
      expect(page).not_to have_content(/#{other_user_post.rationale}/)
    end
  end

  describe 'creation' do
    before do
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

  describe 'editing' do
    before do
      @edit_user = User.create(first_name: "first", last_name: "last", email: "first@last.com", password: "password123", password_confirmation: "password123")
      login_as(@edit_user, scope: :user)
      @edit_post = Post.create(date: Date.today, rationale: "Day off", user_id: @edit_user.id)
    end

    it 'can be reached by clicking edit on index path' do
      visit posts_path
      click_link "edit_#{ @edit_post.id }"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@edit_post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'I need to visit the vet'
      click_on 'Save'
      expect(User.last.posts.last.rationale).to eq('I need to visit the vet')
    end

    it 'can not be edited by non admin user' do
      logout(:user)
      user_other = FactoryGirl.create(:user_other)
      login_as(user_other, scope: :user)
      visit edit_post_path(@edit_post)
      expect(current_path).to eq(root_path)
    end
  end

  describe 'deleting' do
    before do
      @post = Post.create(date: Date.today, rationale: 'Fixing tests', user_id: @user.id)
      visit posts_path
    end

    it 'can be deleted from index page' do
      click_link "delete_#{ @post.id }"
      expect(page.status_code).to eq(200)
    end
  end
end
