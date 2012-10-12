debate<-vp()
repeat {
    startTime <- Sys.time()
    x<-vp()
    debate<-merge(x, debate, all=TRUE)
    sleepTime <- startTime + 1*60 - Sys.time()
    if (sleepTime > 0)
    Sys.sleep(sleepTime)
}