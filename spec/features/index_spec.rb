feature '/' do 

  scenario 'has instructions' do 
    visit "/"
    expect(page).to have_content 'Hi, please enter your name to play Rock Paper Scissors'
  end
  
  scenario 'accepts names for play computer' do 
    sign_in_and_play_computer
    expect(page).to have_content "What's your move #{RSPEC_TEST_PLAYER_0_NAME}:"
  end

end
