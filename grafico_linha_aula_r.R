
install.packages("plotly")
library(plotly)

x <- c(2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2013)
y_television <- c(74, 82, 80, 74, 73, 72, 74, 70, 70, 66, 66, 69)
y_internet <- c(13, 14, 20, 24, 20, 24, 24, 40, 35, 41, 43, 50)
data <- data.frame(x, y_television, y_internet)

xaxis <- list(title = "",
              showline = TRUE,
              showgrid = FALSE,
              showticklabels = TRUE,
              linecolor = 'rgb(204, 204, 204)',
              linewidth = 2,
              autotick = FALSE,
              ticks = 'outside',
              tickcolor = 'rgb(204, 204, 204)',
              tickwidth = 2,
              ticklen = 5,
              tickfont = list(family = 'Arial',
                              size = 12,
                              color = 'rgb(82, 82, 82)'))

yaxis <- list(title = "",
              showgrid = FALSE,
              zeroline = FALSE,
              showline = FALSE,
              showticklabels = FALSE)

margin <- list(autoexpand = FALSE,
               l = 100,
               r = 100,
               t = 110)

# Build the annotations

television_1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = y_television[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Television ', y_television[1], '%'),
  font = list(family = 'Arial',
              size = 16,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

internet_1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = y_internet[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Internet ', y_internet[1], '%'),
  font = list(family = 'Arial',
              size = 16,
              color = 'rgba(49,130,189, 1)'),
  showarrow = FALSE)

television_2 <- list(
  xref = 'paper',
  x = 0.95,
  y = y_television[12],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste('Television ', y_television[12], '%'),
  font = list(family = 'Arial',
              size = 16,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

internet_2 <- list(
  xref = 'paper',
  x = 0.95,
  y = y_internet[12],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste('Internet ', y_internet[12], '%'),
  font = list(family = 'Arial',
              size = 16,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

p <- plot_ly(data, x = ~x) %>%
  add_trace(y = ~y_television, type = 'scatter', mode = 'lines', line = list(color = 'rgba(67,67,67,1)', width = 2))  %>%
  add_trace(y = ~y_internet, type = 'scatter', mode = 'lines', line = list(color = 'rgba(49,130,189, 1)', width = 4)) %>%
  add_trace(x = ~c(x[1], x[12]), y = ~c(y_television[1], y_television[12]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(67,67,67,1)', size = 8)) %>%
  add_trace(x = ~c(x[1], x[12]), y = ~c(y_internet[1], y_internet[12]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(49,130,189, 1)', size = 12)) %>%
  layout(title = "Main Source for News", xaxis = xaxis, yaxis = yaxis, margin = margin,
         autosize = FALSE,
         showlegend = FALSE,
         annotations = television_1) %>%
  layout(annotations = internet_1) %>%
  layout(annotations = television_2) %>%
  layout(annotations = internet_2)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="line-annotations")
chart_link