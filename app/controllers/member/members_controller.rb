class Member::MembersController < ApplicationController
  
  def show
    @member = Member.find(params[:id])
  end
  
  def edit 
    @member = Member.find(params[:id])
  end 
  
  def update
    member = Member.find(current_member.id)
    if member.update(member_params)
       flash[:success] = "登録情報を変更しました"
       redirect_to member_member_path
    else
      render :edit
    end
  end
  
  def out
  end 
  
  private
  def member_params
  params.require(:member).permit(:last_name, :first_name, :telephone_number, :postal_code, :address, :email)
  end
  
end
