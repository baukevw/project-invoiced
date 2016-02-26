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

class Client < ActiveRecord::Base
  # Relations
  has_many :invoices

  def select_option
    if company_name == ''
      "#{name}"
    else
      "#{company_name} - #{name}"
    end
  end
end
