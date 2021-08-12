class Foster::DogsController < ApplicationController
  
  def index
    @dogs = Dog.all
  end 
  
  def show
  end 
  
  def new 
    @dog = Dog.new
  end 
  
  def create
    dog = Dog.new(dog_params)
    dog.save
    redirect_to  thanx_foster_dogs_path
    
  end
  
  def thanx
  end
  
  private
  
  def dog_params
    params.require(:dog).permit(:name, :area, :image, :introduction, :dog_breed)
  end
    
  
end
