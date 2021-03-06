class Messagephoto < ActiveRecord::Base

  include Nali::Model

  belongs_to :message, inverse_of: :messagephotos
  belongs_to :photo,   inverse_of: :messagephotos
  has_one    :dialog,  through: :message

  validates :message_id, numericality: { only_integer: true }
  validates :photo_id,   numericality: { only_integer: true }

  def access_level( client )
    return :contact if user = client[ :user ] and self.dialog.users.include?( user )
    :unknown
  end

end
