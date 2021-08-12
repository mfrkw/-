class Foster::DogsController < ApplicationController
  
  def index
    @dogs = Dog.all
  end 
  
  def show
    @dog = Dog.find(params[:id])
  end 
  
  def new 
    @dog = Dog.new
  end 
  
  def create
    dog = Dog.new(dog_params)
    if dog.save
    redirect_to  thanx_foster_dogs_path
    else
      render :new
    end 
  end
  
  def edit 
    @dog = Dog.find(params[:id])
  end
  
  def update
    dog = Dog.find(params[:id])
    dog.update!(dog_params)
    redirect_to foster_dog_path(dog.id)
  end 
  
  def thanx
  end
  
  private
  
  def dog_params
    params.require(:dog).permit(:name, :area, :image, :introduction, :dog_breed)
  end
    
  
end
