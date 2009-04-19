"Ikido is loading..." println
 
Ikido = Origin mimic

Ikido dispatch = method(path,

  pathInfo = treatPath(path)

;  result = {status: 404, headers:{contentType:"text/html"}, content:"404: Resource not found."}
  result = Dict mimic

  nonExistentAction = false

  bind(
    handle(Condition Error Load, 
      fn(c, 
	result = {status: 404, headers:{contentType:"text/html"}, content:"404: Resource not found."}. ;"No such controller defined" println
	nonExistentAction = true
	invokeRestart(:ignoreLoadError)
      )
    ),

    use("../../test/_controllers/#{pathInfo[:controller]}_controller.ik")
  )

  unless(nonExistentAction,
    result = {status: 200, headers: {contentType:"text/html"}, content:"The correct content from simple controller"}
  )

  result
)

Ikido treatPath = method(path,
  controller = path split("/")[0]
  action = path split("/")[1]
  {controller: controller, action: action}
)