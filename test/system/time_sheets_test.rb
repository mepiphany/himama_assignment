require "application_system_test_case"

class TimeSheetsTest < ApplicationSystemTestCase
  setup do
    @time_sheet = time_sheets(:one)
  end

  test "visiting the index" do
    visit time_sheets_url
    assert_selector "h1", text: "Time Sheets"
  end

  test "creating a Time sheet" do
    visit time_sheets_url
    click_on "New Time Sheet"

    fill_in "Clock in", with: @time_sheet.clock_in
    fill_in "Clock out", with: @time_sheet.clock_out
    fill_in "Reason", with: @time_sheet.reason
    click_on "Create Time sheet"

    assert_text "Time sheet was successfully created"
    click_on "Back"
  end

  test "updating a Time sheet" do
    visit time_sheets_url
    click_on "Edit", match: :first

    fill_in "Clock in", with: @time_sheet.clock_in
    fill_in "Clock out", with: @time_sheet.clock_out
    fill_in "Reason", with: @time_sheet.reason
    click_on "Update Time sheet"

    assert_text "Time sheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Time sheet" do
    visit time_sheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time sheet was successfully destroyed"
  end
end
