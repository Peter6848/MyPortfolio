class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end

def get_facebook_messages
  begin
    contacts_fb
    @messages = retrieves_messages
  rescue => e
    flash[:error] = "Error contacting facebook: #{e}"
  end
end
