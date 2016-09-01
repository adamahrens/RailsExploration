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
      @post = FactoryGirl.create(:first_post)
    end

    it 'can be reached by clicking edit on index path' do
      visit posts_path
      click_link "edit_#{ @post.id }"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'I need to visit the vet'
      click_on 'Save'
      expect(User.last.posts.last.rationale).to eq('I need to visit the vet')
    end
  end

  describe 'deleting' do
    before do
      @post = FactoryGirl.create(:first_post)
      visit posts_path
    end

    it 'can be deleted from index page' do
      click_link "delete_#{ @post.id }"
      expect(page.status_code).to eq(200)
    end
  end
end
