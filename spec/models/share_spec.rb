# == Schema Information
#
# Table name: shares
#
#  id           :integer          not null, primary key
#  from_user_id :integer
#  to_user_id   :integer
#  to_email     :string
#  created_at   :datetime         not null
#  url          :string
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Share, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
