


  shinyServer(function(input,output){
    output$caption<-renderText({
      "Asian Call & Asian Put"
    })
    output$price<-rendertext({
     myasian(input$r,input$sigma,input$s0,input$radio,input$k,input$t)
    })
