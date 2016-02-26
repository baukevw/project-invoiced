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

class Invoice < ActiveRecord::Base
  # Relations
  has_many :activities
  belongs_to :client
  belongs_to :user


  accepts_nested_attributes_for :activities
end
