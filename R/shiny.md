## architecture
* shinny app is on your computer
* you can put it on a web server to serve the app so other people can access through the cloud
* two components for your shiny app
    * user interface (UI) -- HTML, generated from R code
    * server instructions to tell server what to do when user change things from the app
## build your app around inputs and outputs
* inputs are things your user can toggle
* outputs are R objects that your user sees, they respond to your inputs
## tell the server how to assemble inputs into outputs 
* save objects to display to output$ 
* build objects to display with render*()
* use input values with input$ 
## share your app
* save it: one directory with every file the app needs
    * app.R, your script which ends with a call to shinyApp()
    * datasets, images, css, helper scripts, etc. 
* use shinyapps.io, a server R studio builds for you and free to use. 
* or other servers

## steps 
1. begin each app with the template
1. add elements as arguments to fluidPage()
1. create reactive inputs with an *Input() function
1. display reactive results with an *Output() function
1. use the server function to assemble inputs into outputs

