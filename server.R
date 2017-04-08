
library(shiny)

shinyServer(function(input, output) {

  output$plotHouse <- renderPlot({
    valZip <- as.integer(input$fieldZip)
    valBeds <- as.integer(input$fieldBeds)
    valGarage <- as.integer(input$fieldGarage)
    
    predDat <- data.frame(rep(0,numPoints),valSqft,rep(valBeds,numPoints),rep(valGarage,numPoints),rep(valZip,numPoints))
    names(predDat) <- c("LIST.PRICE","SQFT","BEDS","PARKING.TYPE","ZIP")
    
    pred <- predict(rf.trainingModel, predDat)
    
    plot(valSqft,pred, col= "blue", xlim = c(500, 9000), ylim = c(0, 4000), type="l",xlab="Square Feet",ylab="Estimated List Price")
    grid(nx=NULL, ny=NULL, lwd = 1)
  })  
  
})