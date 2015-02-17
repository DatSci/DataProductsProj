
bs <- function(S, X, rf, T, sigma) {
        values <- c(2)
        
        d1 <- (log(S/X)+(rf+sigma^2/2)*T)/(sigma*sqrt(T))
        d2 <- d1 - sigma * sqrt(T)
        
        values[1] <- max(S*pnorm(d1) - X*exp(-rf*T)*pnorm(d2),0)
        values[2] <- max(X*exp(-rf*T) * pnorm(-d2) - S*pnorm(-d1),0)
        
        round(values,2)
}


shinyServer(function(input, output) {
        
        output$sp <- renderText(input$sp)
        output$xp <- renderText(input$xp)
        output$iv <- renderText(input$iv)
        output$rf <- renderText(input$rf)
        output$duration <- renderText(input$duration)
        
        output$value1 <- renderText({
                bs(input$sp,input$xp,input$rf/100,input$duration/365,input$iv/100)[1]
        })
        output$value2 <- renderText({
                bs(input$sp,input$xp,input$rf/100,input$duration/365,input$iv/100)[2]
        })

})
