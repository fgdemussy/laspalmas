class Raider < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  validates :acceptedTerms, acceptance: {accept: true}
  validates :name, :lastName, :rut, :email, :birthdate, :city, presence: true
  validates :email, email: true
  validates :rut, uniqueness: true, rut: true

  has_many :visits, dependent: :destroy
  belongs_to :city

  before_validation :correct_rut_format

  # Pagination
  self.per_page = 100

  def rut_to_human
    r = self.rut
    check_digit = r.last
    r = r.chop
    r = r.to_i
    r = number_with_delimiter(r, :delimiter => ".")
    r.to_s()+"-"+check_digit
  end

  private
  def correct_rut_format
    self.rut.gsub!(/[-]|[.]|\s/, "") unless rut.nil?
  end
end
