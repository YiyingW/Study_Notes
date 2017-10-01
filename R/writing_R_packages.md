An R package begins life as a directory on your computer.
This directory has a specific layout with specific files 
and sub-directories. 
Two required sub-directories are:
* R, which contains all of your R code files
* man, which contains your documentation files  
  * use roxygen2 package can autogenerate man files when u write documentation into the R code files    


need a DESCRIPTION file and a NAMESPACE file   
* DESCRIPTION
  * contains key metadata for the package: package name, 
  the version number, the author and maintainer contact info, 
  the license info, any dependencies on other packages.  
  * example   
  ```
  Package:  mvtsplot
  Version:  1.0-3
  Date:  2016-05-13
  Depends:  R (>= 3.0.0)
  Imports: splines, graphics, grDevices, stats, RColorBrewer
  Title:  Multivariate Time Series Plot
  Author:  Roger D. Peng <rpeng@jhsph.edu>
  Maintainer:  Roger D. Peng <rpeng@jhsph.edu>
  Description:  A function for plotting multivariate time series data.
  License:  GPL (>= 2)
  URL: https://github.com/rdpeng/mvtsplot
  ```
* NAMESPACE
  * interface to the package that is presented to the user
    * done by a series of export() statements
    * functions that are not exported cannot be called by user 
    * exported functions must be documented and supported. try to minimize the number 
    of exports. 
  * functions or packages imported by the package. if your package 
  dependes on functions from another package, you must import them 
  via the NAMESPACE file
  ```
  export("mvtsplot")

  import(splines)
  import(RColorBrewer)
  importFrom("grDevices", "colorRampPalette", "gray")
  importFrom("graphics", "abline", "axis", "box", "image", "layout",
           "lines", "par", "plot", "points", "segments", "strwidth",
           "text", "Axis")
  importFrom("stats", "complete.cases", "lm", "na.exclude", "predict",
           "quantile")
  ```
  
  
  
