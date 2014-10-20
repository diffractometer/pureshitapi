class Post < ActiveRecord::Base
  dragonfly_accessor :file   # defines a reader/writer for image
  belongs_to :user

  # scopes
  scope :for_index, -> { self
    .includes(:user)
    .as_json({
      methods: :user
    })
  }

end
