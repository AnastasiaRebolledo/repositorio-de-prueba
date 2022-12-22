x1<-seq(as.Date("2019-01-01"),as.Date("2022-12-31"),"day")

y1<-read.xlsx(file="Urgencia2019.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
              , as.data.frame = TRUE, header = FALSE)
y2<-read.xlsx(file="Urgencia2020.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:367
              , as.data.frame = TRUE, header = FALSE)
y3<-read.xlsx(file="Urgencia2021.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
              , as.data.frame = TRUE, header = FALSE)
y4<-read.xlsx(file="Urgencia2022.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
              , as.data.frame = TRUE, header = FALSE)

y1<-t(y1)
y2<-t(y2)
y3<-t(y3)
y4<-t(y4)

y1<-rbind(y1,y2,y3,y4)
data<-data.frame(x1,y1)

### Set de datos para serie de tiempo ####

