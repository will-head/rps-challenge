feature '/play' do

  scenario 'shows player names' do
	   sign_in_and_play_computer
	   expect(page).to have_content "#{RSPEC_TEST_PLAYER_0_NAME} vs #{RSPEC_TEST_COMPUTER_NAME}"
  end

  scenario 'asks user for move' do
  	 sign_in_and_play_computer
  	 expect(page).to have_content "What's your move #{RSPEC_TEST_PLAYER_0_NAME}:"
  	 expect(page).to have_button("🗿")
  	 expect(page).to have_button("📄")
  	 expect(page).to have_button("✂")
  end

end
