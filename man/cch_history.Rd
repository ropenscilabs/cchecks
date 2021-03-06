% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cch_history.R
\name{cch_history}
\alias{cch_history}
\title{Get historical check data for all packages by date}
\usage{
cch_history(date, ...)
}
\arguments{
\item{date}{(character) a date of the form \code{YYYY-MM-DD}. required}

\item{...}{Curl options passed to \link[crul:verb-GET]{crul::verb-GET}}
}
\value{
a tibble with columns:
\itemize{
\item package: character vector of package names
\item summary: character vector of JSON hash's of check summary data
\item checks: character vector of JSON hash's of checks performed
\item check_details: character vector of check details. if no check
details the string will be "null"; if details given, then
a JSON hash of details
\item date_updated: character vector of dates, the date the check was
performed on
}
}
\description{
Get historical check data for all packages by date
}
\details{
This function gets historical data for all packages for a single
day; see \code{\link[=cch_pkgs_history]{cch_pkgs_history()}} for last 30 days history for particular
packages

You have to do a bit of data wrangling to get this data into a
easily sortable/filterable/etc. form
}
\examples{
\dontrun{
x <- cch_history(date = "2020-04-01")
str(x)
lapply(x$summary[1:3], jsonlite::fromJSON)
}
}
\seealso{
\code{\link[=cch_pkgs_history]{cch_pkgs_history()}}
}
