x1<-seq(as.Date("2019-01-01"),as.Date("2022-12-31"),"day")
x2<-seq(as.Date("2022-01-01"),as.Date("2022-12-31"),"day")

y1<-read.xlsx(file="Urgencia2019.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
              , as.data.frame = TRUE, header = FALSE)
y2<-read.xlsx(file="Urgencia2020.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:367
              , as.data.frame = TRUE, header = FALSE)
y2_2<-read.xlsx(file="Urgencia2020(2).xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
                    , as.data.frame = TRUE, header = FALSE)
y3<-read.xlsx(file="Urgencia2021.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
              , as.data.frame = TRUE, header = FALSE)
y4<-read.xlsx(file="Urgencia2022.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
              , as.data.frame = TRUE, header = FALSE)

y1<-t(y1)
y2<-t(y2)
y2_2<-t(y2_2)
y3<-t(y3)
y4<-t(y4)



### Set de datos para serie de tiempo ####

demanda<-rbind(y1,y2,y3,y4)
data<-data.frame(x1,demanda)

### set de datos para causas y años ####
causa<-read.xlsx(file="UrgenciaPorCausayEdad.xlsx",sheetIndex = 1, rowIndex = 4:8, colIndex= 1:6
                 , as.data.frame = TRUE, header = FALSE)
edad<-read.xlsx(file="UrgenciaPorCausayEdad.xlsx",sheetIndex = 2, rowIndex = 4:8, colIndex= 1:6
                , as.data.frame = TRUE, header = FALSE)

### set de datos para comparar años ####
data_por_año<-data.frame(x2,y1,y2_2,y3,y4)

