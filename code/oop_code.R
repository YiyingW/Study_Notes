library(readr)
library(magrittr)

# read in data
data <- read_csv("data/MIE.csv")

# definition of subject class
setClass("subject",
         slots = list(id = "numeric"))
# definition of visit class
setClass("visit",
         slots = list(visit = "numeric"))
# definition of room class
setClass("room",
         slots = list(room = "character"))
# definitoin of LongitudinalData class, inherit from subject class
setClass("LongitudinalData",
         slots = list(id = "subject",
                      visit = "visit",
                      room = "room",
                      value = "numeric",
                      timepoint = "numeric"))

make_LD <- function(data) {
  # create all subject classes 
  #subjects <- unique(data$id)
  #subject_S4 <- new("subject", id = subjects)
  # create all visit classes
  #visits <- unique(data$visit)
  #visit_S4 <- new("visit", visit = visits)
  # create all room classes
  #rooms <- unique(data$room)
  #room_S4 <- new("room", room = rooms)
  # create LongitudinalData objects
  for (i in 1:nrow(data)) {
    new("LongitudinalData", 
        id = new("subject", id = as.numeric(data$id[i])),
        visit = new("visit", visit = as.numeric(data$visit[i])),
        room = new("room", room = data$room[i]),
        value = data$value[i],
        timepoint = data$timepoint[i])
  }
}
