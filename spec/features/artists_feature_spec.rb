require 'rails_helper'

describe "ArtistsFeature", type: :view do
  context 'when editing the artist info from the dashboard' do
    it "displays the form on the edit page" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist)
      expect(page.find_field('artist_color_palette')).to be_visible
      expect(page.find('li.selected').text).to eq 'Header'
    end

    it "displays the form on the .layout page when coming from the edit page" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist)
      click_link "Layout"
      expect(page.find_field('artist_layout')).to be_visible
      expect(page.find('li.selected').text).to eq 'Layout'
    end

    it "refreshes the header section via ajax when coming from another section" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist)
      click_link "Layout"
      click_link "Header"
      expect(page.find_field('artist_color_palette')).to be_visible
      expect(page.find('li.selected').text).to eq 'Header'
    end

    it "displays the form on the .layout page properly through html and not just js" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :layout)
      expect(page.find_field('artist_layout')).to be_visible
      expect(page.find('li.selected').text).to eq 'Layout'
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
      click_link "+ Add collection"
      expect(page).to have_field('Name')
      click_link "< Back"
      expect(page.find('li.selected').text).to eq 'Artworks'
      expect(page).to have_text artist.collections.sample.name
    end

    it "lets you add a collection from the new collection form" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :artworks)
      click_link "+ Add collection"
      fill_in 'Name', with: 'Test Name'
      click_button 'Save'
      expect(page.find('li.selected').text).to eq 'Artworks'
      expect(page).to have_text 'Test Name'
    end

    it "displays errors for an invalid input to the new collection form" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :artworks)
      click_link "+ Add collection"
      click_button 'Save'
      expect(page).to have_text 'blank'
    end

    it "displays the .links page properly through html and not just js" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :links)
      expect(page.find('li.selected').text).to eq 'Links'
    end

    it "displays the add link form from the .links page via ajax" do
      login_admin
      artist = create(:artist)
      visit edit_artist_path(artist, stage: :links)
      click_link "+ Add link"
      expect(page).to have_field('Title')
      click_link "< Back"
      expect(page.find('li.selected').text).to eq 'Links'
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
      expect(page.find('li.selected').text).to eq 'Links'
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
  end
end
