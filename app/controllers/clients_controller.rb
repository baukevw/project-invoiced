# == Schema Information
#
# Table name: clients
#
#  id            :integer          not null, primary key
#  client_number :integer
#  name          :string
#  street        :string
#  number        :integer
#  zipcode       :string
#  city          :string
#  url           :string
#  email         :string
#  company_name  :string
#  phone         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:edit, :show, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
      flash[:notice] = :saved
    else
      redirect_to new_client_path

      @client.errors.messages.each do |c|
        flash[:alert] = c[1].first
      end
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path
      flash[:notice] = :saved
    else
      @client.errors.messages.each do |c|
        flash[:alert] = c[1].first
      end
      render :edit
    end
  end

  def destroy
    redirect_to clients_path if @client.destroy
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :street, :number, :zipcode, :city,
                                   :url, :email, :company_name, :phone,
                                   :client_number)
  end

end
