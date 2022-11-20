class Crawler < ApplicationRecord
    # belongs_to :category
    scope :lt_10000, -> { where("price < 10000") }
    validates_format_of :url, :with => /https?:\/\/[\S]+/, length: {minimum: 8}, message: "Invalid url format"
end
