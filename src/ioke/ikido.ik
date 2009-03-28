"Ikido is loading..." println

    use("app/simple_controller")

    Ikido = Origin mimic
    
    Ikido action = method(regexp, action, 
      "adding action" println
      IKanServe actionForPath(regexp, action)
    )
