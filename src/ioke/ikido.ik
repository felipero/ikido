"Ikido is loading..." println
 
Ikido = Origin mimic

Ikido dispatch = method(path,

  pathInfo = treatPath(path)

  result = Dict mimic

  bind(
    rescue(Condition Error Load, 
      fn(c, 
	result = {status: 404, headers:{contentType:"text/html"}, content:"404: Resource not found."}
      )
    ),
    use("../../test/_controllers/#{pathInfo[:controller]}_controller.ik")

    result = {status: 200, headers: {contentType:"text/html"}, content:"The correct content from simple controller"}
  )

  result
)

Ikido treatPath = method(path,
  controller = path split("/")[0]
  action = path split("/")[1]
  {controller: controller, action: action}
)