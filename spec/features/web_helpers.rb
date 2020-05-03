RSPEC_TEST_PLAYER_0_NAME = "Siegfried"
RSPEC_TEST_PLAYER_1_NAME = "Roy"
RSPEC_TEST_COMPUTER_NAME = "Computer"

# def sign_in_and_play
#   visit "/"
#   fill_in :player_0_name, with: RSPEC_TEST_PLAYER_0_NAME
#   click_button 'Play'
# end 

def sign_in_player_0
  visit "/"
  fill_in :player_0_name, with: RSPEC_TEST_PLAYER_0_NAME
end

def sign_in_player_1
  # visit "/"
  fill_in :player_1_name, with: RSPEC_TEST_PLAYER_1_NAME
end

def sign_in_and_play_computer
  sign_in_player_0
  click_button 'Play Computer'
  # expect(page).to have_content "What's your move #{RSPEC_TEST_PLAYER_0_NAME}:"
  # expect(page).to have_button("🗿")
  # expect(page).to have_button("📄")
  # expect(page).to have_button("✂")
end

def sign_in_humans
  sign_in_player_0
  click_button 'Play Human'
  sign_in_player_1
end

def play_humans
  click_button 'Play'  
end

def sign_in_and_play_humans
  sign_in_humans
  play_humans
end
