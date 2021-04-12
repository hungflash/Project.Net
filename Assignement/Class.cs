using DataAccessDemo.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Assignement
{
    public class Class
    {
        public Class(int classID, string className)
        {
            ClassID = classID;
            ClassName = className;
        }

        public int ClassID { get; set; }
        public String ClassName { get; set; }

    }
    public class ClassList
    {
        public static List<Class> GetClassByTeachID(int TeachID)
        {
            List<Class> cl = new List<Class>();
            DataTable dt = DAO.GetClassByTeachID(TeachID);
                 foreach (DataRow dr in dt.Rows)
                cl.Add(new Class(
                    Convert.ToInt32(dr["ClassID"]),
                    dr["ClassName"].ToString()
                    ));
            return cl;
        }
    }
}