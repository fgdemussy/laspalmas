class Raider < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  validates :acceptedTerms, acceptance: {accept: true}
  validates :name, :lastName, :rut, :email, :birthdate, presence: true
  validates :email, email: true
  validates :rut, uniqueness: true, rut: true


  before_validation :correct_rut_format

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
