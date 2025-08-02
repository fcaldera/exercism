class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  
  class UnsupportedOperation < StandardError 
  end

  def self.calculate(first_operand, second_operand, operation)
    if not (ALLOWED_OPERATIONS.include?(operation)) 
      raise UnsupportedOperation.new
    end

    if !first_operand.is_a?(Numeric) or !second_operand.is_a?(Numeric) 
      raise ArgumentError.new
    end
  
    result = "#{first_operand} #{operation} #{second_operand} = "
    if operation == "+" 
      result + "#{first_operand + second_operand}"
    elsif operation == "/"
        begin
          result + "#{first_operand / second_operand}"
        rescue ZeroDivisionError 
          "Division by zero is not allowed."
        end
    elsif operation = "*"
      result + "#{first_operand * second_operand}"
    end
  end
end
