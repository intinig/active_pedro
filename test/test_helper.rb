module TestHelper
  def deny(assertion, message = nil)
    if message
      assert !assertion, message
    else
      assert !assertion
    end
  end
end