EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'HGP_CAPSTONE'
GO
USE [master]
GO
ALTER DATABASE [HGP_CAPSTONE] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [HGP_CAPSTONE]
GO

USE Master
GO
CREATE DATABASE [HGP_CAPSTONE]
GO
USE [HGP_CAPSTONE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
    DROP TABLE [dbo].[Event]
GO
CREATE TABLE [dbo].[Event] (
[eventID] INTEGER  IDENTITY  NOT NULL  
, [artistID] INTEGER  NOT NULL  
, [venueID] INTEGER  NOT NULL  
, [name] VARCHAR(50)  NOT NULL  
, [startDate] DATETIME  NOT NULL  
, [endDate] DATETIME  NOT NULL  
, [startTime] DATETIME  NOT NULL  
, [endTime] DATETIME  NOT NULL  
)
GO

ALTER TABLE [dbo].[Event] ADD CONSTRAINT [Event_PK] PRIMARY KEY CLUSTERED (
[eventID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Discounts]') AND type in (N'U'))
    DROP TABLE [dbo].[Discounts]
GO
CREATE TABLE [dbo].[Discounts] (
[discountID] INTEGER  IDENTITY  NOT NULL  
, [discount] VARCHAR(10)  NOT NULL  
, [value] DECIMAL(10,2)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Discounts] ADD CONSTRAINT [Discounts_PK] PRIMARY KEY CLUSTERED (
[discountID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artist]') AND type in (N'U'))
    DROP TABLE [dbo].[Artist]
GO
CREATE TABLE [dbo].[Artist] (
[artistID] INTEGER  IDENTITY  NOT NULL  
, [name] VARCHAR(30)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Artist] ADD CONSTRAINT [Artist_PK] PRIMARY KEY CLUSTERED (
[artistID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))
    DROP TABLE [dbo].[Login]
GO
CREATE TABLE [dbo].[Login] (
[custID] INTEGER  NOT NULL  
, [hash] VARCHAR(128)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Login] ADD CONSTRAINT [Login_PK] PRIMARY KEY CLUSTERED (
[hash]
, [custID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
    DROP TABLE [dbo].[Customer]
GO
CREATE TABLE [dbo].[Customer] (
[custID] INTEGER  IDENTITY  NOT NULL  
, [email] NVARCHAR(256)  NOT NULL  
, [firstName] VARCHAR(20)  NULL  
, [lastName] VARCHAR(20)  NULL  
, [age] INTEGER  NULL  
, [isMember] BIT  NULL  
, [getsNewsletter] BIT  NULL  
)
GO

ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [Customer_PK] PRIMARY KEY CLUSTERED (
[custID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard]') AND type in (N'U'))
    DROP TABLE [dbo].[CreditCard]
GO
CREATE TABLE [dbo].[CreditCard] (
[cardID] INTEGER  IDENTITY  NOT NULL  
, [cardNumberHash] VARCHAR(128)  NOT NULL  
, [cardTypeID] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[CreditCard] ADD CONSTRAINT [CreditCard_PK] PRIMARY KEY CLUSTERED (
[cardID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType]') AND type in (N'U'))
    DROP TABLE [dbo].[CreditCardType]
GO
CREATE TABLE [dbo].[CreditCardType] (
[cardTypeID] INTEGER  IDENTITY  NOT NULL  
, [name] VARCHAR(20)  NOT NULL  
)
GO

ALTER TABLE [dbo].[CreditCardType] ADD CONSTRAINT [CreditCardType_PK] PRIMARY KEY CLUSTERED (
[cardTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venue]') AND type in (N'U'))
    DROP TABLE [dbo].[Venue]
GO
CREATE TABLE [dbo].[Venue] (
[venueID] INTEGER  IDENTITY  NOT NULL  
, [name] VARCHAR(50)  NOT NULL  
, [addressID] INTEGER  NOT NULL  
, [phone] INTEGER  NOT NULL  
, [capacity] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Venue] ADD CONSTRAINT [Venue_PK] PRIMARY KEY CLUSTERED (
[venueID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Section]') AND type in (N'U'))
    DROP TABLE [dbo].[Section]
GO
CREATE TABLE [dbo].[Section] (
[sectionID] INTEGER  IDENTITY  NOT NULL  
, [venueID] INTEGER  NOT NULL  
, [sectionTypeID] INTEGER  NOT NULL  
, [name] CHAR(10)  NULL  
, [capacity] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Section] ADD CONSTRAINT [Section_PK] PRIMARY KEY CLUSTERED (
[sectionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StateProvince]') AND type in (N'U'))
    DROP TABLE [dbo].[StateProvince]
GO
CREATE TABLE [dbo].[StateProvince] (
[stateProvID] INTEGER  IDENTITY  NOT NULL  
, [statProvCode] CHAR(2)  NOT NULL  
, [regionCode] CHAR(2)  NOT NULL  
, [name] CHAR(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[StateProvince] ADD CONSTRAINT [StateProvince_PK] PRIMARY KEY CLUSTERED (
[stateProvID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AvailableTickets]') AND type in (N'U'))
    DROP TABLE [dbo].[AvailableTickets]
GO
CREATE TABLE [dbo].[AvailableTickets] (
[eventID] INTEGER  NOT NULL  
, [sectionID] INTEGER  NOT NULL  
, [ticketsAvail] INTEGER  NOT NULL  
, [ticketsSold] INTEGER  NOT NULL  
, [price] DECIMAL(10,2)  NOT NULL  
)
GO

ALTER TABLE [dbo].[AvailableTickets] ADD CONSTRAINT [AvailableTickets_PK] PRIMARY KEY CLUSTERED (
[eventID]
, [sectionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SectionType]') AND type in (N'U'))
    DROP TABLE [dbo].[SectionType]
GO
CREATE TABLE [dbo].[SectionType] (
[sectionTypeID] INTEGER  IDENTITY  NOT NULL  
, [name] VARCHAR(15)  NOT NULL  
)
GO

ALTER TABLE [dbo].[SectionType] ADD CONSTRAINT [SectionType_PK] PRIMARY KEY CLUSTERED (
[sectionTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
    DROP TABLE [dbo].[Address]
GO
CREATE TABLE [dbo].[Address] (
[addressID] INTEGER  IDENTITY  NOT NULL  
, [address1] VARCHAR(20)  NOT NULL  
, [address2] VARCHAR(20)  NULL  
, [city] CHAR(10)  NOT NULL  
, [postalCode] INTEGER  NOT NULL  
, [stateProvID] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Address] ADD CONSTRAINT [Address_PK] PRIMARY KEY CLUSTERED (
[addressID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType]') AND type in (N'U'))
    DROP TABLE [dbo].[AddressType]
GO
CREATE TABLE [dbo].[AddressType] (
[addressTypeID] INTEGER  IDENTITY  NOT NULL  
, [name] CHAR(10)  NOT NULL  
)
GO

ALTER TABLE [dbo].[AddressType] ADD CONSTRAINT [AddressType_PK] PRIMARY KEY CLUSTERED (
[addressTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
    DROP TABLE [dbo].[Orders]
GO
CREATE TABLE [dbo].[Orders] (
[orderID] INTEGER  IDENTITY  NOT NULL  
, [custID] INTEGER  NOT NULL  
, [orderTotal] DECIMAL(10,2)  NOT NULL  
, [isPickup] BIT  NOT NULL  
, [orderDate] DATETIME  NOT NULL  
, [orderTime] DATETIME  NULL  
, [discountID] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [Orders_PK] PRIMARY KEY CLUSTERED (
[orderID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
    DROP TABLE [dbo].[OrderDetail]
GO
CREATE TABLE [dbo].[OrderDetail] (
[eventID] INTEGER  NOT NULL  
, [sectionID] INTEGER  NOT NULL  
, [orderID] INTEGER  NOT NULL  
, [quantity] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[OrderDetail] ADD CONSTRAINT [OrderDetail_PK] PRIMARY KEY CLUSTERED (
[eventID]
, [sectionID]
, [orderID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAddress]') AND type in (N'U'))
    DROP TABLE [dbo].[CustomerAddress]
GO
CREATE TABLE [dbo].[CustomerAddress] (
[custID] INTEGER  NOT NULL  
, [addressID] INTEGER  NOT NULL  
, [addressTypeID] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[CustomerAddress] ADD CONSTRAINT [CustomerAddress_PK] PRIMARY KEY CLUSTERED (
[custID]
, [addressID]
)
GO
GO

ALTER TABLE [dbo].[Event] WITH CHECK ADD CONSTRAINT [Venue_Event_FK1] FOREIGN KEY (
[venueID]
)
REFERENCES [dbo].[Venue] (
[venueID]
)
ALTER TABLE [dbo].[Event] WITH CHECK ADD CONSTRAINT [Artist_Event_FK1] FOREIGN KEY (
[artistID]
)
REFERENCES [dbo].[Artist] (
[artistID]
)
GO

GO

GO

ALTER TABLE [dbo].[Login] WITH CHECK ADD CONSTRAINT [Customer_Login_FK1] FOREIGN KEY (
[custID]
)
REFERENCES [dbo].[Customer] (
[custID]
)
ON DELETE CASCADE
GO

GO

ALTER TABLE [dbo].[CreditCard] WITH CHECK ADD CONSTRAINT [CreditCardType_CreditCard_FK1] FOREIGN KEY (
[cardTypeID]
)
REFERENCES [dbo].[CreditCardType] (
[cardTypeID]
)
GO

GO

ALTER TABLE [dbo].[Venue] WITH CHECK ADD CONSTRAINT [Address_Venue_FK1] FOREIGN KEY (
[addressID]
)
REFERENCES [dbo].[Address] (
[addressID]
)
GO

ALTER TABLE [dbo].[Section] WITH CHECK ADD CONSTRAINT [Venue_Section_FK1] FOREIGN KEY (
[venueID]
)
REFERENCES [dbo].[Venue] (
[venueID]
)
ALTER TABLE [dbo].[Section] WITH CHECK ADD CONSTRAINT [SectionType_Section_FK1] FOREIGN KEY (
[sectionTypeID]
)
REFERENCES [dbo].[SectionType] (
[sectionTypeID]
)
GO

GO

ALTER TABLE [dbo].[AvailableTickets] WITH CHECK ADD CONSTRAINT [Section_AvailableTickets_FK1] FOREIGN KEY (
[sectionID]
)
REFERENCES [dbo].[Section] (
[sectionID]
)
ALTER TABLE [dbo].[AvailableTickets] WITH CHECK ADD CONSTRAINT [Event_AvailableTickets_FK1] FOREIGN KEY (
[eventID]
)
REFERENCES [dbo].[Event] (
[eventID]
)
GO

GO

ALTER TABLE [dbo].[Address] WITH CHECK ADD CONSTRAINT [StateProvince_Address_FK1] FOREIGN KEY (
[stateProvID]
)
REFERENCES [dbo].[StateProvince] (
[stateProvID]
)
GO

GO

ALTER TABLE [dbo].[Orders] WITH CHECK ADD CONSTRAINT [Discounts_Orders_FK1] FOREIGN KEY (
[discountID]
)
REFERENCES [dbo].[Discounts] (
[discountID]
)
ALTER TABLE [dbo].[Orders] WITH CHECK ADD CONSTRAINT [Customer_Orders_FK1] FOREIGN KEY (
[custID]
)
REFERENCES [dbo].[Customer] (
[custID]
)
GO

ALTER TABLE [dbo].[OrderDetail] WITH CHECK ADD CONSTRAINT [AvailableTickets_OrderDetail_FK1] FOREIGN KEY (
[eventID]
, [sectionID]
)
REFERENCES [dbo].[AvailableTickets] (
[eventID]
, [sectionID]
)
ALTER TABLE [dbo].[OrderDetail] WITH CHECK ADD CONSTRAINT [Orders_OrderDetail_FK1] FOREIGN KEY (
[orderID]
)
REFERENCES [dbo].[Orders] (
[orderID]
)
GO

ALTER TABLE [dbo].[CustomerAddress] WITH CHECK ADD CONSTRAINT [Address_CustomerAddress_FK1] FOREIGN KEY (
[addressID]
)
REFERENCES [dbo].[Address] (
[addressID]
)
ALTER TABLE [dbo].[CustomerAddress] WITH CHECK ADD CONSTRAINT [Customer_CustomerAddress_FK1] FOREIGN KEY (
[custID]
)
REFERENCES [dbo].[Customer] (
[custID]
)
ALTER TABLE [dbo].[CustomerAddress] WITH CHECK ADD CONSTRAINT [AddressType_CustomerAddress_FK1] FOREIGN KEY (
[addressTypeID]
)
REFERENCES [dbo].[AddressType] (
[addressTypeID]
)
GO

