  use("ispec")
  use("ikido")
  use("controller")

describe("Ikido",
  describe("dispatch",
    describe("result",
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
    describe("result's values for existent action/controller",

      it("should have a status 200",
;	use("_controllers/simple_controller.ik")
	Ikido dispatch("/simple/action")[:status] should == 200
      )

      it("should have the correct headers",
	headers = Ikido dispatch("/simple/action")[:headers]
	headers[:contentType] should == "text/html"
      )

      it("should have the correct content",
	Ikido dispatch("/simple/action")[:content] should == "The correct content from simple controller"
      )
    )
  )

  describe("treatPath",
    it("result should be a Dict",
      Ikido treatPath("/my/action") should have kind ("Dict")
    )      
    
    describe("result for a valid path",
      it("should have the correct controller",
	Ikido treatPath("/my/action") [:controller] should == "my"
      )

      it("should have the correct action",
	Ikido treatPath("/my/action")[:action] should == "action"
      )

      it("should have the correct id",
	Ikido treatPath("/my/action/foo")[:id] should == "foo"
	Ikido treatPath("/my/action/3")[:id] should be == 3
      )

      it("should have the right size of elements",
	Ikido treatPath("/my/action") size should == 2
	Ikido treatPath("/my/action/3") size should == 3
      )
    )
  )
)