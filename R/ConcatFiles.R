#' @name ConcatFiles
#'
#' @title combine two long format files into one
#'
#' @param file_in1 file path for input file 1
#' @param file_in2 file path for input file 2
#' @param file_out file path for output file
#'
#' @description the two input files do not have to contain same columns. NA will be introduced into
#' output file for the different columns in input files.
#'
#' @return This function creates a file
#'
#' @examples
#' ConcatFiles(file_in1, file_in2, file_out)
#'
#' @export
ConcatFiles <- function(file_in1, file_in2, file_out) {
  fastmerge <- function(d1, d2) {
    d1.names <- names(d1)
    d2.names <- names(d2)

    # columns in d1 but not in d2
    d2.add <- setdiff(d1.names, d2.names)

    # columns in d2 but not in d1
    d1.add <- setdiff(d2.names, d1.names)

    # add blank columns to d2
    if(length(d2.add) > 0) {
      for(i in 1:length(d2.add)) {
        d2[d2.add[i]] <- NA
      }
    }

    # add blank columns to d1
    if(length(d1.add) > 0) {
      for(i in 1:length(d1.add)) {
        d1[d1.add[i]] <- NA
      }
    }

    return(rbind(d1, d2))
  }
  df1 <- data.frame(data.table::fread(file_in1))
  df2 <- data.frame(data.table::fread(file_in2))
  write.table(file = file_out, fastmerge(df1, df2), eol="\n", sep="\t", quote=F,row.names=F,col.names=T)
}
