class Attachment < ActiveRecord::Base
  dragonfly_accessor :file
  belongs_to :resource, polymorphic: true
end
