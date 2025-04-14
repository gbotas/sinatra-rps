require "sinatra"
require "sinatra/reloader"

get("/") do
 erb(:homepage)
end


get("/rps/:hand") do
  @hand = params.fetch("hand")

  moves = ["rock", "paper", "scissors"]

  @comp_move = moves.sample

  if !["rock", "paper", "scissors"].include?(@hand) 
    @outcome = "lost. Our move was not valid!"
  elsif @comp_move == @hand
      @outcome = "tied"
  elsif (@comp_move == "paper" and @hand == "rock") || (@comp_move == "scissors" and @hand == "paper") || (@comp_move == "rock" and @hand == "scissors")
    @outcome = "lost"
  else 
    @outcome = "won"
  end 

  erb(:flexible)

end 


