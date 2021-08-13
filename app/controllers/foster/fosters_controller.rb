class Foster::FostersController < ApplicationController

  def show
    @foster = Foster.find(params[:id])
  end

  def edit
    @foster = Foster.find(params[:id])
  end

  def update
    foster = Foster.find(current_foster.id)
    if foster.update(foster_params)
      redirect_to foster_foster_path, notice: '変更しました'
    else
      render :edit
    end
  end

  def out
    @foster = Foster.find(current_foster.id)
    @foster.update(is_deleted)
  end


  private
  def foster_params
    params.require(:foster).permit(:last_name, :first_name, :telephone_number, :postal_code, :address, :email)
  end

end
