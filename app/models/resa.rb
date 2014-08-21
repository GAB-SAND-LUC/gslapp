class Resa < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user

  include AASM

  aasm column: :state do
    state :pending, :initial => true
    state :accepted
    state :denied

    event :accepted do
      transitions :from => :pending, :to => :accepted
    end

    event :denied do
      transitions :from => :pending, :to => :denied
    end

  end

end
