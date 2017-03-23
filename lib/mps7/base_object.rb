require 'active_model'

# BaseObject parent for all objects requiring validation and special to_hash
# method for logging / debugging purposes
class BaseObject
  include ActiveModel::Validations

  def to_h
    self.instance_variables.reject{|key| [:@validation_context, :@errors]
        .include? key }
        .each_with_object({}) {
          |e,a| a[e.to_s.tr('@','')] = self.instance_eval(e.to_s)
        }
  end
end
