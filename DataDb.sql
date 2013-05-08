select * from AvailableTickets

select * from Venue

select * from Event

select * from Address

select * from StateProvince

Select * from Section

Select * from SectionType

select * from AddressType

insert into AddressType
values('Physical')

insert into SectionType
Values('Backend')

insert into Section
Values(11, 1, 'FrontSec', 3000)

insert into Section
Values(11, 2, 'MidSection', 3000)

insert into Section
Values(11, 3, 'Backend', 2000)

insert into AvailableTickets
Values(11, 17, 3000, 0, 60.00)

insert into AvailableTickets
Values(11, 18, 3000, 0, 40.00) 

insert into AvailableTickets
Values(11, 19, 2000, 0, 15.00)    

select address1 from Address where addressID = 7



