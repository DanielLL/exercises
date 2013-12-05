class User < ActiveRecord::Base
  validates_presence_of :name, :last_name, :mail, :password

end
