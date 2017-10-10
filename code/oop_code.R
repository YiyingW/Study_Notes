library(readr)
library(magrittr)

# read in data
data <- read_csv("data/MIE.csv")

# definition of room class
setClass("room",
         slots = list(room = "character",
                      values = "data.frame"))
# definition of visit class
setClass("visit",
         slots = list(visit = "numeric",
                      rooms = "vector"))
# definition of subject class
setClass("subject",
         slots = list(id = "numeric",
                      visits = "vector"))
# definitoin of LongitudinalData class, inherit from subject class
setClass("LongitudinalData",
         slots = list(subjects = "vector"))
# set generic function subject 
setGeneric("make_LD", function(x){
  standardGeneric("make_LD")
})
setMethod("make_LD",
          c(x = "tbl_df"),
          function(x) {
            newSubject <- c()
            for (i in unique(x$id)) {
              newVisit = c()
              for (j in unique(x[x$id==i,]$visit)){
                newRoom <- c()
                for (k in unique(x[x$id==i&x$visit==j,]$room)){
                  values <- x[x$id==i&x$visit==j&x$room==k, 4:5]
                  newRoom <- append(newRoom, new("room", room=k, values=values))
                }
                newVisit <- append(newVisit, new("visit", visit=j, rooms=newRoom))
              }
              newSubject <- append(newSubject, new("subject", id=i, visits=newVisit))
            }
            return (newSubject)
          })
