shinyUI(fluidPage(
        titlePanel("Black-Scholes European Option Value Experimenter for Stocks"),
        sidebarLayout(position="right",
                sidebarPanel(
                h3("Option Parameters"),
                numericInput("sp","Stock Price",100,min=0,max=1000,step=0.1),
                textOutput("output$sp"),
                numericInput("xp","Exercise Price",100,min=0,max=1000,step=0.1),
                numericInput("iv","Implied Volatility",10,min=0,max=100,step=1),
                numericInput("rf","Risk-free Rate",2.5, min=0,max=100,step=0.1),
                sliderInput('duration', 'Days to Expiration', min=1, max=180, value=1, 
                            step = 1, round = TRUE),
                h4("Theoretical Option Values (call/put):"),
                textOutput('value1'),
                textOutput('value2')
                
                ),
                mainPanel(
                img(src="B-S.jpeg", height = 100, width = 100),
                h4("Basics"),
                p("An option gives you the right but not the obligation to buy (call option) or sell (put option)
                        a stock at a predetermined price (exercise price) at a given future date (exercise or
                        expiration date). The theoretical value depends on the stock price,
                        exercise price, risk-free rate, volatility of stock price, and the 
                        time to expiration."),
                h4("Option Parameters"),
                h5("Stock Price"),
                p("The price can be current or price that is of interest to you.
                        the default is set at 100. This value must be greater than zero
                        and maximum is set at 1000 with a step size of 0.1"),
                h5("Option Exercise Price"),
                p("This is the price at which you have the right but 
                        the obligation to excercise your option. The default is set at 100.
                        The value must be greater than zero and maximum is set at 1000 with
                        a step size of 0.1"),
                h5("Implied Volatility"),
                p("This is the volatility of the stock price in annual terms. 
                        The default is set at 10%. The value cannot be below zero and
                        maximum is set at 100$ with a step size of 1%"),
                h5("Risk-free Interest Rate"),
                p("Risk-free Interest Rate is usually the U.S. Treasury Bill or Note rate. 
                        This represents the interest rate on the most credit worthy instrument. 
                        The default rate is set at 2%. The minimum cannot be below zero and
                        maximum is set at 100% with a step size of 0.1%"),
                h5("Number of Days to Option Expiration"),
                p("The number of days until you have to exercise your option. The default is set
                  at 1 day. This value must be greater than zero with the maximum of 180 days.
                  This value increments by 1 day."),
                h4("Results"),
                p("The result presents two prices. The first one represents the value of
                        the option for right to buy, but not the obligation to, the stock
                        at the exercise price. The second price represents the value of the 
                        option for right to sell, but not the obligation, the stock
                        at the exercise price."),
                h4("Limitations"),
                p("There are many limitations. For instance, this particular version of the 
                        Black-Scholes model does not consider stock dividends or cost-of-carry. Inclusion
                        of such parameters increase the complexity of the Shiny application and my
                        ability to explain such concepts to novice users. In addition, this particular version
                        of the model does not value futures, forwards, currency or other financial
                        instruments for the same reason as above.")
                
                )
)
))