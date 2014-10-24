class Post < ActiveRecord::Base
  dragonfly_accessor :file   # defines a reader/writer for image
  belongs_to :user
  has_many :attachments, as: :resource

  # scopes
  scope :for_index, -> { self
    .includes(:user,:attachments)
    .as_json({
      methods: [ 
        :user,
        :attachments_attributes
      ]
    })
  }

  def self.show_data(id, scope_name)
    self.find(id).as_json({
      methods: [ 
        :attachments_attributes
      ]
    })
  end

  def attachments_attributes
    self.attachments.as_json
  end


end
