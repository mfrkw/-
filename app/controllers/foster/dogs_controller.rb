class Foster::DogsController < ApplicationController
  
  def index
    @dogs = Dog.all
  end 
  
  def new 
    @dog = Dog.new
  end 
  
  def create
  end
  
  def thanx
  end
  
  
end
