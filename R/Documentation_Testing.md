## Documentation
* longer documents that give tutorials or overviews for the whole package
    * vignettes/README files, or both
      * vignette: this documment is bundled with your R package. when running `install_github`, use `build_vignettes = TRUE`
      * Once you create a vignette with use_vignette, be sure to update the Vignette Index Entry in the vignette’s YAML 
      (the code at the top of an R Markdown document). Replace “Vignette Title” there with the actual title you use for the vignette.
      * README file: if you have your package on GitHub, this document will show up 
      on the main page of the repository. 
    * this can be done using knitr to create R Markdown documents that mix R code 
    and text. 
    * the start of a markdown file gives some metadata for the file in a language 
    called YAML. 
      * To open a new R Markdown file, go to “File” -> “New File” -> “RMarkdown…”. To start, choose a “Document” in “HTML” format.
      * This will open a new R Markdown file in RStudio. The file extension for R Markdown files is “.Rmd”.
      * The new file comes with some example code and text. You can run the file as-is to try out the example. You will ultimately delete this example code and text and replace it with your own.
      * Once you “knit” the R Markdown file, R will render an HTML file with the output. This is automatically saved in the same directory where you saved your .Rmd file.
      * Write everything besides R code using Markdown syntax.
* shorter, functin specific help files for each function or group of related functions
    * roxygen2 package
    * these help files will go in a folder called /man of your
    package, in an R documentation format (.Rd file extensions).   
    ```
    #' Print "Hello world" 
    #'
    #' This is a simple function that, by default, prints "Hello world". You can 
    #' customize the text to print (using the \code{to_print} argument) and add
    #' an exclamation point (\code{excited = TRUE}).
    #'
    #' @param to_print A character string giving the text the function will print
    #' @param excited Logical value specifying whether to include an exclamation
    #'    point after the text
    #' 
    #' @return This function returns a phrase to print, with or without an 
    #'    exclamation point added. As a side effect, this function also prints out
    #'    the phrase. 
    #'
    #' @examples
    #' hello_world()
    #' hello_world(excited = TRUE)
    #' hello_world(to_print = "Hi world")
    #'
    #' @export
    hello_world <- function(to_print = "Hello world", excited = FALSE){
        if(excited) to_print <- paste0(to_print, "!")
        print(to_print)
    }
    ```
    * always use the @examples tag for example code
    * @inheritParams and @param
    * @export to allow users to directly use the function
    
## Include data in your package
* demonstarte how to use the functions 
* distribute data
  * data is extremely easy to load into R
  * not accessible to people who are not using R
* your compressed package file should be smaller than 5MB, which is the
largest package size that CRAN allows. 
    
* To include datasets in a package,
  * create the objects that you would like to include in your package inside of the 
  global environment. 
  * make sure you are in your package directory and use the use_data() function, listing 
  each object that you want to include in your package. 
  * document each data object that you are including in the package. 
  * create one R file called data.R in the R/ directory of your package. 
  
  
## When you believe your code is working, ask 
1. How do you know it's working?
1. Have you already tested your code?
  * as you develop your code, you may change/break older code without knowing it. 
  * the environment in which your package runs can change. 
  * as you fix bugs in your code, it's good to include a specific test that 
  addresses each bug so that you can be sure that the bug doesn't return in a future
  version of the package (regression). 
* the testthat package is designed to make it easy to setup a battery of tests 
for your R package. 

