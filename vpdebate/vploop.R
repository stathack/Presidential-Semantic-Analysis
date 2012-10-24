    Romney=searchTwitter('@MittRomney', n=1500)
    Obama=searchTwitter('@BarackObama', n=1500)
repeat {
    startTime <- Sys.time()
    x=searchTwitter('@MittRomney', n=1500)
    y=searchTwitter('@BarackObama', n=1500)
    sleepTime <- startTime + 1*60 - Sys.time()
    if (sleepTime > 0)
    Sys.sleep(sleepTime)
}