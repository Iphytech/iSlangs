require "application_system_test_case"

class SlangsTest < ApplicationSystemTestCase
  setup do
    @slang = slangs(:one)
  end

  test "visiting the index" do
    visit slangs_url
    assert_selector "h1", text: "Slangs"
  end

  test "creating a Slang" do
    visit slangs_url
    click_on "New Slang"

    fill_in "Meaning", with: @slang.meaning
    fill_in "Slang", with: @slang.slang
    fill_in "Usage", with: @slang.usage
    click_on "Create Slang"

    assert_text "Slang was successfully created"
    click_on "Back"
  end

  test "updating a Slang" do
    visit slangs_url
    click_on "Edit", match: :first

    fill_in "Meaning", with: @slang.meaning
    fill_in "Slang", with: @slang.slang
    fill_in "Usage", with: @slang.usage
    click_on "Update Slang"

    assert_text "Slang was successfully updated"
    click_on "Back"
  end

  test "destroying a Slang" do
    visit slangs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slang was successfully destroyed"
  end
end
