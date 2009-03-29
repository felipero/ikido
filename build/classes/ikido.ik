"Ikido is loading..." println
    Ikido = Origin mimic
    
    Ikido action = method(regexp, action, 
      IKanServe actionForPath(regexp, action)
    )

    use("app/simple_controller")