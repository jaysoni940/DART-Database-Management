CS 6360 Database Design Project: Dallas Area Road Transport

Professor: Dr. Wei Li Wu

Dallas Area Road Transport or DART would like one relational database to store the information about their bus transportation system to be able to carry out
their work in an organized way. The DART has some major modules such as Bus, Person (Employee and Passenger) and Ticket Sales. A Person can be an Employee or
an A-class Passenger. A person can be both an employee and an A-Class passenger. Details of a person such as Person ID, Name (First, Middle, Last), Address, 
Gender, Date of Birth (Must be 16 years or older), and Phone number (one person can have more than one phone number) are recorded. The Person ID should have 
the format “PXXX” where X is a number from 0 to 9. (Hint: you can use regexp_like() function).Employee can only be one of following three types: classified as 
Bus Drivers, Staff (sells tickets or passes) and Ticket checkers. The start date of the employee is recorded. One bus driver can drive multiple buses and 
multiple drivers can drive one bus but on different dates. But for each day, a driver can only drive one particular bus. One bus will always have one particular
ticket checker. Payment information such as ID, method (cash or card), amount and other information are recorded. Ticket details such as Ticket ID, Bus ID, 
seat number and price are stored. The staff sells daily tickets to a person and the staff details, ticket details, person details and payment details are stored.

An A-Star passenger is someone who has some extra privileges than an A-Class passenger. An A-Star Passenger can be an Employee or an A-Class passenger or both. 
Different passes are issued by DART. An A-Class passenger can buy only one pass in a month, but an A-Star Passenger can buy multiple passes in a month. Each 
A-Star Passenger is issued a travel card. The travel card details such as card ID, date of issue and other information are stored. Card ID is not unique and is
associated with A-Star Passenger.

Sometimes promotional discounts are offered on the travel cards and details such promotion ID and promotion description are recorded. The Promotional IDs are not 
unique and different travel cards may have discounts with the same Promotional IDs. A-Star passengers can have guests who travel for free with them four times a 
month. A Guest info log is maintained which stores information such as passenger ID, guest ID, guest name, guest address, and guest contact information. Guest IDs
are temporary IDs that a person gets when they travel as a guest of an A-Star passenger. Each guest ID is not unique and cannot be used to identify a guest.

Bus details such as Bus Number, License plate number, number of seats and other information are stored. Each route has many bus stops. One bus stop is part of 
only one route. The route and bus stop details are stored. Each bus is parked in a terminal and the information of the terminal such as Terminal ID, Location, 
Date and Time are stored.

Each bus drives on one particular route and follows a particular timetable. The timetable information such as day and start time, end time and intervals 
(15 min, 20 min, 30 min) are recorded. Values for ‘day’ can be {M,T,W,Th,F,Sat,Sun}. A unique ID in the form of “DTXX” is given to each unique record in the 
timetable. For example, Day-{M}, StartTime- 10:00, EndTime – 20:00, Interval - 15m can have ID DT01 and so on. A bus may have different StartTime, EndTime or 
Interval for different days.
