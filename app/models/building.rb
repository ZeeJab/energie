# == Schema Information
#
# Table name: buildings
#
#  id            :integer          not null, primary key
#  building_type :string(255)
#  zipcode       :integer
#  lat           :decimal(, )
#  long          :decimal(, )
#  kwh           :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Building < ActiveRecord::Base
  
end
