class Post < ActiveRecord::Base
  dragonfly_accessor :image   # defines a reader/writer for image
  belongs_to :user
  has_many :attachments, as: :resource, dependent: :destroy
  validates :title, presence: true
  validate :attachments_count
 
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

  def attachments_count
    if self.attachments.length > 5
      errors.add(:attachments_limit, "can't have more than 5 attachments")
    end
  end


end
