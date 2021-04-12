using DataAccessDemo.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Assignement
{
    public class Attendance
    {
        public Attendance(string rollNo, string name, string className, bool status)
        {
            this.RollNo = rollNo;
            this.LastName = name;
            ClassName = className;
            Status = status;
        }

        public String RollNo { get; set; }
        public String LastName { get; set; }
        public String ClassName { get; set; }
        public Boolean Status { get; set; }

    }
    public class ListAttendance
    {
       //public static List<Attendance> ListALL(int ClassID,int TeachID)
       // {
       //     List<Attendance> cl = new List<Attendance>();
       //     DataTable dt = DAO.GetListAttenByClassid(ClassID,TeachID);
       //     foreach (DataRow dr in dt.Rows)
       //         cl.Add(new Attendance(
       //            dr["RollNo"].ToString(),
       //             dr["LastName"].ToString(),
       //             dr["ClassName"].ToString(),
       //             Convert.ToBoolean(dr["Status"])
       //             ));
       //     return cl;
       // }
    }
}