# == Schema Information
#
# Table name: invoices
#
#  id         :integer          not null, primary key
#  number     :integer
#  date       :date
#  client_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:edit, :show, :update, :destroy]

  def index
    @invoices = Invoice.where(user_id: current_user).all
  end

  def show
  end

  def new
    @invoice = Invoice.new
    @clients = Client.all
    @activity = Activity.new
    @invoice.activities.build
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user_id = current_user.id

    if @invoice.save
      redirect_to invoices_path
      flash[:notice] = :saved
    else
      redirect_to new_invoice_path

      @invoice.errors.messages.each do |c|
        flash[:alert] = c[1].first
      end
    end
  end

  def edit
    @clients = Client.all
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to invoices_path
      flash[:notice] = :saved
    else
      @invoice.errors.messages.each do |c|
        flash[:alert] = c[1].first
      end
      render :edit
    end
  end

  def destroy
    redirect_to invoices_path if @invoice.destroy
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:number, :date, :client_id, :user_id,
                                    activities_attributes: [ :id, :description,
                                                             :amount,
                                                             :price_ex_fat ])
  end
end
