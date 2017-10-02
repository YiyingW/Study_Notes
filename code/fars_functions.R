#' @title Read in data from one file
#' 
#' @description 
#' This function reads in data from a file, if the file exists. Otherwise, this funcion will stop.
#' 
#' @param filename A character string giving the filename of the file the function will read
#' 
#' @return This function returns a dataframe 
#' 
#' @examples 
#' fars_read('data1.csv')
#' 
#' @details This function uses read_csv from readr package and tbl_df from dplyr package. 
#' 
fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}

#' @title Create a filename
#' 
#' @description 
#' This function creates a filename for a certain year. 
#' 
#' @param year An interger represents a year. The format for year is YYYY. 
#' 
#' @return This function returns a filename in the format of a character string  
#' 
#' @examples 
#' make_filename(2017)
#' 
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}

#' @title Read data from multiple files 
#' 
#' @description 
#' This function will read data from multiple files and store the data in a list as multiple dataframes. 
#' 
#' @param years An integer vector containing years that will be read. The elements in years vector should be
#' in the format of YYYY. Otherwise, error will occur. 
#' 
#' @return This function returns a list containing dataframes. 
#' 
#' @examples 
#' fars_read_years(c(2013, 2014, 2015))
#' 
fars_read_years <- function(years) {
        lapply(years, function(year) {
                file <- make_filename(year)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate(dat, year = year) %>% 
                                dplyr::select(MONTH, year)
                }, error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}

#' @title Summarize data based on years 
#' 
#' @description 
#' This function will summarize the occurance of accidents in each month of each year.  
#' 
#' @param years 
#' @inheritParams fars_read_years 
#' 
#' @return This function returns a dataframe. 
#' 
#' @examples 
#' fars_summarize_years(c(2013, 2014, 2015))
#' 
#' @export
#' 
fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>% 
                dplyr::group_by(year, MONTH) %>% 
                dplyr::summarize(n = n()) %>%
                tidyr::spread(year, n)
}

#' @title 
#' 
#' @description 
#' 
#' 
#' @param state.num An interger represents a state of US. The valid state.num are in the following 
#' list: 1, 2, 4, 5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
#' 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 44, 45, 46, 47, 48, 49, 50, 51, 53, 54, 55, 56
#' @param year
#' @inheritParams make_filename
#' 
#' @return This function returns a geographic plot for the occurance of accidents within the given 
#' year and given state. The occurance of an accident is shown as a dot on the plot. 
#' 
#' @examples 
#' fars_map_state(12, 2015)
#' fars_map_state(1, 2013)
#' 
#' @details This function uses maps package. 
#' 
#' @export
#' 
fars_map_state <- function(state.num, year) {
        filename <- make_filename(year)
        data <- fars_read(filename)
        state.num <- as.integer(state.num)

        if(!(state.num %in% unique(data$STATE)))
                stop("invalid STATE number: ", state.num)
        data.sub <- dplyr::filter(data, STATE == state.num)
        if(nrow(data.sub) == 0L) {
                message("no accidents to plot")
                return(invisible(NULL))
        }
        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
        with(data.sub, {
                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                          xlim = range(LONGITUD, na.rm = TRUE))
                graphics::points(LONGITUD, LATITUDE, pch = 46)
        })
}
