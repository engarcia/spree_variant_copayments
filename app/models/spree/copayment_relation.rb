module Spree
  class CopaymentRelation < ActiveRecord::Base
    belongs_to :relatable, class_name: 'Spree::Variant', touch: true
    belongs_to :related_to, class_name: 'Spree::Variant'

    validates :relatable, :related_to, presence: true

    validates :relatable_id, uniqueness: { scope: [:related_to_id] }

    scope :active, -> { where(active: true) }
    scope :with_discount, -> { where('discount_amount <> 0.0') }
  end
end
