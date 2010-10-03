class Post < ActiveRecord::Base
  # validates_presence_of     :plateId
  # validates_presence_of     :state
  # validates_presence_of     :message
  
  def plateId
    @plateId
  end
  
  def plateId=(plate)
    @plateId = plate
  end
  
  def state
    @state
  end
  
  def state=(stateToUse)
    @state = stateToUse
  end
end
