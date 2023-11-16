class Parcel < ApplicationRecord
    validates :city, presence: true 
    validates :street, presence: true 
    validates :house, presence: true
    validates :appartment, presence: true
    validates :addressee, presence: true
    validates :value, presence: true
end
