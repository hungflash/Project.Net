
CREATE TABLE Customer (
        CUSId INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
        ,CUSKey AS 'HE' + RIGHT('000000' + CONVERT(VARCHAR(10), CUSId),6) PERSISTED
        ,CusName VARCHAR(50)
        ,mobileno INT
        ,Gender VARCHAR(10)
        )
		INSERT CUSTOMER DEFAULT VALUES
		select * from Customer


		select * from Course
		select * from Grade
		select * from Term
		select * from Student
		select * from Mark
		select * from MarkDetails


		select * from Student s, Course c, Grade g
		where 


use [master]
GO
drop database AssignmentPRN292
GO
create database AssignmentPRN292
GO
use [AssignmentPRN292]
GO


		create table Term(
		TermID int primary key identity(1,1) not null,
		Title nvarchar(100)
		);
		GO
		create table Course(
		CourseID int primary key identity(1,1) not null,
		CourseCode nvarchar(50),
		Title nvarchar(100),
		SLotCount  int,
		StartDate date,
		EndDate date,
		TermID int foreign key references Term(TermID) not null
		);
		GO
		create table Class(
		ClassID int primary key identity(1,1) not null,
		ClassName nvarchar(100),

		);
		
		GO
		create table Student(
		StudentID int primary key identity(1,1) not null,
		RollNo AS 'HE' + RIGHT('140000' + CONVERT(VARCHAR(10), StudentID),6) PERSISTED,
		FirstName nvarchar(100),
		LastName nvarchar(100),
		Birth date,
		Adress nvarchar(200),
		Phone nvarchar(50),
		TermID int foreign key references Term(TermID) not null,
		AccountName nvarchar(50) not null,
		Passwords nvarchar(20) not null,
		ClassID int foreign key references Class(ClassID) not null,
		);
		GO
	
		create table Teacher(
			TeacherID int primary key identity(1,1) not null,
			TeacherName nvarchar(100),
			Passwords nvarchar(50)
		);
		GO
	
		GO
		create table ClassRoom(
		RoomID int primary key identity(1,1) not null,
		RoomName nvarchar(50),
		ClassID int foreign key references Class(ClassID) not null,
		);
		GO
		create table Slot(
			SlotID int primary key identity(1,1) not null,
			StartTime time,
			EndTime time
		);
		GO
		create table Schedule(
			ScheduleID int primary key identity(1,1) not null,
			TeacherID int foreign key references Teacher(TeacherID) not null,
			CourseID int foreign key references Course(CourseID) not null,
			ScheduleDate date,
			SlotID int foreign key references Slot(SlotID) not null,
			ClassID int foreign key references Class(ClassID) not null,
		);
		GO
		create table Attendance (
			ScheduleID int foreign key references Schedule(ScheduleID) not null,
			StudentID int foreign key references Student(StudentID) not null,
			[Status] bit,
			Note nvarchar(200)
		);
			
			insert into Slot(StartTime,EndTime) values('07:30:00','09:50:00')
			go
			insert into Slot(StartTime,EndTime) values('07:30:00','09:50:00')
			go
			insert into Teacher(TeacherName,Passwords) values('CHILP',123123)
			go
			insert into Teacher(TeacherName,Passwords) values('CHILP',123123)
			go
			insert into Term (Title) values('Spring2021')
			go
					insert into Course(CourseCode,Title,SLotCount,StartDate,TermID) values('PRN292','.NetAndC#',30,'2021-04-20','2021-06-20',1)
			go
			insert into Student(FirstName,LastName,Adress,Birth,Phone,TermID,AccountName,Passwords,ClassID) values('le','hung','Hoa Bing','2000-04-12',1231234,1,'hunglnhe141720','123123',1)
			go
			insert into Student(FirstName,LastName,Adress,Birth,Phone,TermID,AccountName,Passwords,ClassID) values('le','HA','Hoa Bing','2000-04-12',1231234,1,'HAlnhe141720','123123',1)
			go
			insert into Student(FirstName,LastName,Adress,Birth,Phone,TermID,AccountName,Passwords,ClassID) values('le','SE','Hoa Bing','2000-04-12',1231234,1,'SElnhe141720','123123',1)
			go
			insert into Course(CourseCode,Title,SLotCount,StartDate,EndDate,TermID)values('PRN292	','.netC#',30	,'2021-01-12'	,'2021-04-12',1)
			go
			insert into Schedule(CourseID,ClassID,ScheduleDate,SlotID,TeacherID) values(1,1,'2021-04-20',1,1)


		select * from Term
		select * from Course
		select * from Student 
		select * from Class
		
		select * from ClassRoom
		select * from Teacher where TeacherName='CHILP' and Passwords='123123'
		select SlotID from Slot
		select * from Schedule
		select * from Attendance

		select s.RollNo,s.FirstName,s.LastName,c.ClassName from   Student s, Class c
		where 


		select s.ScheduleDate,s.SlotID,st.RollNo, st.FirstName,st.LastName,a.Status,a.Note from Schedule s, Attendance a, Student st
		where s.ScheduleID=a.ScheduleID and a.StudentID=st.StudentID
		select * from Schedule
		select * from Student where FirstName='hung' and las
		select * from Schedule s, Teacher t where s.TeacherID =  t.TeacherID
		select ClassName ,Class.ClassID  from Schedule inner join Class on Schedule.ClassID = Class.ClassID  
		inner join Teacher on Teacher.TeacherID=1
		select  s.RollNo,s.FirstName ,ClassName ,[Status] from ClassMember left join Class on 4 = ClassMember.ClassID
		inner join Attendance on Attendance.StudentID= s.StudentID
		inner join Schedule on Schedule.ScheduleID = Attendance.ScheduleID where TeacherID=1

		select * from Student  where 2=Student.ClassID
		select * from Class where ClassID=2
		select * from Student
			select ClassName ,Class.ClassID   from Schedule inner join Class on Schedule.ClassID = Class.ClassID  
		inner join Teacher on Teacher.TeacherID=1

		select s.RollNo,s.LastName,ClassName from Class 
		, Student s where Class.ClassID=1

		select s.RollNo,s.LastName,ClassName,Attendance.[Status] from Class 
		inner join Student s on Class.ClassID=s.ClassID
		inner join Attendance on Attendance.StudentID= s.StudentID 
		inner join Schedule on Schedule.ScheduleID = Attendance.ScheduleID
		inner join Teacher on Schedule.TeacherID=Teacher.TeacherID
		where Teacher.TeacherID=1 and Class.ClassID=2
		select s.* from Class inner join Student s on s.ClassID=Class.ClassID where Class.ClassID=1 
		select * from Student where AccountName='hunglnhe141720'and Passwords='123123'
	SELECT DISTINCT ClassName ,Class.ClassID   from Schedule inner join Class on Schedule.ClassID = Class.ClassID  
		inner join Teacher on Teacher.TeacherID=1

		update Attendance set [Status] =1 from  Attendance inner join Student on Student.StudentID =Attendance.StudentID
		where Student.RollNo='HE400004'
		select Student.AccountName,Term.TermID,Term.Title from Student ,Term where AccountName='hunglnhe141720'
		
		select Course.CourseID,Course.CourseCode,Course.Title,Class.ClassName,Course.StartDate,Student.AccountName,Term.TermID from Term inner join Course on Term.TermID= Course.TermID
			 inner join Student on Term.TermID= Student.TermID 
			 inner join Class on Student.ClassID=Class.ClassID
			where  Student.AccountName='hunglnhe141720' and Term.TermID=1
		
			select distinct Schedule.ScheduleDate AS [DATE],Slot.SlotID as SLOT,ClassRoom.RoomName as ROOM,Teacher.TeacherName as LECTURER,Class.ClassName as CLASSNAME,Attendance.[Status] as [ATTEDANCE STATUS] ,Attendance.Note as [LECTURER'S COMMENT] from Schedule
		     inner join Attendance on Schedule.ScheduleID=Attendance.ScheduleID
			inner join Student on Attendance.StudentID=Student.StudentID 
			inner join Term on Term.TermID=Student.TermID
			inner join Course on Course.CourseID= Schedule.CourseID
			inner join Slot on Slot.SlotID=Schedule.SlotID
			inner join Class on Class.ClassID=Schedule.ClassID
			inner join ClassRoom on Class.ClassID=ClassRoom.ClassID
			inner join Teacher on Teacher.TeacherID=Schedule.TeacherID
			where Student.AccountName='hunglnhe141720' and Term.TermID=1 and Course.CourseID=1 order by Schedule.ScheduleDate asc
			--,ClassRoom.RoomName,Teacher.TeacherName ,Class.ClassName,
				select FirstName,LastName,Birth,Adress,Phone,TermID,AccountName,Passwords,ClassID from Student where ClassID=2

		
			insert into Student(FirstName,LastName,Adress,Birth,Phone,TermID,AccountName,Passwords,ClassID) values('le','SE','Hoa Bing','2000-04-12',1231234,1,'SElnhe141720','123123',1)
			select * from Class


			select distinct Schedule.ScheduleDate AS [DATE],Slot.SlotID as SLOT,Class.ClassName,ClassRoom.RoomName as ROOM ,Course.CourseCode  from Schedule
			 join Slot on Slot.SlotID=Schedule.SlotID
			 join Class on Class.ClassID=Schedule.ClassID
			 join Teacher on Teacher.TeacherID=Schedule.TeacherID
			   join Course on Course.CourseID= Schedule.CourseID
			  join ClassRoom on Class.ClassID=ClassRoom.ClassID
			where Teacher.TeacherName='CHILP' and Schedule.ScheduleDate='2021-04-20' order by SLOT asc
			
			
					select s.RollNo,s.LastName,ClassName,Attendance.[Status] from Class 
				inner join Student s on Class.ClassID=s.ClassID
				inner join Attendance on Attendance.StudentID= s.StudentID 
				inner join Schedule on Schedule.ScheduleID = Attendance.ScheduleID
				inner join Teacher on Schedule.TeacherID=Teacher.TeacherID
				where Teacher.TeacherID=1 and Class.ClassID=2

				select distinct s.RollNo,s.LastName,ClassName,Attendance.[Status] from Class 
		inner join Student s on Class.ClassID=s.ClassID
		inner join Attendance on Attendance.StudentID= s.StudentID 
		inner join Schedule on Schedule.ScheduleID = Attendance.ScheduleID
		inner join Slot on Slot.SlotID = Schedule.SlotID
		inner join Teacher on Schedule.TeacherID=Teacher.TeacherID
		where Teacher.TeacherID=1 and Class.ClassID=1 and Schedule.ScheduleDate='2021-04-20' and slot.SlotID=2 order by s.RollNo desc

		update Attendance set [Status] =0 from  Attendance inner join Student on Student.StudentID =Attendance.StudentID
		inner join Schedule on Schedule.ScheduleID = Attendance.ScheduleID
		inner join Teacher on Teacher.TeacherID=Schedule.TeacherID
        where Student.RollNo = 'HE400005' and Schedule.ScheduleDate='2021-04-20'and Schedule.ClassID=1 and Schedule.SlotID=2 and Teacher.TeacherID=1
			
				
			