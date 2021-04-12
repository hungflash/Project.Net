using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignement
{
    public class Account
    {
        public Account() { }
        public Account(int stuid,string accountName, string password)
        {
            this.StuID = stuid;
            this.accountName = accountName;
            this.password = password;
        }

        public int StuID { get; set; }
        public String accountName { get; set; }
            public String password { get; set; }

    }
}