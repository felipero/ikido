"Ikido is loading..." println
 
Ikido = Origin mimic

Ikido basePath = "classes/app"

Ikido dispatch = method(path,

  pathInfo = treatPath(path)

  result = Dict mimic

  bind(
    rescue(Condition Error Load, 
      fn(c, 
	result = {status: 404, headers:{contentType:"text/html"}, content:"404: Resource not found."}
      )
    ),
    use(self basePath + "controllers/#{pathInfo[:controller]}_controller.ik")
    result = {status: 200, headers: {contentType:"text/html"}, content:"The correct content from simple controller"}
  )

  result
)

Ikido treatPath = method(path,

  pathParts = path split("/")

  controller = pathParts[0]
  action = pathParts[1]
  routes = {controller: controller, action: action}

  if(pathParts length > 2,
    routes[:id] = pathParts[2]
  )

  routes
)