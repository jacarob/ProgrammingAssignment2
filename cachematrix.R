## Put comments here that give an overall description of what your
## functions do

# It takes a matrix or element and store a special "matrix" 
# It set/get the "matrix" and it's inverse.


## Write a short comment describing this function
# It set/get the "matrix" and it's inverse.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


makeCacheMatrix(matrix(c(3,1,1,0),2,2))


## Write a short comment describing this function
# calculate the inverse of the special "matrix".

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
      message("getting cached matrix")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  }
  

##############
## example  ##
##############

matrix_example<-matrix(c(3,1,1,0),2,2)
makeCacheMatrix(matrix_example)
cacheSolve(makeCacheMatrix(matrix_example))

matrix_example %*% cacheSolve(makeCacheMatrix(matrix_example)) #Get [1,0][0,1] correct inverse matrix

