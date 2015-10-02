


  shinyServer(function(input,output){
    output$caption<-renderText({
      "Asian Call & Asian Put"
    })
    output$price<-rendermyasian({
      data.frame(input$r,input$sigma,input$s0,input$radio,input$k,input$t)
    })
