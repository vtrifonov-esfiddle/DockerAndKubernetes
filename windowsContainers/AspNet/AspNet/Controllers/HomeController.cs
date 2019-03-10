using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AspNet.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {

            ViewBag.Message = "Your contact page.";

            return View();
        }

        private int GetCount()
        {
            using (var connectionString = new SqlConnection(ConfigurationManager.ConnectionStrings["CounterDataDb"].ConnectionString))
            using (var command = new SqlCommand("SELECT TOP 1 [Count] FROM dbo.Counts", connectionString))
            {
                connectionString.Open();
                int count = (int)command.ExecuteScalar();
                return count;
            }
        }

        public ActionResult Count()
        {            
            ViewBag.Count = GetCount();
            return View();            
        }

        public ActionResult UpdateCount()
        {
            using (var connectionString = new SqlConnection(ConfigurationManager.ConnectionStrings["CounterDataDb"].ConnectionString))
            using (var command = new SqlCommand("UPDATE dbo.Counts SET [Count] = @Count;", connectionString))
            {
                int increasedCount = GetCount() + 1;
                command.Parameters.Add(new SqlParameter("@Count", increasedCount));
                connectionString.Open();
                command.ExecuteNonQuery();
                ViewBag.Count = increasedCount;
                return View("Count");
            }
        }
    }
}