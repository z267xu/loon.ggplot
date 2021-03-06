% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interactive-ggproto.R
\name{linking}
\alias{linking}
\title{Modify the \code{linking} component}
\usage{
linking(
  linkingGroup = NULL,
  linkingKey = NULL,
  linkedStates = NULL,
  sync = NULL,
  activeGeomLayers = NULL
)
}
\arguments{
\item{linkingGroup}{A character. Plots only in the same linkingGroup can be linked}

\item{linkingKey}{LinkingKey is the key of linking. Each object in one plot has a unique linking key.
Elements in different plots are linked if they share the same linking keys.}

\item{linkedStates}{The states to be linked. It can be "color", "selected", "active", "size" and "glyph" for a `l_plot` object and
"color", "selected", "active" for a `l_hist` object.}

\item{sync}{The way to synchronize several linked plots. It can be either "pull" (default) or "push".
If the \code{sync} is "pull", the linked states (aesthetics attributes, e.g. "color", "selected", ...)
of the new plot will be pulled from the linked plots;
if the \code{sync} is "push",  the linked states of the new plot will be pushed to the linked plots.}

\item{activeGeomLayers}{determine which geom layer is interactive. Only \code{geom_point()}
and \code{geom_histogram()} can be set as active geom layer(s) so far.
(Notice, more than one \code{geom_point()} layers can be set as active layers,
but only one \code{geom_histogram()} can be set as an active geom layer)}
}
\value{
a \code{ggproto} object
}
\description{
In interactive graphics, \code{linking} is often used to discover the patterns of interest in several plots.
}
\examples{
if(interactive()) {
  p <- l_hist(mtcars$hp, linkingGroup = "mtcars")
  l_ggplot(mtcars, mapping = aes(x = wt, y = hp, color = factor(cyl))) +
    geom_point(size = 4) +
    # push the states of scatter plot to the histogram
    linking(linkingGroup = "mtcars", sync = "push")

  # set active layer
  l_ggplot(mtcars, aes(mpg, wt, shape = factor(cyl))) +
    geom_point(colour = "black", size = 4.5) +
    geom_point(colour = "pink", size = 4) +
    geom_point(aes(shape = factor(cyl))) +
    # only the second layer is interactive
    linking(activeGeomLayers = 2)
}
}
\seealso{
\code{\link{selecting}}, \code{\link{itemLabel}}, \code{\link{interactivity}}
}
