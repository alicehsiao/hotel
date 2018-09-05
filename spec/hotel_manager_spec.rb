require_relative 'spec_helper'

describe "HotelManager" do
  describe "#initialize" do
    it "Creates an instance of Hotel Manager" do
      my_hotel = Hotel::HotelManager.new
      expect(my_hotel).must_be_kind_of Hotel::HotelManager
    end

    it "Creates an array of rooms" do
      my_hotel = Hotel::HotelManager.new
      expect(my_hotel.rooms).must_be_kind_of Array
    end

    it "Keeps track of rooms" do
      my_hotel = Hotel::HotelManager.new

      expect(my_hotel).must_respond_to :rooms

      my_hotel.rooms.each_with_index do |room, i|
        expect(room.id).must_equal (i + 1)
        expect(room).must_be_kind_of Hotel::Room
      end
    end

    it "Creates an array of reservations" do
      my_hotel = Hotel::HotelManager.new
      expect(my_hotel.reservations).must_be_kind_of Array
    end


    # it "Keeps track of reservations" do
    #
    # end
  end

  describe "#reserve" do
    let (:check_in) {
      "2018-10-07"
    }
    let (:check_out) {
      "2018-10-16"
    }
    let (:my_hotel) {
      Hotel::HotelManager.new
    }

    it "Updates all reservations by creating a Reservation" do
      my_hotel.reserve(check_in, check_out)

      expect(my_hotel.reservations.last.check_in).must_equal Date.parse(check_in)
      expect(my_hotel.reservations.last.check_out).must_equal Date.parse(check_out)
    end

    it "raises a StandardError with invalid date range" do
    end
  end

  describe "#find_reservations_by_date" do
    it "Returns an array" do
      date = "2018-10-12"

      my_hotel = Hotel::HotelManager.new
      reservations = my_hotel.find_reservations_by_date(date)

      expect(reservations).must_be_kind_of Array
    end

    it "Returns an accurate count of Reservations" do
      date = "2018-10-12"
      reservation_one = Hotel::Reservation.new("2018-10-10", "2018-10-16", 1)
      reservation_two = Hotel::Reservation.new("2018-11-15", "2018-11-29", 1)
      reservation_three = Hotel::Reservation.new("2018-10-12", "2018-10-31", 1)

      my_hotel = Hotel::HotelManager.new
      my_hotel.reservations << reservation_one
      my_hotel.reservations << reservation_two
      my_hotel.reservations << reservation_three
      reservations = my_hotel.find_reservations_by_date(date)

      expect(reservations.length).must_equal 2

      reservations.each do |reservation|
        expect(reservation).must_be_kind_of Hotel::Reservation
      end
    end
  end

  # describe "#available_rooms" do
  #     let (:check_in) {
  #       "2018-10-07"
  #     }
  #     let (:check_out) {
  #       "2018-10-16"
  #     }
  #     let (:my_hotel) {
  #       Hotel::HotelManager.new
  #     }
  #
  #   it "returns an array of Rooms" do
  #     expect(my_hotel.available_rooms(check_in, check_out)).must_be_kind_of Array
  #   end
  #
  #   it "Returns an array full of Rooms" do
  #     my_hotel.rooms.each do |room|
  #       expect(room).must_be_kind_of Hotel::Room
  #     end
  #   end
  #
  #   it "Returns the correct number of rooms" do
  #     all_rooms = my_hotel.rooms
  #     all_rooms.first.calendar[Date.parse("2018-10-10")] = :UNAVAILABLE
  #     expect(my_hotel.available_rooms(check_in, check_out)).must_equal 19
  #   end


    # it "returns nil if there are no rooms available" do
    #   rooms.each do |room|
    #     room.calendar << Date.parse("2018-02-12")
    #   end
    #
    #   expect(open_rooms).must_be_nil
    # end

    # all_rooms = my_hotel.rooms
    # all_rooms.each do |room|
    #   room
    #
    # available_rooms = my_hotel.available_rooms(check_in, check_out)
end
