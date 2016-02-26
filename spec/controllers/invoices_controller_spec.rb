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

require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do

end
