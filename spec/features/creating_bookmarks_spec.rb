feature 'adding a new bookmark' do
    scenario ' a user can add a bookmark to Bookmark Manager' do
        visit('/bookmarks/new')
        fill_in('url', with: "http://www.example.com")
        click_button('Submit')

        expect(page).to have_content "http://www.example.com"
    end
end