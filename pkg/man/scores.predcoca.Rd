\name{scores.predcoca}
\alias{scores.predcoca}
\alias{scores.symcoca}

\title{Get Species or Site Scores from an Ordination}
\description{
  Function to access either species or site scores for specified axes in
  co-correspondence analysis ordination methods.
}
\usage{

\method{scores}{predcoca}(x, choices = c(1, 2),
       display = c("site","species"), \ldots)

\method{scores}{symcoca}(x, choices = c(1, 2),
       display = c("site","species"), scaling = 1, \ldots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ an ordination result}
  \item{display}{ partial match to access scores for \dQuote{sites} or \dQuote{species}.}
  \item{choices}{ the ordination axes to return.}
  \item{scaling}{ whether the species scores should be rescaled to the
    quarter root of the eigenvalues using \code{\link{rescale.symcoca}}.}
  \item{\ldots}{arguments to be passed to other methods.}
}
\details{
  Implements a \code{\link[vegan]{scores}} method for symmetric
  co-correspondence analysis ordination results.
}
\value{
  A list with two components containing matrices of the requested
  scores:
  \item{species }{A list with two components, \code{U1} and \code{U2},
    containing the species scores for the response matrix \code{Y} and
    the predictor matrix \code{X} respectively.}
  \item{sites }{A list with two components, \code{X1} and \code{X2},
    containing the site scores for the response matrix \code{Y} and
    the predictor matrix \code{X} respectively.}
  ...
}
\references{
  
  ter Braak, C.J.F and Schaffers, A.P. (2004) Co-Correspondence
  Analysis: a new ordination method to relate two community
  compositions. \emph{Ecology} \bold{85(3)}, 834--846
}

\author{Gavin L. Simpson, based on Matlab code by C.J.F. ter Braak and
  A.P. Schaffers.}

\seealso{
  \code{\link[vegan]{scores}}, for further details on the method.
}
\examples{
## load some data
data(beetles)
data(plants)
## log transform the bettle data
beetles <- log(beetles + 1)
## fit the model, a symmetric CoCA
bp.sym <- coca(beetles ~ ., data = plants, method = "symmetric")
## extract the scores
scores(bp.sym)

## predictive CoCA using SIMPLS and formula interface
bp.pred <- coca(beetles ~ ., data = plants)
scores(bp.pred)
}
\keyword{multivariate}