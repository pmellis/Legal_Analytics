# Code accompanying blog post, "Open Source TAR . . . FOR FREE!" by Patrick Ellis

# Blog available at http://patellis.wordpress.com/2013/12/19/open-source-e-discovery-and-document-management/



# Load requisite packages
library(tm)
library(ggplot2)
library(lsa)

# Place Enron email snippets into a single vector.
text <- c(
    "To Mr. Ken Lay, I’m writing to urge you to donate the millions of dollars you made from selling Enron stock before the company declared bankruptcy.", 
    "while you netted well over a $100 million, many of Enron's employees were financially devastated when the company declared bankruptcy and their retirement plans were wiped out", 
    "you sold $101 million worth of Enron stock while aggressively urging the company’s employees to keep buying it", 
    "This is a reminder of Enron’s Email retention policy. The Email retention policy provides as follows . . .", 
    "Furthermore, it is against policy to store Email outside of your Outlook Mailbox and/or your Public Folders. Please do not copy Email onto floppy disks, zip disks, CDs or the network.", 
    "Based on our receipt of various subpoenas, we will be preserving your past and future email. Please be prudent in the circulation of email relating to your work and activities.", 
    "We have recognized over $550 million of fair value gains on stocks via our swaps with Raptor.", 
    "The Raptor accounting treatment looks questionable. a. Enron booked a $500 million gain from equity derivatives from a related party.", 
    "In the third quarter we have a $250 million problem with Raptor 3 if we don’t “enhance” the capital structure of Raptor 3 to commit more ENE shares.")
view <- factor(rep(c("view 1", "view 2", "view 3"), each = 3))
df <- data.frame(text, view, stringsAsFactors = FALSE)

# Prepare mini-Enron corpus
corpus <- Corpus(VectorSource(df$text))
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, function(x) removeWords(x, stopwords("english")))
corpus <- tm_map(corpus, stemDocument, language = "english")
corpus  # check corpus

# Mini-Enron corpus with 9 text documents
