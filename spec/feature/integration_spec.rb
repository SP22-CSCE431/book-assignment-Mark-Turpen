
# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    fill_in 'Price', with: 10
    select '2021',:from => 'book_date_1i'
    select 'March',:from => 'book_date_2i'
    select '13',:from => 'book_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('jk rowling')
    expect(page).to have_content(10)
    expect(page).to have_content('2021')
    expect(page).to have_content('13')
    expect(page).to have_content('3') #march is the 3rd month
  end
end


