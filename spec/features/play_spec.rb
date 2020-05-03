feature '/play' do

  scenario 'shows player names' do
	   sign_in_and_play_computer
	   expect(page).to have_content "#{RSPEC_TEST_PLAYER_0_NAME} vs #{RSPEC_TEST_COMPUTER_NAME}"
  end

  scenario 'asks player_0 for move' do
  	 sign_in_and_play_computer
  end

  scenario 'asks player_0 and player_1 for moves' do
    sign_in_and_play_humans
    expect(page).to have_content "What's your move #{RSPEC_TEST_PLAYER_0_NAME}:"
    expect(page).to have_button("🗿")
    expect(page).to have_button("📄")
    expect(page).to have_button("✂")
    click_button '🗿'
    expect(page).to have_content "What's your move #{RSPEC_TEST_PLAYER_1_NAME}:"
    expect(page).to have_button("🗿")
    expect(page).to have_button("📄")
    expect(page).to have_button("✂")
    click_button '📄'
  end

end
