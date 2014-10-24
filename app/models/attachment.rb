class Attachment < ActiveRecord::Base
  dragonfly_accessor :file
  belongs_to :resource, polymorphic: true
  validate :resource_limit

  def resource_limit
    if self.resource.attachments.length > 5
      errors.add(:attachments_limit, "can't have more than 5 attachments")
    end
  end
end
