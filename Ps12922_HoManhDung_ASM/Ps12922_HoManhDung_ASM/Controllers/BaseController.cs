using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Ps12922_HoManhDung_ASM.Constant;
using Ps12922_HoManhDung_ASM.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ps12922_HoManhDung_ASM.Controllers
{   
        [AuthenticationFilter]
        public abstract class BaseController : Controller
        {
            public BaseController()
            {
            }

            protected string GetUserName()
            {
                return HttpContext.Session.GetString(SessionKey.Nguoidung.UserName);
            }
            protected string GetFullName()
            {
                return HttpContext.Session.GetString(SessionKey.Nguoidung.FullName);
            }

            protected string GetKHEmail()
            {
                return HttpContext.Session.GetString(SessionKey.Khachhang.KH_Email);
            }
        }
    }