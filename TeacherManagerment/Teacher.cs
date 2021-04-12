using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignement
{
    public class Teacher
    {
        public int TeacherID;
        public String TeacherName;
        public String Paswords;

        public Teacher()
        {
        }

        public Teacher(int teacherID, string teacherName, string paswords)
        {
            TeacherID = teacherID;
            TeacherName = teacherName;
            Paswords = paswords;
        }
    }
}