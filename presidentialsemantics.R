install.packages('twitteR', dependencies=T)
library("twitteR")
library("reshape2")
library("ggplot2")

president<-function(x){
    Romney=searchTwitter('@MittRomney', n=1500)
    Obama=searchTwitter('@BarackObama', n=1500)
    textRomney=laply(Romney, function(t) t$getText())
    textObama=laply(Obama, function(t) t$getText())
    resultRomney=score.sentiment(textRomney, positive.words, negative.words)
    resultRomney$candidate='Romney'
    resultObama=score.sentiment(textObama, positive.words, negative.words)
    resultObama$candidate='Obama'
    result<-merge(resultObama,resultRomney, all=TRUE)
    result$candidate<-as.factor(result$candidate)
    cresult<-ddply(result, .(candidate),summarise, score.mean=mean(score))
    p<-ggplot(result, aes(x=score, fill=candidate)) +
        geom_histogram(binwidth=.5, alpha=.5, position="identity") +
        geom_vline(data=cresult, aes(xintercept=score.mean,  colour=candidate),
                   linetype="dashed", size=1)
    print(p)
    return(cresult)
}
