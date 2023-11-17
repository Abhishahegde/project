library(shiny)
library(DT) 

data <- data.frame(
  Name = c("Allan", "Jackson", "Sujith M Shankar", "Sherin", "Rakshith", "Gaushith",
           "Devaraj Birwa", "Bhuvan", "SHARATH", "Aileen",
           "ROHITH PATALI", "Rohith", "Harshitha", "Deepak Amin D", "Firoz",
           "Ganapathi Bhat","Akshay", "Mohammed Irshad", "Nagadeep",
           "Nagaraja B", "Uday", "Anitha", "Vinay Jogi", "Aditya Anchan",
           "Dhishan Kudwalli", "Akshay","Rama","Alia"),
  BloodGroup = c(
    "A+", "A+", "A+", "A+", "A+", "A+","A+", "A-", "A-", "B+", "B+",
    "B+", "B+", "B+", "B+", "B-",
    "O+", "O+", "O+", "O+", "O+", "O+",
    "O+", "O+", "O+", "O+","AB+","AB-" ),
  Location = c(
    "Lower Bendoor 3rd Cross, Mangalore", "Kulur, Mangalore",
    "Kodialbail, Mangalore", "Falnir, Mangalore", "Bajpe, Mangalore",
    "Kadri, Mangalore", "Kodialbail, Mangalore", "Moodbidri, Mangalore",
    "Bantwal, Mangalore", "BAJPE, Mangalore", "Bajpe, Mangalore",
    "Kodialbail, Mangalore", "Kodialbail, Mangalore",
    "Krishnanagara, Bondel, Mangalore", "Jayanagar Jalligudde, Mangalore",
    "Falnir Road, Mangalore","Alape, Mangalore", "Urwa, Mangalore",
    "Someshwer Uchila, Mangalore", "Jail Road, Mangalore",
    "Gandhi Nagar, Kavoor, Mangalore", "Kulashekara, Mangalore",
    "Nehru Avenue Road, Mangalore", "Kottara, Mangalore",
    "NG Road, Attavar, Mangalore", "Kulshekar, Mangalore","moodibidre,dakshina kannada","karakala"),
  PhoneNumber = c(
    "📞 9980185637", "📞 9945275556", "📞 8867838615", "📞 9446364828",
    "📞 9632231999", "📞 9743201644","📞 8867838615", "📞 8792915171",
    "📞 9743443488", "📞 8971702326", "📞 9964147277", "📞 9901997117",
    "📞 9901997117", "📞 8660644551", "📞 9482507825", "📞 9986225130",
    "📞 9620412986", "📞 8050334158", "📞 0582309651", "📞 8150098981",
    "📞 9743514251", "📞 9341773727", "📞 9591251666", "📞 7026019219",
    "📞 9611949694", "📞 9448177823","📞 8796526432","📞 9980753421"),
  LastDonated = c(
    "lessthan3m", "morethan3m", "morethan3m", "morethan3m", "morethan3m",
    "lessthan3m","morethan3m", "lessthan3m", "lessthan3m", "never",
    "never", "morethan3m", "morethan3m", "never", "morethan3m", "morethan3m",
    "morethan3m", "morethan3m", "morethan3m", "lessthan3m", "lessthan3m",
    "lessthan3m", "never", "morethan3m", "morethan3m", "morethan3m","never","morethan2m")
)

blood_compatibility_data <- data.frame(
  Recipient = c("A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-",
                "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-",
                "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-",
                "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-",
                "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-",
                "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-",
                "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-",
                "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"),
  Donor = c("A+", "A+", "A+", "A+", "A+", "A+", "A+", "A+",
            "A-", "A-", "A-", "A-", "A-", "A-", "A-", "A-",
            "B+", "B+", "B+", "B+", "B+", "B+", "B+", "B+",
            "B-", "B-", "B-", "B-", "B-", "B-", "B-", "B-",
            "AB+", "AB+", "AB+", "AB+", "AB+", "AB+", "AB+", "AB+",
            "AB-", "AB-", "AB-", "AB-", "AB-", "AB-", "AB-", "AB-",
            "O+", "O+", "O+", "O+", "O+", "O+", "O+", "O+",
            "O-", "O-", "O-", "O-", "O-", "O-", "O-", "O-"),
  CanReceiveFrom = c("No", "No", "No", "No", "Yes", "Yes", "No", "No",
                     "No", "No", "No", "No", "Yes", "Yes", "No", "No",
                     "No", "No", "No", "No", "Yes", "Yes", "No", "No",
                     "No", "No", "No", "No", "Yes", "Yes", "No", "No",
                     "No", "No", "No", "No", "Yes", "Yes", "No", "No",
                     "No", "No", "No", "No", "Yes", "Yes", "No", "No",
                     "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes",
                     "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes")
)

server <- function(input, output, session) {
  output$data_table <- renderDT({
    datatable(data, options = list(
      searching = TRUE,  
      paging = TRUE,     
      ordering = TRUE,   
      lengthMenu = c(5, 10, 25, 30),  
      pageLength = 10  
    ))
  })
  
  output$compatibility_table <- renderDT({
    datatable(blood_compatibility_data, options = list(
      searching = TRUE,  
      paging = TRUE,     
      ordering = TRUE,   
      lengthMenu = c(5, 10, 25, 30),  
      pageLength = 10  
    ))
  })
}

ui <- fluidPage(
  tags$head(
    tags$style(
      HTML("
          .header {
             background: linear-gradient(to right, #c30010, #ff5733); 
             padding: 10px;
             border: 2px solid #ccc;
             text-align: center;
             color: white;
           }
           .content {
             padding: 20px;
           }
           h3, h5 {
             color: #c30010;
           }
           p {
             color: #333;
           }
           ul {
             list-style-type: square;
             margin-left: 20px;
           }
          ")
      )
  ),
  tags$div(
    class = "header",
    tags$h2("BLOOD DONAR DESK"),
    tags$blockquote("Once a blood donor, always a lifesaver."),
  ),
  
  navbarPage(
    "",
    tabPanel(
      "HOME",
      class = "content",
      tags$h3("Eligibility Criteria for Blood Donation "),
      tags$h5("Who are Eligible to Donate Blood?"),
      tags$p("Any healthy adult, both male and female, can donate every three months. Good health of the donor must be fully ensured. The universally accepted criteria for donor selection are:"),
      tags$ul(
        tags$li("Age between 18 and 60 years"),
        tags$li("Haemoglobin - not less than 12.5 g/Dl"),
        tags$li("Pulse - between 50 and 100/minute with no irregularities"),
        tags$li("Blood Pressure - Systolic 100-180 mm Hg and Diastolic 50 - 100 mm Hg"),
        tags$li("Temperature - Normal (oral temperature not exceeding 37.50C)"),
        tags$li("Body weight - not less than 45 Kg")
      ),
      tags$h5("Health Conditions Criteria:"),
      tags$ul(
        tags$li("Past one year - not been treated for Rabies or received Hepatitis B immune globulin."),
        tags$li("Past six months - not had a tattoo, ear or skin piercing or acupuncture, not received blood or blood products, no serious illness or major surgery, no contact with a person with hepatitis or yellow jaundice."),
        tags$li("Past three months - not donated blood or been treated for Malaria."),
        tags$li("Past one month - had any immunizations."),
        tags$li("Past 48 hours - taken any antibiotics or any other medications (Allopathic or Ayurveda or Sidha or Homeo)"),
        tags$li("Past 24 hours - taken alcoholic beverages"),
        tags$li("Present - not suffering from cough, influenza or sore throat, common cold"),
        tags$li("Women should not be pregnant or breast feeding her child"),
        tags$li("Women donor should not donate during her menstrual cycles"),
        tags$li("Free from Diabetes, not suffering from chest pain, heart disease or high BP, cancer, blood clotting problem or blood disease, unexplained fever, weight loss, fatigue, night sweats, enlarged lymph nodes in armpits, neck or groin, white patches in the mouth etc."),
        tags$li("Ever had TB, bronchial asthma or allergic disorder, liver disease, kidney disease, fits or fainting, blue or purple spots on the skin or mucous membranes, received human pituitary - growth hormones etc.")
      )
    ),
    tabPanel(
      "COMPATIBILITY",
      class = "content",
      tags$b("BLOOD TYPE COMPATIBILITY"),
      br(),
      DTOutput("compatibility_table")
    ),
    tabPanel(
      "DONAR-LIST",
      class = "content",
      DTOutput("data_table")
    )
  )
)

shinyApp(ui, server)
