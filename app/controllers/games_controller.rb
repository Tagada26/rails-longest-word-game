require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
  end

  def score
    word_letters = params[:word].split("")
    # cacao
    letters = params[:letters].split("")
    # ['C', 'A' ... ]

    # declare an empty array
    answer_check = []
    word_letters.each do |letter|
      if word_letters.count(letter) == letters.count(letter)
        answer_check << true
      else
        answer_check << false
      end
    end

    if answer_check.uniq && answer_check[0] == true
      url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)
      if user["found"] == true
        return @english = "Congratulations ! #{params[:word]} is an english word !"
      else
        return @english = "Sorry but #{params[:word]} is not an english word "
      end
    else
      return @word_grid = "your word doesn't exit "
    end




      # check if word.count(letter) <= letters.count(letter)
      # if true push true in an array of answer
      # else
        # push false
      # end
    # ferme la boucle
    # take the array and check if array.uniq && array[0] == true



    raise

    # if check == false
    #   @message = " Sorry but you don't use the grid letter"
    # end
  end
end
