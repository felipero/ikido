  use("ispec")
  use("ikido")
;  use("Controller")

describe("Ikido",
  describe("dispatch",
    describe("result's",
      it("should be a Dict",
	Ikido dispatch("/nonExistent/action") should have kind ("Dict")
      )

      it("should have 3 elements",
	Ikido dispatch("/nonExistent/action") size should == 3
      )

      it("should have a Number Rational for status",
	Ikido dispatch("/nonExistent/action")[:status] should have kind ("Number Rational")
      )

      it("should have a Dict for headers",
	Ikido dispatch("/nonExistent/action")[:headers] should have kind ("Dict")
      )

      it("should have a Text for content",
	Ikido dispatch("/nonExistent/action")[:content] should have kind ("Text")
      )
    )

    describe("result's values for non existent action/controller",
      it("should have a status 404",
	Ikido dispatch("/nonExistent/action")[:status] should == 404
      )

      it("should have the correct headers",
	headers = Ikido dispatch("/nonExistent/action")[:headers]
	headers[:contentType] should == "text/html"
      )

      it("should have '404: Resource not found.' as content",
	Ikido dispatch("/nonExistent/action")[:content] should == "404: Resource not found."
      )
    )
  )
;      it("should find activate the cell corresponding to the requested action",
;	use("_controllers/simple_controller.ik")
;	Ikido dispatch("/simple/action") should
;      )
)