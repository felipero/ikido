"Ikido is loading..." println
 
Ikido = Origin mimic

Ikido basePath = "classes/app"

Ikido dispatch = method(path,

  pathInfo = treatPath(path)

  result = Dict mimic

  bind(
    rescue(Condition Error Load, Condition Error NoSuchCell, 
      fn(c, 
	result = {status: 404, headers:{contentType:"text/html"}, content:"404: Resource not found."}
      )
    ),
    use(self basePath + "controllers/#{pathInfo[:controller]}_controller.ik")
;    use("#{self basePath}controllers/#{pathInfo[:controller]}_controller.ik") 

    controller = self cell(pathInfo[:controller]) mimic

    unless(controller cell?(pathInfo[:action]),
      error!(Condition Error NoSuchCell)
    )

    unless(controller cell(pathInfo[:action]) kind == "DefaultMethod",
      error!(Condition Error NoSuchCell)
    )

    content = Message fromText(pathInfo[:action]) sendTo(controller)      
    result = {status: 200, headers: {contentType:"text/html"}, content: content}
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