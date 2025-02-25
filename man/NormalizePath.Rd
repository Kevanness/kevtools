% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NormalizePath.R
\name{NormalizePath}
\alias{NormalizePath}
\title{Normalize Path}
\usage{
NormalizePath(path = utils::readClipboard(), mustWork = FALSE)
}
\arguments{
\item{path}{A character vector of one or more paths.}

\item{mustWork}{boolean whether the path must be a real path.}
}
\value{
returns the canonical path, eliminating any symbolic links and the
special references.
}
\description{
Converts a file path to always use forward slashes and never
have multiple or a trailing slash.
}
