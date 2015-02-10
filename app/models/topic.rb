class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :is_public, -> { where(public: true) }
  scope :is_private, -> { where(public: false) }
  scope :visible_to, -> (user) { user ? all : public }
end