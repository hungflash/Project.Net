
// This is a personal academic project. Dear PVS-Studio, please check it.

// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Assignement;

namespace DataAccessDemo.DataAccess
{
    class DAO
    {
        public static SqlConnection GetConnection()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["NameDatabase"].ToString();
            return new SqlConnection(ConnectionString);
        }

        //thuc thi cau select trong string sql, tra ve 1 DataTable chua du lieu doc dc
        public static DataTable GetDataBySQL(string sql)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);
            return ds.Tables[0];
        }

        internal static DataTable LoadAttendanceDetails(int termID, int courseID, string stuName)
        {
            String sql = @"	select distinct Schedule.ScheduleDate AS [DATE],Slot.SlotID as SLOT,ClassRoom.RoomName as ROOM,Teacher.TeacherName as LECTURER,Class.ClassName as CLASSNAME,Attendance.[Status] as [ATTEDANCE STATUS] ,Attendance.Note as [LECTURER'S COMMENT] from Schedule
		     inner join Attendance on Schedule.ScheduleID=Attendance.ScheduleID
			inner join Student on Attendance.StudentID=Student.StudentID 
			inner join Term on Term.TermID=Student.TermID
			inner join Course on Course.CourseID= Schedule.CourseID
			inner join Slot on Slot.SlotID=Schedule.SlotID
			inner join Class on Class.ClassID=Schedule.ClassID
			inner join ClassRoom on Class.ClassID=ClassRoom.ClassID
			inner join Teacher on Teacher.TeacherID=Schedule.TeacherID
			where Student.AccountName=@Stu and Term.TermID=@Term and Course.CourseID=@Cour order by Schedule.ScheduleDate asc";
            SqlParameter s = new SqlParameter("@Stu", SqlDbType.NVarChar);
            SqlParameter s1 = new SqlParameter("@Cour", SqlDbType.Int);
            SqlParameter s2 = new SqlParameter("@Term", SqlDbType.Int);
            s.Value = stuName;
            s1.Value = courseID;
            s2.Value = termID;
            return getOrderData(sql, s, s1, s2);
        }

        public static DataTable GetListAttenByClassid(int classid, int TeachID)
        {
            String sql = @"select s.RollNo,s.LastName,ClassName,Attendance.[Status] from Class 
		inner join Student s on Class.ClassID=s.ClassID
		inner join Attendance on Attendance.StudentID= s.StudentID 
		inner join Schedule on Schedule.ScheduleID = Attendance.ScheduleID
		inner join Teacher on Schedule.TeacherID=Teacher.TeacherID
		where Teacher.TeacherID=@TeachID and Class.ClassID=@Name";
            SqlParameter p = new SqlParameter("Name", SqlDbType.Int);
            SqlParameter p1 = new SqlParameter("TeachID", SqlDbType.Int);
            p.Value = classid;
            p1.Value = TeachID;
            return getOrderData(sql, p, p1);
        }
        public static DataTable LoadStudent(int ClassID) {
            String slq = "select FirstName,LastName,Birth,Adress,Phone,TermID,AccountName,Passwords,ClassID from Student where ClassID=" + ClassID;
            return GetDataBySQL(slq);
        }
        public static DataTable LoadClass()
        {
            String sql = "select * from Class";
            return GetDataBySQL(sql);
        }

        public static int ExecuteSQL(string sql, params SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            command.Parameters.AddRange(parameters);
            command.Connection.Open();
            int count = command.ExecuteNonQuery();
            command.Connection.Close();
            return count;
        }
        public static int UpdateAttendance(String RollNum, bool Status)
        {
            String sql = @"update Attendance set [Status] =@STU from  Attendance inner join Student on Student.StudentID =Attendance.StudentID

        where Student.RollNo = @Roll";
            SqlParameter p = new SqlParameter("@STU", SqlDbType.Bit);
            SqlParameter p1 = new SqlParameter("@Roll", SqlDbType.NVarChar);
            p.Value = Status;
            p1.Value = RollNum;
            return ExecuteSQL(sql, p, p1);
        }
        public static DataTable GetClassByTeachID(int TeachID)
        {
            string sql = @"	select DISTINCT ClassName ,Class.ClassID   from Schedule inner join Class on Schedule.ClassID = Class.ClassID  
		inner join Teacher on Teacher.TeacherID= " + TeachID;
            return GetDataBySQL(sql);
        }
        public static DataTable getOrderData(string sql, params SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            command.Parameters.AddRange(parameters);
            command.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            command.Connection.Close();
            return ds.Tables[0];
        }
        public static int LogginStu(String user, String pass)
        {
            string sql = "select * from AccountSS where Account=@name and Passwords = @pass";
            SqlParameter parameter = new SqlParameter("name", SqlDbType.NVarChar);
            parameter.Value = user;
            SqlParameter parameter1 = new SqlParameter("pass", SqlDbType.NVarChar);
            parameter1.Value = pass;
            return ExecuteSQL(sql, parameter, parameter1);
        }
        public static int LogginTeac(String user, String pass)
        {
            string sql = "select * from AccountSS where Account=@Name and Passwords=@pass and permisstion=1";
            SqlParameter parameter = new SqlParameter("Name", SqlDbType.NVarChar);
            parameter.Value = user;
            SqlParameter parameter1 = new SqlParameter("pass", SqlDbType.NVarChar);
            parameter1.Value = pass;
            return ExecuteSQL(sql, parameter, parameter1);
        }
        //public static Account Login(string username, string password)
        //{
        //    SqlParameter[] param = {new SqlParameter("@user",SqlDbType.NVarChar),
        //                            new SqlParameter("@pass",SqlDbType.NVarChar)};
        //    param[0].Value = username;
        //    param[1].Value = password;
        //    DataTable dt = getOrderData("select * from Student where AccountName=@user and Passwords=@pass", param);


        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        return new Account(Convert.ToInt32(dr["StudentID"]),dr["AccountName"].ToString(), dr["Passwords"].ToString());
        //    }
        //    return null;
        //}
        //public static DataTable LoadTerm(String Name)
        //{
        //    String sql = "select Student.AccountName,Term.TermID,Term.Title from Student ,Term where AccountName=@Name";
        //    SqlParameter p = new SqlParameter("Name", SqlDbType.NVarChar);
        //    p.Value = Name;
        //    return getOrderData(sql, p);    
        //}
        public static DataTable LoadTerm()
        {
            String sql = "select * from Term";
            return GetDataBySQL(sql);
        }
        public static DataTable LoadCourse(String Name, int Term)
        {
            String sql = @"select Course.CourseID,Course.CourseCode,Course.Title,Class.ClassName,Course.StartDate,Student.AccountName,Term.TermID from Term inner join Course on Term.TermID= Course.TermID
			 inner join Student on Term.TermID= Student.TermID 
			 inner join Class on Student.ClassID=Class.ClassID
			where  Student.AccountName=@Name and Term.TermID=@TermID";
            SqlParameter p = new SqlParameter("@Name", SqlDbType.NVarChar);
            SqlParameter p1 = new SqlParameter("@TermID", SqlDbType.Int);
            p.Value = Name;
            p1.Value = Term;
            return getOrderData(sql, p, p1);
        }
        public static Teacher LoginTeacher(string username, string password)
        {
            SqlParameter[] param = {new SqlParameter("@user",SqlDbType.NVarChar),
                                    new SqlParameter("@pass",SqlDbType.NVarChar)};
            param[0].Value = username;
            param[1].Value = password;
            DataTable dt = getOrderData("select * from Teacher where TeacherName=@user and Passwords=@pass", param);


            foreach (DataRow dr in dt.Rows)
            {
                return new Teacher(Convert.ToInt32(dr["TeacherID"]), dr["TeacherName"].ToString(), dr["Passwords"].ToString());
            }
            return null;
        }
        public static int AddStudent(String firstn, String lastName, String d, String address, String phonenumber, int term, String acc, String pass, int classID) {
            String sql = @"insert into Student(FirstName,LastName,Adress,Birth,Phone,TermID,AccountName,Passwords,ClassID) values
            (@F,@L,@A,@B,@P,@T,@account,@Pass,@C)";
            SqlParameter s = new SqlParameter("@F",SqlDbType.NVarChar);
            SqlParameter s1 = new SqlParameter("@L",SqlDbType.NVarChar);
            SqlParameter s2 = new SqlParameter("@A",SqlDbType.NVarChar);
            SqlParameter s3 = new SqlParameter("@B",SqlDbType.NVarChar);
            SqlParameter s4 = new SqlParameter("@P",SqlDbType.NVarChar);
            SqlParameter s5 = new SqlParameter("@T",SqlDbType.Int);
            SqlParameter s6 = new SqlParameter("@account", SqlDbType.NVarChar);
            SqlParameter s7 = new SqlParameter("@Pass", SqlDbType.NVarChar);
            SqlParameter s8 = new SqlParameter("@C",SqlDbType.Int);
            s.Value = firstn;
            s1.Value = lastName;
            s2.Value = address;
            s3.Value = d;
            s4.Value = phonenumber;
            s5.Value = term;
            s6.Value = acc;
            s7.Value = pass;
            s8.Value = classID;
            return ExecuteSQL(sql, s, s1, s2, s3, s4, s5, s6, s7, s8);
    }
        public static DataTable GetSchedule(String TeacherName, String d)
        {
            String sql = @"select distinct Schedule.ScheduleDate AS [DATE],Slot.SlotID as SLOT,Class.ClassName,ClassRoom.RoomName as ROOM ,Course.CourseCode  from Schedule
			 join Slot on Slot.SlotID=Schedule.SlotID
			 join Class on Class.ClassID=Schedule.ClassID
			 join Teacher on Teacher.TeacherID=Schedule.TeacherID
			   join Course on Course.CourseID= Schedule.CourseID
			  join ClassRoom on Class.ClassID=ClassRoom.ClassID
			where Teacher.TeacherName=@T and Schedule.ScheduleDate=@D order by SLOT asc ";
            SqlParameter s = new SqlParameter("@T", SqlDbType.NVarChar);
            SqlParameter s1 = new SqlParameter("@D", SqlDbType.NVarChar);
            s.Value = TeacherName;
            s1.Value = d;
            return getOrderData(sql, s, s1);
        }
    }
}
