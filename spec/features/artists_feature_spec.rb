require 'rails_helper'

describe "ArtistsFeature", type: :view do
  context 'when editing the artist info from the dashboard' do
    it "displays the form on the edit page" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist)
      expect(page.find_field('artist_super_title')).to be_visible
      expect(page.find('li.selected').text).to eq 'Header'
    end

    it "displays the form on the .layout page when coming from the edit page" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist)
      click_link "Resume"
      expect(page.find('li.selected').text).to eq 'Resume'
    end

    it "refreshes the header section via ajax when coming from another section" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist)
      click_link "Resume"
      click_link "Header"
      expect(page.find_field('artist_button_text')).to be_visible
      expect(page.find('li.selected').text).to eq 'Header'
    end

    it "displays the form on the .layout page properly through html and not just js" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :layout)
      expect(page.find('li.selected').text).to eq 'Resume'
    end

    it "displays fields for the resume blocks" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :layout)
      expect(page).to have_field('Title')
    end

    it "displays fields for the resume items" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :layout)
      expect(page).to have_field('Description')
    end

    it "refreshes the artworks section via ajax when coming from another section" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist)
      click_link "Artworks"
      expect(page.find('li.selected').text).to eq 'Artworks'
    end

    it "displays the .artworks page properly through html and not just js" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :artworks)
      expect(page.find('li.selected').text).to eq 'Artworks'
    end

    it "displays the add collection form from the .artworks page via ajax" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :artworks)
      click_link "+ Add series"
      expect(page).to have_field('Name')
      click_link "< Back"
      expect(page.find('li.selected').text).to eq 'Artworks'
      expect(page).to have_text artist.collections.sample.name
    end

    it "lets you add a collection from the new collection form" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :artworks)
      click_link "+ Add series"
      fill_in 'Name', with: 'Test Name'
      click_button 'Save'
      expect(page.find('li.selected').text).to eq 'Artworks'
      expect(page).to have_text 'Test Name'
    end

    it "displays errors for an invalid input to the new collection form" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :artworks)
      click_link "+ Add series"
      click_button 'Save'
      expect(page).to have_text 'blank'
    end

    it "displays the .links page properly through html and not just js" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :links)
      expect(page).to have_text 'Links'
    end

    it "displays the add link form from the .links page via ajax" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :links)
      click_link "+ Add link"
      expect(page).to have_field('Title')
      click_link "< Back"
      expect(page).to have_text 'Links'
      expect(page).to have_text artist.links.sample.title
    end

    it "lets you add a link from the new link form" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :links)
      click_link "+ Add link"
      fill_in 'Title', with: 'Test Title'
      fill_in 'Description', with: 'Test Description'
      fill_in 'Url', with: 'http://www.apple.com'
      fill_in 'Year', with: '2019'
      click_button 'Save'
      expect(page).to have_text 'Links'
      expect(page).to have_text 'Test Title'
    end

    it "displays errors for an invalid input to the new link form" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :links)
      click_link "+ Add link"
      click_button 'Save'
      expect(page).to have_text 'blank'
    end

    it "displays the .upcoming_projects page properly through html and not just js" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :upcoming_projects)
      expect(page).to have_text 'Projects'
    end

    it "displays the add upcoming_project form from the .upcoming_projects page via ajax" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :upcoming_projects)
      click_link "+ Add upcoming project"
      expect(page).to have_field('Title')
      click_link "< Back"
      # expect(page.find('li.selected').text).to eq 'Upcoming Projects'
      expect(page).to have_text artist.upcoming_projects.sample.title
    end

    it "lets you add a upcoming_project from the new upcoming_project form" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :upcoming_projects)
      click_link "+ Add upcoming project"
      fill_in 'Title', with: 'Test Title'
      fill_in 'Description', with: 'Test Description'
      fill_in 'Location', with: 'A city near you'
      fill_in 'Date', with: '2019'
      click_button 'Save'
      # expect(page).to have_text 'Links'
      expect(page).to have_text 'Test Title'
    end

    it "displays errors for an invalid input to the new upcoming_project form" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :upcoming_projects)
      click_link "+ Add upcoming project"
      click_button 'Save'
      expect(page).to have_text 'blank'
    end

    it "properly updates when you enter new information into the .header page" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist)
      fill_in 'Super title', with: 'Test Super Title'
      fill_in 'Description', with: 'Test Description'
      fill_in 'Button text', with: 'Calls to action are important'
      click_button 'Save'
      expect(page.find('li.selected').text).to eq 'Header'
      expect(page).to have_field('Super title', with: 'Test Super Title')
    end

    it "shows the artwork list when navigating to a collection page" do
      login_admin
      artist = create(:artist)
      collection = artist.collections.sample
      artwork = collection.artworks.sample
      visit edit_artist_path(artist, stage: :artworks)
      click_link collection.name
      expect(page).to have_field 'Name'
      expect(page).to have_text artwork.name
    end
  end
end
