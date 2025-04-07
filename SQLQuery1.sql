--Database Creation
use master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'EventEase')
DROP DATABASE EventEase
CREATE DATABASE EventEase

USE EventEase

--TABLE CREATION
CREATE TABLE Venue (
VenueID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
VenueName VARCHAR(250) NOT NULL,
Locations VARCHAR(250) NOT NULL,
Capacity INT NOT NULL,
ImageUrl VARCHAR (MAX) NOT NULL,

);

CREATE TABLE Events (
    EventID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    EventName VARCHAR(250) NOT NULL,
    EventDate DATE NOT NULL,
    Descriptions VARCHAR(250) NOT NULL, -- Fixed typo here
    VenueID INT
);

--we are going to change existing the table events 


--TABLE CREATION
CREATE TABLE Booking (
BookingID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
EventID INT,
VenueID INT,
BookingDate date

);

Alter table Events
ADD FOREIGN KEY (VenueID) REFERENCES Venue(VenueID) ON DELETE CASCADE;

Alter table Booking
ADD FOREIGN KEY (VenueID) REFERENCES Venue(VenueID) ON DELETE CASCADE;

--Altered table
Alter table Booking
ADD FOREIGN KEY (EventID) REFERENCES Events(EventID) ON DELETE NO ACTION;


-- Insert a venue
INSERT INTO Venue (VenueName, Locations, Capacity, ImageUrl)
VALUES ('Grand Hall', '123 Main Street, Saint Louis', 500, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.historichotels.org%2Fhotels-resorts%2Fst-louis-union-station-hotel-curio-collection-by-hilton%2Frestaurants%2Fgrand-hall-lounge.php&psig=AOvVaw2184eoInKAmUyr_bZlG8Qo&ust=1744046611062000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCODM4Y_2w4wDFQAAAAAdAAAAABAE');  --Junior here put an image url as a string ok

-- Insert an event linked to the correct venue
INSERT INTO Events (EventName, EventDate, Descriptions, VenueID)
VALUES ('Banquet de Maria 2025', '2025-06-15', 'Annual Acting Award Ceremony', 1);

-- Insert a booking linked to the correct event and venue
INSERT INTO Booking (EventID, VenueID, BookingDate) 
VALUES (1, 1, GETDATE());



SELECT * FROM Venue;
SELECT * FROM Events;
SELECT * FROM Booking;