class Place < ActiveRecord::Base
  require 'unicode'

  has_many :employments, :dependent => :delete_all
  has_many :people, :through => :employments

  validates_presence_of :name
  validates_format_of :web_address, :with => /^(http|https):\/\/?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :message => "er ugyldig (skal indeholde 'http').", :allow_blank => true
  
  def to_param
    id.to_s+"-"+(Unicode::normalize_KD(name).gsub(/[Ææ]/,'ae').gsub(/[Øø]/,'o').downcase.gsub(/[^a-z0-9\s_-]+/,'').gsub(/[\s_-]+/,'-'))
  end

end
