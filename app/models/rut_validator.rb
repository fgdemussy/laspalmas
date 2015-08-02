class	RutValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value.nil?
      # FGM: Check Digit
  		check_digit = value.reverse[0].to_s.capitalize == "K" ? value.reverse[0].to_s.capitalize : value.reverse[0].to_i

  		if check_digit == "K"
  		  value = value.gsub /[-]|[.]/, ""
      else
    		value = value.gsub /\D|[.]/, ""
      end

      # FGM: Validate rut without check_digit (chop)
  		record.errors[attribute] << (options[:message] || "is invalid") unless [*0..9,'K',0][11-(value.chop.reverse.split'').reduce([0,0]){|x,y|[x[0]+1,x[1]+y.to_i*(x[0]%6+2)]}[1]%11] == check_digit
  		record.errors[attribute] << (options[:message] || "is invalid") if value.length < 2
    end
	end
end
