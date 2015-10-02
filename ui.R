 shinyUI(pageWithSidebar(
    headerPanel("Asian option Application"),
    
     sidebarPanel(
       radioButtons("radio",label=h3("Option"),choices=list("Asian Call"=1,"Asian Put"=2),selected=1),
       sliderInput("r","Interest",min=0,max=1,step=0.01,value=0.5),
      numericInput("sigma","Volatility",0.27),
      numericInput("s0","Stock price",235600),
      
      numericInput("k","Option Price",235600),
      numericInput("t","due(year)",1),
      
      submitButton("View")
      
    ),
    mainPanel(
      h3(textOutput("caption")),
      verbatimTextOutput("price") )
  ))
