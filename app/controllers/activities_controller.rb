# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  invoice_id   :integer
#  description  :text
#  amount       :integer
#  price_ex_fat :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ActivitiesController < ApplicationController

  def destroy
    @activity = Activity.find(params[:id])
    redirect_to invoices_path if @activity.destroy
  end

end
