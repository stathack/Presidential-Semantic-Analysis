vp<-function(x){
    Ryan=searchTwitter('@PaulRyanVP', n=1500)
    Biden=searchTwitter('@JoeBiden', n=1500)
    textRyan=laply(Ryan, function(t) t$getText())
    textBiden=laply(Biden, function(t) t$getText())
    resultRyan=score.sentiment(textRyan, positive.words, negative.words)
    resultRyan$candidate='Ryan'
    resultBiden=score.sentiment(textBiden, positive.words, negative.words)
    resultBiden$candidate='Biden'
    result<-merge(resultBiden,resultRyan, all=TRUE)
    result$candidate<-as.factor(result$candidate)
    result$time<-date()
    return(result)
}

