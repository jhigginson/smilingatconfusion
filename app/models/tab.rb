class Tab < ActiveRecord::Base
  acts_as_commentable
  belongs_to :album
  belongs_to :artist
  belongs_to :tuning
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates_presence_of :body, :artist, :tuning
end
