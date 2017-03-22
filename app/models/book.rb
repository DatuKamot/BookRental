class Book < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	
	validates :title, presence:true, format: {with: /[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]/}
	validates :author, presence:true, format: {with: /[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]/}
	validates :price, presence:true, numericality: { only_integer: true }
	validates :description, presence:true
	validates :created_at, presence:true
	validates :updated_at, presence:true
	validates :user_id, presence:true
	validates :book_img_file_name, presence:true
	validates :book_img_file_size, presence:true
	validates :book_img__updated_at, presence:true

	has_attached_file :book_img, styles: { book_index: "300x300>", book_show: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/

  #has_attached_file :book_img, :styles => { :book_index => "250x350>", :book_show => "325x475>" }, :default_url "/images/:style/missing.png"
  #validates_attachment_content_type :book_img, :content_type => /\Aimage\/.*\Z/
end
