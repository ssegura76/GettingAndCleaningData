library(data.table)
## 1. Read data from X and add an id
xtest<-read.table("X_test.txt")
xtrain<-read.table("X_train.txt")
xunion<-rbind(xtest,xtrain)
xcomplete<-data.table(id=sequence(nrow(xunion)),xunion)
setkey(xcomplete,id)

## 2. Read data from Y and add an id
ytest<-read.table("y_test.txt")
ytrain<-read.table("y_train.txt")
yunion<-rbind(ytest,ytrain)
ycomplete<-data.table(id=sequence(nrow(yunion)),yunion)
setkey(ycomplete,id)
setnames(ycomplete, "V1", "ActCode")

## 3. Read data from subjects and add an id
testSubject<-read.table("subject_test.txt")
trainSubject<-read.table("subject_train.txt")
subjectUnion<-rbind(testSubject,trainSubject)
subjectComplete<-data.table(id=sequence(nrow(subjectUnion)),subjectUnion)
setnames(subjectComplete, "V1", "Subject")
setkey(subjectComplete,id)

## 4. Read features and activity labels
features<-read.table("features.txt")
actLabels<-read.table("activity_labels.txt")
setnames(actLabels, "V1", "ActCode")
setnames(actLabels, "V2", "Activity")
actLabels<-as.data.table(actLabels)
setkey(actLabels,ActCode)

## 5. Join X, Y, subject and ID 
tabla0<-merge(subjectComplete,ycomplete)
tabla1<-merge(tabla0,xcomplete)
setkey(tabla1,ActCode)
tabla<-merge(tabla1,actLabels)

## 6. Names of variables
for (i in 1:561) {
    setnames(tabla, paste("V",i,sep=""),as.character(features[i,2]))
}

## 7. Extracts means and sd variables
tablar<-subset(tabla,select=c(id,Activity,Subject))
setkey(tablar,id)
for (j in 0:4) {
    
    for (i in 1:6) {
        x<-data.table(subset(tabla,select=id),subset(tabla,select=(j*40)+i+3))
        setkey(x,id)
        tablar<-merge(tablar,x)
        
    }
    
}


for (j in 0:4) {
    
    for (i in 1:2) {
        x<-data.table(subset(tabla,select=id),subset(tabla,select=(j*13)+i+203))
        setkey(x,id)
        tablar<-merge(tablar,x)
        
    }
    
}


for (j in 0:2) {
    
    for (i in 1:6) {
        x<-data.table(subset(tabla,select=id),subset(tabla,select=(j*79)+i+268))
        setkey(x,id)
        tablar<-merge(tablar,x)
        
    }
    
}

for (j in 0:3) {
    
    for (i in 1:2) {
        x<-data.table(subset(tabla,select=id),subset(tabla,select=(j*13)+i+505))
        setkey(x,id)
        tablar<-merge(tablar,x)
        
    }
    
}

## 8. Mean calculation by subject and activity

library(dplyr)
output<-tablar %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
output[,id:=NULL]
write.table(output,file="courseProject.txt",row.name=FALSE)

