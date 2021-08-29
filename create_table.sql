USE [LandonHotel]
GO

/****** Object:  Table [dbo].[RoomReservation]    Script Date: 7/28/2021 10:44:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RoomReservations](
	[ReservationID] [int] IDENTITY(1000,1) NOT NULL,
	[CheckIn] [datetime2](7) NOT NULL,
	[CheckOut] [datetime2](7) NOT NULL,
	[RoomNo] [char](10) NOT NULL,
	[GuestID] [int] NOT NULL,
 CONSTRAINT [PK_RoomReservation] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomReservation_Landon_Guests] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Landon_Guests] ([GuestID])
GO

ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK_RoomReservation_Landon_Guests]
GO


SELECT * FROM dbo.RoomReservation