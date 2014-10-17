class Post < ActiveRecord::Base
  belongs_to :user

  # scopes
  scope :for_index, -> { self
    .includes(:user)
    .as_json({
      methods: :user
    })
  }

end
