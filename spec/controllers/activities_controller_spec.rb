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

require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do

end
