


  shinyServer(function(input,output){
    output$caption<-renderText({
      "Asian Call & Asian Put"
    })
    output$price<-renderText({
      myasian("r","sigma","s0","radio","k","t")
    })
