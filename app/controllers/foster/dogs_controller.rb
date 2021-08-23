class Foster::DogsController < ApplicationController
  before_action :authenticate_foster!

  def index
    @dogs = Dog.All
  end

  def show
    @dog = Dog.All.find_by(id: params[:id])
    if @dog == nil
      redirect_to foster_dogs_path, error: '存在しないidです。'
    end
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.foster_id = current_foster.id
    if @dog.save
    redirect_to  thanx_foster_dogs_path
    else
      render :new, notice: '登録に失敗しました'
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    dog = Dog.find(params[:id])
    dog.update!(dog_params)
    redirect_to foster_dog_path(dog.id), notice: '変更しました'
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to foster_dogs_path, notice: '削除しました'
  end

  def thanx
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :area, :image, :introduction, :dog_breed, :foster_id)
  end


end
