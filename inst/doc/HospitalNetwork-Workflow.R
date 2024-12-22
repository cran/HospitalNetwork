## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----adjacency-matrix, echo = FALSE, dev = 'svg', results = 'asis'------------
data = c(0,0,602,0,339,687,0,0,0,0,373,1294,0,718,86,296,263,0,0,35,0,598,0,0,0)
mat = matrix(data, nrow = 5, ncol = 5)
colnames(mat) = LETTERS[1:5]
rownames(mat) = colnames(mat)
pander::pandoc.table(mat, caption = 'Example of a matrix representation of a 5-nodes network. By convention, the rows contain the facilities of origin, and the columns contain the target facilities. Each cell contains the number of subjects transfered.', )

## ----data_example-------------------------------------------------------------
library(HospitalNetwork)
data = create_fake_subjectDB(n_subjects = 3, n_facilities = 3)
data

## ----check_example, error = TRUE----------------------------------------------
try({
# Example
library(HospitalNetwork)
base = create_fake_subjectDB(n_subjects = 100, n_facilities = 10, with_errors = TRUE)
checkBase(base)
})

## ----setup, eval = FALSE------------------------------------------------------
# library(HospitalNetwork)
# 

## ----setup2, eval = TRUE------------------------------------------------------
mydbmed = create_fake_subjectDB(n_subjects = 100, n_facilities = 10)
hn = hospinet_from_subject_database(base = mydbmed, noloops = FALSE)
hn

## ----setup3, eval = TRUE------------------------------------------------------
plot(hn)

## ----setup4, eval = TRUE------------------------------------------------------
plot(hn, type = "degree")

## ----setup5, eval = TRUE------------------------------------------------------
plot(hn , type = "clustered_matrix")

## ----setup6, cache = FALSE, eval = TRUE---------------------------------------

mydb = create_fake_subjectDB_clustered(n_subjects = 10000, n_facilities = 100, n_clusters = 5)
hn = hospinet_from_subject_database(base = mydb, noloops = FALSE)
hn

## ----setup7, eval = TRUE------------------------------------------------------
plot(hn)

## ----setup8, eval = TRUE------------------------------------------------------
plot(hn, type = "degree")

## ----setup9, eval = TRUE------------------------------------------------------
plot(hn , type = "clustered_matrix")

## ----setup10, eval = TRUE-----------------------------------------------------
#this plot may not work on some systems
#plot(hn , type = "circular_network")

