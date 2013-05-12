select * from Section

insert into Section
values(11, 1, 'Front', 300) 

insert into Section
values(11, 2, 'Middle', 300) 

insert into Section
values(11, 3, 'BackEnd', 200) 

insert into AvailableTickets
values(21, 7, 200, 0, 55.00)

insert into AvailableTickets
values(21, 8, 200, 0, 40.00)

insert into AvailableTickets
values(21, 9, 100, 0, 15.00)

delete from AvailableTickets
where eventID = 11

select * from AvailableTickets

LIKE '%" + EventName + "%'
select e.name as 'Event', c.name as 'Artist', e.startDate as 'Date', e.startTime as 'Time', v.name as 'Venue', a.price as 'Ticket Price', a.ticketsAvail as 'Available Tickets' from [Event] as e, [Venue] as v, [AvailableTickets] as a, [Artist] as c where e.venueID = v.venueID and e.eventID = a.eventID and e.artistID = c.artistID 

update AvailableTickets 
set ticketsAvail = 2000
where eventID = 13 and sectionID = 3

select e.name as 'Event', c.name as 'Artist', 
e.startDate as 'Date', e.startTime as 'Time',
 v.name as 'Venue', a.price as 'Ticket Price', 
 s.name as 'Seat Section' from [Event] as e,
 [Venue] as v, [Section] as s, [AvailableTickets] as a, [Artist] as c 
 where e.venueID = v.venueID and e.eventID = a.eventID and a.sectionID = s.sectionID
 and e.artistID = c.artistID and a.price between 10 and 45
 order by a.price ASC

 select * from AvailableTickets
 where price between 10 and 45
 order by price ASC