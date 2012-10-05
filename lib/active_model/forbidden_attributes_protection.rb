module ActiveModel
  class ForbiddenAttributes < StandardError
  end

  module ForbiddenAttributesProtection
    def sanitize_for_mass_assignment(new_attributes, options = {})
      return super if !new_attributes.respond_to?(:permitted?)
      return new_attributes if new_attributes.permitted?
      raise ActiveModel::ForbiddenAttributes
    end
  end
end

ActiveModel.autoload :ForbiddenAttributesProtection
