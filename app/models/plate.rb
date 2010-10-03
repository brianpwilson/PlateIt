class Plate < ActiveRecord::Base
  validates_presence_of     :plateId
  validates_presence_of     :state  
    
  def does_it_exist?
    plate = Plate.find( :first, :conditions => { :state => [state], :plateId =>[plateId] } )
    plate != nil
  end
  
  def find_plate
    plate = Plate.find( :first, :conditions => { :state => [state], :plateId =>[plateId] } )
  end
end
