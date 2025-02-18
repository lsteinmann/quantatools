% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_quantogram.R
\name{get_fofq}
\alias{get_fofq}
\title{Calculate f(q)}
\usage{
get_fofq(try_q, params, x, A)
}
\arguments{
\item{try_q}{a quantum value}

\item{params}{cosine quantogram parameters, standard parameters accessible
with `getOption("CONSTANTS_QUANTOGRAM")`, including "RNG_START", "RNG_END",
"STEP", "Q_MIN"}

\item{x}{A numeric vector of measurement values from which
the quantogram should be calculated}

\item{A}{Should be the sqrt(2 / length(measurement_vector))}
}
\value{
f(q)
}
\description{
Calculates the f(q) of a given quantum for all measurements (in x).
}
\keyword{internal}
