"Ikido is loading..." println
 
Ikido = Origin mimic

Ikido dispatch = method(path,
  {status: 404, headers:{contentType:"text/html"}, content:"404: Resource not found."}
;    FileSystem["classes/app/**/*controller.ik"] each(f, 
;      use(f)
;    )
)