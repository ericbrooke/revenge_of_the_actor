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

FactoryGirl.define do
  factory :share do
    from_user_id 1
to_user_id 1
to_email "MyString"
created_at "2014-12-04 16:26:06"
url "MyString"
  end

end
