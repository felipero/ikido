    "Ikido is loading..." println
 
    Ikido = Origin mimic
    
    Ikido action = method(regexp, action, 
      IKanServe actionForPath(regexp, action)
    )

    FileSystem["classes/app/**/*controller.ik"] each(f, 
      use(f)
    )
