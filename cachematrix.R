## Following functions can be used to cache the inverse of the matrix

## Function makeCacheMatrix will take matrix as input 
## and returns a list of functions set/get/setinverse/getinverse
## set : sets the value of matrix
## get :gets the value of matrix
## setinverse: sets the value of inverse of the matrix
## getinverse: gets the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<-function(y){
    x<<- y
    i<<- NULL
  }
  get<-function()x
  setinverse <- function(inverse) i<<- inverse
  getinverse <-function() i
  list(set = set,get = get,setinverse= setinverse,getinverse = getinverse)
}


## Function cacheSolve returns the inverse of the matrix.
## If the inverse is not available through getinverse unction,
## then it calculates the inverse and sets the value using the setinverse function
## otherwise it returns the cached data from the getinverse function

cacheSolve <- function(x, ...) {
  i<-x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return (i)
  }
  data <-x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
