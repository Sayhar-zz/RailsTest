class Bottle < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user
	
	def self.recent
	  puts '***recent' 
	  #SAHAR - WORK FROM HERE. 
	  #ALSO- do nearbylocation
  end
  
  
end
