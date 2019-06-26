require 'rails_helper'

describe "ArtistsFeature", type: :view do
  it "displays the form on the edit page" do
    login_admin
    artist = create(:artist)
    visit edit_artist_path(artist)
    expect(page.find_field('artist_color_palette')).to be_visible
    expect(page.find('li.selected').text).to eq 'Header'
  end

  it "displays the form on the layout page when coming from the edit page" do
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

  it "displays the form on the layout page properly through html and not just js" do
    login_admin
    artist = create(:artist)
    visit layout_artist_path(artist)
    expect(page.find_field('artist_layout')).to be_visible
    expect(page.find('li.selected').text).to eq 'Layout'
  end

  it "displays fields for the resume blocks" do
    login_admin
    artist = create(:artist)
    visit layout_artist_path(artist)
    expect(page).to have_field('Title')
  end

  it "displays fields for the resume items" do
    login_admin
    artist = create(:artist)
    visit layout_artist_path(artist)
    expect(page).to have_field('Description')
  end
end
