Ikido simple =  Controller mimic do (

  notActivatableCell = "someValue"

  action = method(
    render("The correct content from simple controller")
  )

  foo = method(
    render("This is the foo content")
  )

  bar = method(
    "This is the bar content without the render method"
  )
)