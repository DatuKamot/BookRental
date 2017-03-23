class ReservationsController < ApplicationController
	before_action :find_book
	before_action :find_reservation, only: [:edit, :update, :destroy]
	
	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.book_id = @book.id
		@reservation.user_id = current_user.id

		if @reservation.save
			redirect_to book_path(@book)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @reservation.update(reservation_params)
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		@reservation.destroy
		redirect_to book_path(@book)
	end



	private

		def reservation_params
			params.require(:reservation).permit(:name, :email, :address, :contact_nmber, :date_of_reservation)
		end

		def find_book
			@book = Book.find(params[:book_id])
		end

		def find_reservation
			@reservation = Reservation.find(params[:id])
		end
	end
