class InfoController < ApplicationController

    def showFrom
        @amount_from_Kyiv = find_parcels_from_city
    end

    def showValue
        @amount_above_value = find_parcels_with_value_amount
        @list_of_cities = find_parcels_with_value_list
    end

    def showRepeated
        @list_of_addressees = find_multiple_deliveries
    end

    def find_parcels_from_city()
        array = Parcel.all
        res = array.select {|i| i.city == "Kyiv"}
        res.size
    end
      
    def find_parcels_with_value_amount()
        array = Parcel.all
        res = array.select {|i| i.value > 1000}.map{|i| i.city}
        res.size
    end

    def find_parcels_with_value_list()
        array = Parcel.all
        res = array.select {|i| i.value > 1000}.map{|i| i.city}
        res.uniq
    end
      
    def find_multiple_deliveries()
        addresses = Hash.new(0)
        parcels = Parcel.all
        parcels.each do |parcel|
          addressee = "#{parcel.city}-#{parcel.street}-#{parcel.house}-#{parcel.appartment}"
          addresses[addressee] += 1
        end
        addresses.select{ |_, count| count > 1}
    end  
end
