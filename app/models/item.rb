class Item < ApplicationRecord
  validates :name, presence: true
  validates :level, presence: true
  validates :category, presence: true

  def self.check_db(ankama_id)
    where(ankama_id: ankama_id).first
  end
end
