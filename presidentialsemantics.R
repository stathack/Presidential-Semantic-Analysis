install.packages('twitteR', dependencies=T)
library("twitteR")
library("reshape2")
library("ggplot2")

president<-data.frame(Democrat=c("Obama",'@BarackObama'),Republican=c("Romney",'@MittRomney'))
vp<-data.frame(Democrat=c("Biden",'@JoeBiden'),Republican=c("Ryan",@PaulRyanVP))


#download Opinion Lexicon from http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon

president<-function(x){
    Romney=searchTwitter('@MittRomney', n=1500)
    Obama=searchTwitter('@BarackObama', n=1500)
    textRomney=laply(Romney, function(t) t$getText())
    textObama=laply(Obama, function(t) t$getText())
    resultRomney=score.sentiment(textRomney, positive.words, negative.words)
    resultObama=score.sentiment(textObama, positive.words, negative.words)
    output<-data.frame(Romney=resultRomney$score, Obama=resultObama$score)
    out<- melt(output)
    p<-ggplot(out)+ geom_density(aes(x = value,colour = variable))
    print(p)
    print(mean(resultObama$score))
    print(mean(resultRomney$score))
}
